const express = require('express');
const app = express();
const port = process.env.PORT || 8000;

app.use(express.json());

require("./db/connection.js")
const User = require("./model/usermodel.js")

const authRouter = require("./routes/auth.js")
app.use(authRouter);


// app.get('/',(req,res)=>{
//     res.send("Flutter with Node.js")
// })


app.listen(port, "0.0.0.0", ()=>{
    console.log(`connect to the port no. ${port}`)
})