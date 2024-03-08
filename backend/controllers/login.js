const supabase = require('../util/con_db');

dev = true;

/////////////////////////////////////////////////////login with email/////////////////////////////////////////////////////
const loginEmail = async (req, res, next) => {
    try {
        const { data, error } = await supabase.auth.signInWithPassword({
            email: req.body.email,
            password: req.body.password
        });
        
        if (error) {
            res.status(500).json({
                message: error.message
            });
            return;
        } else if (data) {
            res.cookie('session', data.session, { httpOnly: true, secure: dev ? false : true })
            res.cookie('id', data.user.id, { httpOnly: true, secure: dev ? false : true })
            res.status(200).json({
                message: 'User logged in successfully!',
                status: error,
                data: data
            });
        }

    } catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
}

/////////////////////////////////////////////////////register with email/////////////////////////////////////////////////////
const registerEmail = async (req, res, next) => {
    try {
        //check if email already exists
        const { check } = await supabase.from('auth.users').select('email').eq('email', req.body.email);
        
        if (check !== undefined) {
            throw new Error("user already exists!");
        }

        const { data, error } = await supabase.auth.signUp({
            email: req.body.email,
            password: req.body.password
        });

        if (error) {
            throw new Error(error.message);
        } else {
            const username = req.body.email.split('@')[0];

            //insert user into profiles table
            const { error } = await supabase
            .from('profiles')
            .insert({
                id: data.user.id,
                username: username
            })
            res.cookie('id', data.user.id, { httpOnly: true, secure: dev ? false : true })
            res.cookie('session', data.session, { httpOnly: true, secure: dev ? false : true })
            res.status(201).json({
                message: 'User created successfully!',
                data: data
            });
        }

    } catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
}

const deleteUser = async (req, res, next) => {
    try {
        id = req.headers.cookie.split(';').find(c => c.trim().startsWith('id=')).split('=')[1];
        console.log(id);
        error = true;
        const { error } = await supabase.auth.admin.deleteUser(req.body.id); 

        if (error) {
            throw new Error(error.message);
        } else {
            res.status(200).json({
                message: 'User deleted successfully!'
            });
        }

    } catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
}

module.exports = { loginEmail, registerEmail, deleteUser };