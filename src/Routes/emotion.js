const express = require("express");
const router = express.Router();
const { getAllEmotions } = require("../Controller/emotionController");

router.get("/", getAllEmotions);

module.exports = router;
