const supabase = require('../util/con_db');
const jwt = require('jsonwebtoken');

dev = false;
key = process.env.JWTKEY;

const getSession = (req) => {
    const cookie = req.headers.cookie.split(';');
    const sessionCookie = cookie.find(c => c.trim().startsWith('session='));
    const encodedSession = sessionCookie.split('=')[1];
    const decodedString = decodeURIComponent(encodedSession);
    const sessionObject = JSON.parse(decodedString.substring(2));
    return sessionObject;
}

/////////////////////////////////////////////////////oauth/////////////////////////////////////////////////////
const oauth = async (req, res, next) => {
    try {
        const { data, error } = await supabase.auth.signInWithOAuth({
            provider: req.params.provider
        });

        if (error) {
            throw new Error(error.message);
        } else if (data) {
            res.status(200).redirect(data.url);
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
        const { data, error } = await supabase.auth.signInWithPassword({
            email: req.body.email,
            password: req.body.password
        });
        
        if (error) {
            res.status(401).json({
                message: req.body.email + ' ' + error.message
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
            
            res.cookie('session', session, { httpOnly: false, path:'/', secure: dev ? false : true })
            res.status(200).json({
                message: 'User logged in successfully!',
                email: req.body.email
            });
        }

    } catch (error) {

        res.status(500).json({
            message: req.body.email + ' ' + error.message
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

        const username = req.body.email.split('@')[0];
        const { data, error: errorSignup } = await supabase.auth.signUp({
            email: req.body.email,
            password: req.body.password,
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
        const access_token = getSession(req).access_token;
        const { data, error } = await supabase.auth.getSession(access_token);

        if (error) {
            throw new Error(error.message);
        }
        
        const user = jwt.decode(access_token, key);
        const { error: errorDelete } = await supabase.auth.admin.deleteUser(user.sub);

        if (errorDelete) {
            throw new Error(errorDelete.message);
        }

        res.clearCookie('session');
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
        const { data: users, error: checks } = await supabase.from('profiles').select('email').eq('email', req.body.email);
        
        if (checks) {
            throw error;
        }

        if (users.length == 0) {
            throw new Error("user doesnt exists!");
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
        const access_token = getSession(req).access_token;
        const { error: checks } = await supabase.auth.getSession(access_token);

        if (checks) {
            throw new Error(error.message);
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