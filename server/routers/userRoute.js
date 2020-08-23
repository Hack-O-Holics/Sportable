const express = require("express");
const multer = require("multer");
const AuthService = require("../services/Authentication");
const { UserFromJwtMiddleware } = require("../services/Authentication");
const assignmentModel = require("../models/assignmentModel");
const assignmentService = require("../services/assignmentService");
const storage = multer.diskStorage({
    destination:function(req,file,cb){
        cb(null, "./uploads");
    },
    filename:function(req, file,cb){
        cb(null, Date.now()+".jpg");
    }
})
const limits ={
    fieldSize: 1024*1024*1024*8
};
const uploads = multer({storage:storage,limits:limits});
var router = express.Router();
router.use(AuthService.UserFromJwtMiddleware);
router.get("/class",async function(req,res) {
    res.send("you got rickrolled");
});

router.post("/submit/:code",uploads.single("video"),async function(req,res){
    
    console.log("file",req.file.path);
    try{
        assignmentService.submit(req.user,req.params.code,req.file.path);
        res.send("submitted");
    }
    catch(e){
        console.log("error posting a video to assignment submission",e);
        res.send(e);
    }

    
})
module.exports = router;