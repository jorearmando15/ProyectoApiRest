const express = require('express');
const mediaController = require('../controllers/mediaController');

const router = express.Router();

router.get('/', mediaController.getAllMedia);
router.get('/:id', mediaController.getMediaById);
router.post('/', mediaController.addMedia);
router.put('/:id', mediaController.updateMedia);
router.delete('/:id', mediaController.deleteMedia);

module.exports = router;
