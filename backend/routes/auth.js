const express = require("express");
const User = require("../model/usermodel");
const bcryptjs = require("bcryptjs");

const authRouter = express.Router();

authRouter.post('/api/signup', async(req, res)=>{
    try{
        const {email,name,phone,password} = req.body;

        const existingUser = await User.findOne({email})
        if(existingUser){
            return res.status(400).json({msg:'User email is Already Exist'})
        }

        const hashPassword = await bcryptjs.hash(password,8);

        let user = new User({
            email,
            password: hashPassword,
            name,
            phone,
        });
        user = await user.save();
        res.json(user);

        // const user = new User(req.body);
        // const saveUser = await user.save();
        // res.json(saveUser);
        
    }
    catch(err){
        res.status(500).send(err);
    }
});


authRouter.get('/api/signup', async(req, res)=>{
    try{
        const userData = await User.find();
        res.send(userData)
    }
    catch(err){
        res.status(500).send(err);
    }
});


module.exports = authRouter;