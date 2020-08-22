const userModel = require("../models/userModel")
class Authentication{   
    constructor(){

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
        if(password == hashedPassword){
            return true;
        }
        return false;
    }
    async login(user){
        var foundUser = userModel.findOne({email:user.email});
        console.log(foundUser);
        
        if(!foundUser){
            throw "Cant FInd user";
        }
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