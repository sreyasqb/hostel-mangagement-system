const mongoose = require('mongoose');
//const uniqueValidator = require('mongoose-unique-validator');
//const crypto = require('crypto');
//const jwt = require('jsonwebtoken');
//require('dotenv/config');

//const UserSchema = new mongoose.Schema({
const UserSchema = mongoose.Schema({
    username: {
        type: String,
        required: true,
        //match: [/^[a-zA-Z0-9]+$/, 'is invalid'],
        //unique: true
    },
    email: {
        type: String,
        required: true,
        //match: [/\S+@\S+\.\S+/, 'is invalid'],
        //unique: true
    },
    password: {
        type: String,
        required: true
    },
    role: {
        type: String,
        required: true
    },
    rollNo: {
        type: String,
        required: true
    },
    roomNo: {
        type: String,
        required: true
    },
    balance: {
        type: Number,
        required: true
    }
    //hash: String,
    //salt: String
});

//UserSchema.plugin(uniqueValidator, {message: 'is already taken.'});

/*
UserSchema.methods.setPassword = function(password){
    this.salt = crypto.randomBytes(16).toString('hex');
    this.hash = crypto.pbkdf2Sync(password, this.salt, 10000, 512, 'sha512').toString('hex');  
};

UserSchema.methods.validPassword = function(password) {
    const hash = crypto.pbkdf2Sync(password, this.salt, 10000, 512, 'sha512').toString('hex');
    return this.hash === hash;
};

UserSchema.methods.generateJWT = function() {
    const today = new Date();
    const exp = new Date(today);
    exp.setDate(today.getDate() + 60);

    return jwt.sign({
        id: this._id,
        username: this.username,
        exp: parseInt(exp.getTime() / 1000);
    }, process.env.SECRET);
};


UserSchema.methods.toAuthJSON = function() {
    return {
        username: this.username,
        email: this.email,
        role: this.role,
        rollNo: this.rollNo
    };
};
*/

module.exports = mongoose.model('Users', UserSchema);