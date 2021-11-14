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
        rollNo: req.body.rollNo
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

// Get a specific user
router.get('/:uniqueID', async(req, res) => {
    try {
        const user = await User.findById(req.params.uniqueID);
        res.json(user);
    } catch(err) {
        res.json({message: err});
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