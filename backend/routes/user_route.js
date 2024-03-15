const express = require('express');
const { loginEmail, registerEmail, deleteUser, recoverAccount, recoverPassword, oauth, updateProfile } = require('../controllers/user');
const supabase = require('../util/con_db');
const upload = require('../middleware/upload_file');

const router = express.Router();

router.get('/', (req, res, next) => {
    authent = supabase.auth.getSession;
    res.status(404).json({
        message: 'Resource not found!',
        auth: authent
    });
})

router.post('/login', loginEmail);

router.post('/oauth/:provider', oauth);

router.post('/register', registerEmail);

router.delete('/delete', deleteUser);

router.post('/recovery', recoverAccount);

router.post('/recovery/password', recoverPassword);

router.post('/editProfile', upload.single('image'),updateProfile);

module.exports = router;