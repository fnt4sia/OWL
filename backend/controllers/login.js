const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const supabase = require('../util/con_db');

const login = (req, res, next) => {
    try {
        async function login() {
            const { data, error } = await supabase.auth.signInWithPassword({
                email: req.body.email,
                password: req.body.password,
                data: {
                    full_name: req.body.full_name
                }
            });

            if (error) {
                res.status(500).json({
                    message: error.message
                });
            } else {
                res.status(200).json({
                    message: 'User logged in successfully!',
                    data: data
                });
            }
        }

        login();

        if (error) {
            res.status(500).json({
                message: error.message
            });
        } else {
            res.status(200).json({
                message: 'User logged in successfully!',
                data: data
            });
        }
    } catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
}

const register = (req, res, next) => {
    try {
        const { data, error } = supabase.auth.signUp({
            email: req.body.email,
            password: req.body.password
        });

        if (error) {
            res.status(500).json({
                message: error.message
            });
        } else {
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

module.exports = { login, register };