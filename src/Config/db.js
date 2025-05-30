const {ppol} = require('pg');
require('dotenv').config();

const pool = new Pool({
    user: process.env.PGUSER,
    host: process.env.PGHOST,  
    database: process.env.PGDATABASE,
    password: process.env.PGPASSWORD,
    port: process.env.PGPORT,
});

pool.on('connect', () => {
    console.log('Terhubung ke PostgreSQL database');
});

pool.on('error', (err) => {
    console.error('Kesalahan koneksi ke PostgreSQL database', err);    
});

module.exports = {
    query : (text, params) => pool.query(text, params),
};