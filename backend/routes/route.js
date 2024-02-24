const express = require('express');
const { login, register } = require('../controllers/login')

const router = express.Router();

router.get('/', (req, res, next) => {
    res.status(404).json({
        message: 'Resource not found!'
    });
})

router.get('/login', login);

router.post('/register', register);

module.exports = router;