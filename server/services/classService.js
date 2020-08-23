
const classModel = require("../models/classModel");
class ClassService{
    constructor(){
       
        
    }
    async CreateClass(teacherUser, title) {
        var result           = '';
        var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        var charactersLength = characters.length;
        for ( var i = 0; i < length; i++ ) {
           result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        await classModel.create({
            classTitle:title,
            teacher:teacherUser._id,
            code:result
        });
        
    }
    async joinClass(user,classCode){
        var foundClass = await classModel.findOne({code:classCode});
        foundClass.student.push(user._id);
        user.class.push(foundClass._id);
        foundClass.save();
        user.save();
    }
    
}
module.exports =new ClassService();