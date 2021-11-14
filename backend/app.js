const express = require('express');
const mogoose = require('mongoose');
const cors = require('cors');
require('dotenv/config');
const app = express();

// Import Routes
const usersRoute = require('./Routes/users');

// Middleware
app.use(express.json());
app.use('/users', usersRoute);
app.use(cors());

// Routes
app.get('/', (req, res) => {
    res.send('Hostel Management System API');
});

// Connect to DB
mogoose.connect(process.env.DB_CONNECTION, () => {
    console.log('Connection to DB successfull')
});

// Listening
app.listen(3000);