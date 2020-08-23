const mongoose = require("mongoose");

const assignmentSchema = mongoose.Schema({
   title:String,
   type:String,
   code:String,
   submit:[{
      user:{type:mongoose.Schema.Types.ObjectId, ref:"user"},
      videoURL:String
   }]
})
module.exports = mongoose.model("assignment",assignmentSchema);