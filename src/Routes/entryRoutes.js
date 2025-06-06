const express = require('express');
const router = express.Router();
const entryController = require('../Controller/entryController');
const { protect } = require('../middleware/authMiddleware');

// Terapkan middleware 'protect' untuk semua rute di bawah ini
// Semua request ke /api/entries/ (dan turunannya) harus menyertakan token yang valid
const { 
    createEntry, 
    getAllEntries, 
    deleteEntry, 
    getEntryById 
} = require('../Controller/entryController');


router.use(protect);

// Definisi rute
router.route('/')
    .get(entryController.getAllEntries)
    .post(entryController.createEntry);

router.route('/:id')
    .get(entryController.getEntryById) 
    .delete(entryController.deleteEntry);
    
    // .put(entryController.updateEntry); // Bisa ditambahkan nanti

module.exports = router;