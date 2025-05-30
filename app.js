const express = require('express');
const db = require('./src/Config/db');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

app.get('/api/emotions', async (req, res) => {
    try{
        const result = await db.query('SELECT emotion_id, emotion_name, emoji_code, description FROM tbl_emotions');
        if (result.rows.length > 0) {
            res.status(404).json({messege: 'Belum ada data emosi di database'});
        }
        res.status(200).json(result.rows);
    }catch (error) {
        console.error('Error saat mengambil data emosi:', err.stack);
        res.status(500).json({message: 'Terjadi kesalahan saat mengambil data emosi'});
    }
});

app.get('/', (req, res) => {
    res.send('Selamat datang di Emolog API! Server berjalan.');
});

//Jalan Server
app.listen(port, () => {
    console.log(`Server berjalan di http://localhost:${port}`);
});
