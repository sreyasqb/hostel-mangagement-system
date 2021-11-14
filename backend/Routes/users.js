const express = require('express');
const User = require('../models/User');
const router = express.Router();

// Add a user
router.post('/', async(req, res) => {
    const user = new User({
        username: req.body.username,
        email: req.body.email,
        password: req.body.password,
        role: req.body.role,
        rollNo: req.body.rollNo,
        roomNo: req.body.roomNo,
        balance: req.body.balance
    });

    try{
        const newUser = await user.save();
        res.json(newUser);
    } catch(err) {
        res.json({message: err})
    }
});

// Get all users
router.get('/', async(req, res) => {
    try{
        const users = await User.find();
        res.json(users);
    } catch(err) {
        res.json({message: err});
    }
});

// Get a user details by _id
router.get('/:uniqueID', async(req, res) => {
    try {
        const user = await User.findById(req.params.uniqueID);
        res.json({
            username: user.username,
            email: user.email,
            role: user.role,
            rollNo: user.rollNo,
            roomNo: user.roomNo,
            balance: user.balance
        });
    } catch(err) {
        res.json({message: err});
    }
});

// Get _id by email and password
router.post('/checkUser', async(req, res) => {
    const email = req.body.email;
    const password = req.body.password;
    try {
        const user = await User.find({'email': email});
        if(user[0].password === password) {
            res.json({_id: user[0]._id});
        }
    } catch(err) {
        res.json({message: "The user was not found"});
        return;
    }
});

// Update username
router.patch('/:uniqueID', async(req, res) => {
    try{
        const updatedPost = await User.updateOne({_id: req.params.uniqueID}, {$set: {username: req.body.username}});
        res.json(updatedPost);
    } catch(err) {
        res.json('THERE WAS AN ERROR');
        res.json({message: err});
    }
});

// Update balance
router.patch('/balance/:uniqueID', async(req, res) => {
    try{
        const updatedPost = await User.updateOne({_id: req.params.uniqueID}, {$set: {balance: req.body.balance}});
        res.json(updatedPost);
    } catch(err) {
        res.json({message: err});
    }
});

// Delete a user
router.delete('/:uniqueID', async(req, res) => {
    try{
        const deletedUser = await User.deleteOne({_id: req.params.uniqueID});
        res.json(deletedUser);
    } catch(err) {
        res.json({message: err});
    }
});

module.exports = router;