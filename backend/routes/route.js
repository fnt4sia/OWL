const express = require('express');
const { login, register } = require('../controllers/login');
const supabase = require('../util/con_db');

const router = express.Router();

router.get('/', (req, res, next) => {
    authent = supabase.auth.getSession;
    res.status(404).json({
        message: 'Resource not found!',
        auth: authent
    });
})

router.post('/login', login);

router.post('/register', register);

module.exports = router;