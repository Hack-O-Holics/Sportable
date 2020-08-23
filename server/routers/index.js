const express = require("express");
const multer = require("multer");
const AuthService = require("../services/Authentication")
const userRoute = require("./userRoute");
const storage = multer.diskStorage({
    destination:function(req,file,cb){
        cb(null, "./uploads");
    },
    filename:function(req, file,cb){
        cb(null, Date.now()+".jpg");
    }
})
var router = express.Router();
router.use("/user",userRoute);
router.post("/signup", async function(req,res){
    var user = {name: req.body.name, email: req.body.email, password:req.body.password}
    console.log(req.body);
    var  jwtToken = await AuthService.Signup(user)
    if(!jwtToken){
        res.send("failed to generate user and token")
    }
    else{
        res.cookie("token",jwtToken).send("account created successfully "+ jwtToken);
    }
 })
router.post("/login",async function(req,res){
    try{
        var user = {email: req.body.email, password:req.body.password}
        var jwtToken = AuthService.login(user);
        if(!jwtToken){
            return res.status(500).send("invalid password");
        }
        
        res.cookie("token",jwtToken).send("account verified successfully " + jwtToken);
    
    }
    catch(e){
        res.send(e);
        console.log(e);
    }
});


module.exports=router;