// File: src/Middleware/authMiddleware.js

const jwt = require('jsonwebtoken');

const protect = (req, res, next) => {
    // --- TAMBAHKAN KODE DEBUGGING DI BAWAH INI ---
    console.log('--- Menjalankan Auth Middleware ---');
    console.log('Isi Headers:', req.headers);
    console.log('Header Authorization yang diterima:', req.headers.authorization);
    // -------------------------------------------

    let token;

    // Cek apakah header authorization ada dan dimulai dengan 'Bearer'
    if (req.headers.authorization && req.headers.authorization.startsWith('Bearer ')) {
        try {
            // ... sisa kode Anda ...
            token = req.headers.authorization.split(' ')[1];
            const decoded = jwt.verify(token, process.env.JWT_SECRET);
            req.user = decoded;
            next();
        } catch (error) {
            // ...
            // Anda mungkin memodifikasi pesan error di sini
            res.status(401).json({ message: 'Token tidak valid atau kadaluarsa.' });
        }
    } else {
         // Berdasarkan pesan error Anda, sepertinya logika Anda masuk ke sini
         res.status(401).json({ message: 'Tidak ada token, akses ditolak.' });
    }
};

module.exports = { protect };