const mongoose = require("mongoose");
const { stringify } = require("querystring");

const classSchema = mongoose.Schema({
   teacher:{type:mongoose.Schema.Types.ObjectId, ref:"user"},
   student :[{type:mongoose.Schema.Types.ObjectId, ref:"user"}],
    classTitle:String,
   code:String,
   assignments:[{type:mongoose.Schema.Types.ObjectId, ref:"user"}]
})
module.exports = mongoose.model("class",classSchema);