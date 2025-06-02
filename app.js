const express = require("express");
const cors = require("cors");
require("dotenv").config();
const db = require("./src/Config/db");
const emotionsRouter = require("./src/Routes/emotion");

const app = express();
const PORT = process.env.PORT || 3000;

// --- MIDDLEWARE ---
app.use(cors());
app.use(express.json());

// --- ROUTES ---
app.use("/api/emotions", emotionsRouter);
app.get("/", (req, res) => {
  res.send("Selamat datang di Emolog API! Server berjalan.");
});

// --- Menjalankan Server ---
app.listen(PORT, () => {
  console.log(`Server Emolog API berjalan di http://localhost:${PORT}`);

  db.query("SELECT NOW()")
    .then(() => console.log("Koneksi ke database berhasil."))
    .catch((err) => console.error("Gagal memverifikasi koneksi.", err));
});
