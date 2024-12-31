const mongoose = require("mongoose");
const validator = require("validator");

const userSchema = new mongoose.Schema({
    name:{
        type: String,
        required: true,
        trim: true,
        minLength: 1,
        maxLength: 20,
    },
    email:{
        type: String,
        required: true,
        unique:[true, "Email is already used"],
        validate(value){
            if(!validator.isEmail(value)){
                throw new Error("Invalid Email")
            }
        }
    },
    phone:{
        type:String,
        min: 10, 
        required: true,
        unique: true,
    },
    password:{
        type:String,
        min:4,
        required: true,
    },
    address:{
        type: String,
        default: '',
    },
    type: {
        type: String,
        default:'user',
    }
})

const User = new mongoose.model("User",userSchema);

module.exports = User;