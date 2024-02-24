const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const database = require('../util/con_db');

const login = (req, res, next) => {
    res.status(200).json({
        message: 'Hello World!'
    });
}

const register = (req, res, next) => {
    try {
        
    } catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
}

module.exports = { login, register };