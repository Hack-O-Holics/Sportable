const userModel = require("../models/userModel")
const jwt = require("jsonwebtoken");
class Authentication{   
    constructor(){

    }
    GetUserFromJwtMiddleware(){

    }
   async UserFromJwtMiddleware(req,res,next){
       console.log("cookies",req.cookies);
        if(!req.cookies.token){return res.send("no token")}
        var token = req.cookies.token;//get the jwt token from the header bearer token
        console.log(token);

        let verifiedToken;
        try{
             verifiedToken=  jwt.verify(token,"ljkadkawdad");
             //console.log(verifiedToken);
             //set the user to the found user;
            
            console.log(verifiedToken.data.email);
             req.foundUser = await userModel.find({email:verifiedToken.data.email});
             if(!req.foundUser){
                 res.send("cant find user");
             }
             next();
        }
       
        catch(e){
            console.log(e);
            return res.send("invalid token  or error"+e);
        }
        
    }
    async Signup(user){
        console.log(user);
        var createdUser = await userModel.create({
            email:user.email,
            password:this.hashPassword(user.password),
            name:user.name
        })
        var token = this.generateToken(user);
        return token;
    }
    hashPassword(password){
        return password;
    }
    comparetoHashedPassword(password,hashedPassword){
        if(password === hashedPassword){
            return true;
        }
        return false;
    }
    async login(user){
        var foundUser = await userModel.findOne({email:user.email});
        console.log(foundUser);
        
        if(!foundUser){
            throw "Cant FInd user";
        }
        console.log("form password",user.password);
        console.log("saved",foundUser.password);
        if(this.comparetoHashedPassword(user.password,foundUser.password)){
            return this.generateToken(user);
        }
        else{
            throw "Invalid Password";
        }
    }
    generateToken(user){
        const data = {
            _id: user._id,
            name:user.name,
            email: user.email
        }
        const signature ="ljkadkawdad";//environment variable
        const expiration = "100h";
        return jwt.sign({ data, }, signature, { expiresIn: expiration });
    }
}


module.exports = new Authentication();