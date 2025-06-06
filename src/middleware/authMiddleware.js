// File: src/Middleware/authMiddleware.js

const jwt = require('jsonwebtoken');

const protect = (req, res, next) => {

    console.log('--- Menjalankan Auth Middleware ---');
    console.log('Isi Headers:', req.headers);
    console.log('Header Authorization yang diterima:', req.headers.authorization);


    let token;


    if (req.headers.authorization && req.headers.authorization.startsWith('Bearer ')) {
        try {
            token = req.headers.authorization.split(' ')[1];
            const decoded = jwt.verify(token, process.env.JWT_SECRET);
            req.user = decoded;
            next();
        } catch (error) {
            
            res.status(401).json({ message: 'Token tidak valid atau kadaluarsa.' });
        }
    } else {
     
         res.status(401).json({ message: 'Tidak ada token, akses ditolak.' });
    }
};

module.exports = { protect };