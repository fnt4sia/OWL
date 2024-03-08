const express = require('express');
const { loginEmail, registerEmail, deleteUser } = require('../controllers/user');
const supabase = require('../util/con_db');

const router = express.Router();

router.get('/', (req, res, next) => {
    authent = supabase.auth.getSession;
    res.status(404).json({
        message: 'Resource not found!',
        auth: authent
    });
})

router.post('/login', loginEmail);

router.post('/register', registerEmail);

router.delete('/delete', deleteUser);

module.exports = router;