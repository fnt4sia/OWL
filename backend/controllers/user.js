const supabase = require('../util/con_db');

dev = true;

const getUserID = (req) => req.headers.cookie.split(';').find(c => c.trim().startsWith('id=')).split('=')[1];
const getUserSession = (req) => req.headers.cookie.split(';').find(c => c.trim().startsWith('session=')).split('=')[1];

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
                email: req.body.email
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
        const { data: users, error } = await supabase.from('profiles').select('email').eq('email', req.body.email);
        
        if (error) {
            throw error;
        }

        if (users.length > 0) {
            throw new Error("user already exists!");
        }

        const { data, error: errorSignup } = await supabase.auth.signUp({
            email: req.body.email,
            password: req.body.password
        });

        if (errorSignup) {
            throw new Error(error.message);
        } else {
            const username = req.body.email.split('@')[0];

            //insert user into profiles table
            const { error } = await supabase
            .from('profiles')
            .insert({
                id: data.user.id,
                username: username,
                email: req.body.email
            })
            res.cookie('id', data.user.id, { httpOnly: true, secure: dev ? false : true })
            res.cookie('session', data.session, { httpOnly: true, secure: dev ? false : true })
            res.status(201).json({
                message: 'User created successfully!'
            });
        }

    } catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
}


/////////////////////////////////////////////////////delete user/////////////////////////////////////////////////////z
const deleteUser = async (req, res, next) => {
    try {
        id = await getUserID(req);

        const { error } = await supabase.auth.admin.deleteUser(id); 

        if (error) {
            throw new Error(error.message);
        } else {
            res.clearCookie('id');
            res.clearCookie('session');
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

/////////////////////////////////////////////////////recover account/////////////////////////////////////////////////////
const recoverAccount = async (req, res, next) => {
    try {
        const { data: users, error: checks } = await supabase.from('profiles').select('email').eq('email', req.body.email);
        
        if (checks) {
            throw error;
        }

        if (users.length == 0) {
            throw new Error("user doesnt exists!");
        }

        const { error } = await supabase.auth.resetPasswordForEmail(req.body.email);
        if (error) {
            throw new Error(error.message);
        } else {
            res.status(200).json({
                message: 'Password Recovery already sent to your email!'
            });
        }
    } catch(error) {
        res.status(500).json({
            message: error.message
        });
    }
}

/////////////////////////////////////////////////////recover password/////////////////////////////////////////////////////
const recoverPassword = async (req, res, next) => {
    try {
        const { error: checks } = await supabase.auth.getSession(getUserSession(req));

        if (checks) {
            throw new Error(error.message);
        }

        const { error } = await supabase.auth.updateUser({
            password: req.body.password
        });

        if (error) {
            throw new Error(error.message);
        } else {
            res.status(200).json({
                message: 'Password is recovered!'
            });
        }
    } catch (error){
        res.status(500).json({
            message: error.message
        });
    }
    
}

module.exports = { loginEmail, registerEmail, deleteUser, recoverAccount, recoverPassword };