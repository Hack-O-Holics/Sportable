const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
   email:String,
   password:String,
   name:String,
    class:[{type:mongoose.Schema.Types.ObjectId, ref:"class"}]
})
module.exports = mongoose.model("user",userSchema);