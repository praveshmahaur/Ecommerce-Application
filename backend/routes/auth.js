const express = require("express");
const User = require("../model/usermodel");
const bcryptjs = require("bcryptjs");
const jwt = require('jsonwebtoken');
const auth = require("../middlewares/auth");

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


authRouter.post('/api/signin', async(req,res)=>{
    try{
        const {email,password} = req.body;

        const user = await User.findOne({email:email});
        if(!user){
            return res.status(400).json({msg:'User doesn`t Exist'} )
        }

        const isMatch = await bcryptjs.compare(password,user.password);
        if(!isMatch){
            return res.status(400).json({msg:'password not matched'} )
        }

        const token = jwt.sign({id: user._id}, "passwordKey")
        res.json({token, ...user._doc});

    }catch(err){
        res.status(500).json({error: err.message});
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


authRouter.post("/tokenIsValid", async(req,res) => {
    try{
        const token = req.header('x-auth-token');
        if(!token) return res.json(false);
        const verified = jwt.verify(token, passwordKey);
        if(!verified) return res.json(false);
        const user = await User.findById(verified.id);
        if(!user) return res.json(false);
        res.json(true);
    }catch(e){
        res.status(500).json({error: e.message });
    }
});

// get user data
authRouter.get('/', auth, async (req, res)=>{
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token});
})

module.exports = authRouter;