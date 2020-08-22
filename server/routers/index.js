const express = require("express");
const multer = require("multer");
const AuthService = require("../services/Authentication")
const storage = multer.diskStorage({
    destination:function(req,file,cb){
        cb(null, "./uploads");
    },
    filename:function(req, file,cb){
        cb(null, Date.now()+".jpg");
    }
})
var router = express.router();
router.post("signup", async function(req,res){
    var  jwtToken = await AuthService.Signup(req.body.user)
    if(!jwtToken){
        res.send("failed to generate user and token")
    }
    else{
        res.cookie("token",jwtToken).end();
    }
 })
router.post("login",async function(req,res){
    try{
        var jwtToken = AuthService.login(req.body.user);
        res.cookie("token",jwtToken).end();
    
    }
    catch(e){
        res.send(e);
        console.log(e);
    }
});
module.exports=router;