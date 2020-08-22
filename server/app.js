var express = require("express");
var bodyParser = require("body-parser");
const mongoose = require("mongoose")

async function startServer(){
    var app = express();
    app.use("uploads",express.static("uploads"));
    
    app.use(bodyParser.json());
    app.use(bodyParser.urlencoded({extended:true}));
    const connection = await mongoose.connect("mongodb://localhost/student",{  useUnifiedTopology: true ,useNewUrlParser: true, useCreateIndex: true })
    
    let router = await require("./routers");
    app.use('/',router);
    app.listen(8080,function(err){
        if(err){
            console.log(err);
        }
        else{
            console.log("server is listening");
        }
    })

}
startServer();