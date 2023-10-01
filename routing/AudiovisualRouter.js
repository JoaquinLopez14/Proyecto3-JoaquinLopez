// Importación de módulos y configuración
const express = require('express');
const router = express.Router();
const AudiovisualesController = require("../controladores/AudiovisualControlador");

// Rutas para la vista SQL
router.get('/', AudiovisualesController.verCatalogo);
router.get('/:id', AudiovisualesController.buscarCatalogo);
router.get('/categoria/:categoria', AudiovisualesController.categoriaCatalogo);
router.get('/generos/:generos', AudiovisualesController.generoCatalogo);
router.get('/nombre/:nombre', AudiovisualesController.buscarPorNombreCatalogo);

// Exportamos los routers
module.exports = router;