const express = require('express');
const router = express.Router();
const authController = require('../Controller/authController');

// Route untuk registrasi
// POST /api/auth/register
router.post('/register', authController.register);

// Route untuk login
// POST /api/auth/login
router.post('/login', authController.login);

module.exports = router;