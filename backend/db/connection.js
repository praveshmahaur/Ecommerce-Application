const mongoose = require('mongoose');

mongoose.connect("mongodb://localhost:27017/ecommerceapp")
.then(()=>{
    console.log("Connected to the Database") 
})
.catch((err)=>{console.log(err)})