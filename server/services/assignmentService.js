const assignmentModel = require("../models/assignmentModel");


class AssignmentService{
    constructor(){
       
        
    }
    async CreateAssignment(teacherUser, info) {
        var result           = '';
        var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        var charactersLength = characters.length;
        for ( var i = 0; i < length; i++ ) {
           result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        await assignmentModel.create({
            title:info.title,
            teacher:teacherUser._id,
            type:info.type,
            
            code:result,
            submit:[]
        });
        // title:String,
        // type:String,
        // code:String,
        // submit:[{
        //    user:{type:mongoose.Schema.Types.ObjectId, ref:"user"},
        //    videoURL:String
        // }]
    }
    async submit(user,assignmentCode,videoURL){
        var foundAssignment = await classModel.findOne({code:assignmentCode});
        foundAssignment.submit.push({user:user._id,videoURL:videoURL});
        foundAssignment.save();
    
    }
    
}
module.exports = new AssignmentService();