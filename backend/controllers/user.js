const supabase = require('../util/con_db');
const jwt = require('jsonwebtoken');

dev = false;
key = process.env.JWTKEY;

/////////////////////////////////////////////////////oauth/////////////////////////////////////////////////////
const oauth = async (req, res, next) => {
    try {
        const { data, error } = await supabase.auth.signInWithOAuth({
            provider: req.params.provider,
            options: {
                redirectTo: 'https://www.owlearns.site/home'
            }
        });

        if (error) {
            res.status(401).json({
                message: 'Invalid login credentials'
            });

        } else if (data) {
            res.status(200).json({
                url: data.url
            });
        }

    } catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
}

/////////////////////////////////////////////////////login with email/////////////////////////////////////////////////////
const loginEmail = async (req, res, next) => {
    try {
        const { email, password } = req.body;
        const { data, error } = await supabase.auth.signInWithPassword({
            email: email,
            password: password
        });
        
        if (error) {
            res.status(401).json({
                message: 'Invalid login credentials'
            });
            return;

        } else if (data) {
            const session = {
                "access_token": data.session.access_token,
                "token_type": data.session.token_type,
                "expires_in": data.session.expires_in,
                "expires_at": data.session.expires_at,
                "refresh_token": data.session.refresh_token,
            }
            
            const SEVENDAYS = 7 * 24 * 60 * 60 * 1000;
            
            res.status(200).json({
                message: 'User logged in successfully!',
                session: session
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
        const { email, password } = req.body;

        //check if email already exists
        const { data: users, error } = await supabase.from('profiles').select('email').eq('email', email);
        
        if (error) {
            throw error;
        }

        if (users.length > 0) {
            res.status(400).json({
                message: 'Email already exists!'
            });
            return;
        }

        const username = email.split('@')[0];
        const { data, error: errorSignup } = await supabase.auth.signUp({
            email: email,
            password: password,
            options: {
                data: {
                    name: username
                }
            }
        });

        if (errorSignup) {
            throw new Error(error.message);
        }

        res.status(201).json({
            message: 'User created successfully!'
        });

    } catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
}


/////////////////////////////////////////////////////delete user/////////////////////////////////////////////////////z
const deleteUser = async (req, res, next) => {
    try {
        const access_token = req.body.access_token;
        const { data, error } = await supabase.auth.getSession(access_token);

        if (error) {
            throw new Error(error.message);
        }
        
        const user = jwt.decode(access_token, key);
        const { error: errorDelete } = await supabase.auth.admin.deleteUser(user.sub);

        if (errorDelete) {
            throw new Error(errorDelete.message);
        }

        res.status(200).json({
            message: 'User deleted successfully!'
        });

    } catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
}

/////////////////////////////////////////////////////recover account/////////////////////////////////////////////////////
const recoverAccount = async (req, res, next) => {
    try {
        email = req.body.email;
        const { data: users, error: checks } = await supabase.from('profiles').select('email').eq('email', email);
        
        if (checks) {
            throw error;
        }

        if (users.length == 0) {
            res.status(400).json({
                message: 'Email does not exist!'
            });
            return;
        }

        const { error } = await supabase.auth.resetPasswordForEmail(req.body.email, {
            redirectTo: 'http://localhost:3000/recover-password'
        });

        if (error) {
            throw new Error(error.message);
        } 

        res.status(200).json({
            message: 'Password Recovery already sent to your email!'
        });

    } catch(error) {
        res.status(500).json({
            message: error.message
        });
    }
}

/////////////////////////////////////////////////////recover password/////////////////////////////////////////////////////
const recoverPassword = async (req, res, next) => {
    try {
        const access_token = req.body.access_token;
        const { error: checks } = await supabase.auth.getSession(access_token);

        if (checks) {
            res.status(401).json({
                message: 'Unauthorized access!'
            });
            return;
        }

        const { error } = await supabase.auth.updateUser({
            password: req.body.password
        });

        if (error) {
            throw new Error(error.message);
        }

        res.status(200).json({
            message: 'Password is changed!'
        });
        
    } catch (error){
        res.status(500).json({
            message: error.message
        });
    }
    
}

module.exports = { loginEmail, registerEmail, deleteUser, recoverAccount, recoverPassword, oauth };