const mongoose = require('mongoose');
const { trim } = require('validator');

const productSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    description: {
        type: String,
        required: true,
        trim: true
    }
});

const Product = mongoose.model('Product', productSchema);
module.exports = Product;  
