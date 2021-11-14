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
        roomNo: req.body.roomNo
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
        });
    } catch(err) {
        res.json({message: err});
    }
});

// Get _id by email and password
router.post('/checkUser', async(req, res) => {
    const email = req.body.email;
    const password = req.body.password;
    console.log(email);
    console.log(password);
    try {
        const user = await User.find({'email': email});
        //res.json(user);
        // if(user && user.password === password) {
        //     res.json(user._id);
        // }
        console.log(user);
        if(user[0].password === password) {
            res.json({_id: user[0]._id});
        }
    } catch(err) {
        res.json({message: err});
        return;
    }
});

// Update a user
router.patch('/:uniqueID', async(req, res) => {
    try{
        const updatedPost = await User.updateOne({_id: req.params.uniqueID}, {$set: {username: req.body.username}});
        res.json(updatedPost);
    } catch(err) {
        res.json('THERE WAS AN ERROR');
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