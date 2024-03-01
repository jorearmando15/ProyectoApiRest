const MediaModel = require('../models/mediaModel');

class MediaController {
  async getAllMedia(req, res) {
    console.log('Recibida solicitud para obtener todas las Media');

    MediaModel.getAllMedia((err, result) => {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json(result);
      }
    });
  }

  async getMediaById(req, res) {
    const id = req.params.id;
    MediaModel.getMediaById(id, (err, result) => {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json(result[0]);
      }
    });
  }

  async addMedia(req, res) {
    const mediaData = req.body;
    MediaModel.addMedia(mediaData, (err, result) => {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json({ message: 'Media agregada correctamente' });
      }
    });
  }

  async updateMedia(req, res) {
    const id = req.params.id;
    const mediaData = req.body;
    MediaModel.updateMedia(id, mediaData, (err, result) => {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json({ message: 'Media actualizada correctamente' });
      }
    });
  }

  async deleteMedia(req, res) {
    const id = req.params.id;
    MediaModel.deleteMedia(id, (err, result) => {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json({ message: 'Media eliminada correctamente' });
      }
    });
  }
}

module.exports = new MediaController();
