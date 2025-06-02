const Emotion = require("../Model/emotionModel");

const getAllEmotions = async (req, res) => {
  try {
    const emotions = await Emotion.findAll();

    if (emotions.length === 0) {
      return res
        .status(404)
        .json({ message: "Tidak ada data emosi ditemukan." });
    }

    res.status(200).json(emotions);
  } catch (error) {
    console.error("Error di controller emosi:", error);
    res.status(500).json({ message: "Terjadi kesalahan pada server" });
  }
};

module.exports = {
  getAllEmotions,
};
