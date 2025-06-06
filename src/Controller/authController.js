const User = require('../Model/userModel');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

/**
 * Mendaftarkan user baru.
 */
exports.register = async (req, res) => {
    const { username, email, password } = req.body;

    // Validasi input sederhana
    if (!username || !email || !password) {
        return res.status(400).json({ message: 'Username, email, dan password harus diisi.' });
    }

    try {
        const newUser = await User.create({ username, email, password });
        res.status(201).json({
            message: 'User berhasil didaftarkan.',
            user: newUser
        });
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
};

/**
 * Melakukan login user.
 */
exports.login = async (req, res) => {
    const { email, password } = req.body;

    // Validasi input sederhana
    if (!email || !password) {
        return res.status(400).json({ message: 'Email dan password harus diisi.' });
    }

    try {
        // 1. Cari user berdasarkan email
        const user = await User.findByEmail(email);
        if (!user) {
            return res.status(401).json({ message: 'Email atau password salah.' });
        }

        // 2. Bandingkan password yang diinput dengan password hash di database
        const isMatch = await bcrypt.compare(password, user.password_hash);
        if (!isMatch) {
            return res.status(401).json({ message: 'Email atau password salah.' });
        }

        // 3. Jika cocok, buat JSON Web Token (JWT)
        const payload = {
            userId: user.user_id,
            username: user.username
        };

        const token = jwt.sign(
            payload,
            process.env.JWT_SECRET,
            { expiresIn: '1h' } // Token akan kadaluarsa dalam 1 jam
        );

        // 4. Kirim token ke client
        res.status(200).json({
            message: 'Login berhasil.',
            token: token
        });

    } catch (error) {
        console.error('Login error:', error);
        res.status(500).json({ message: 'Terjadi kesalahan pada server.' });
    }
};