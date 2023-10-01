// Importación de módulos y configuración
const express = require('express');
const router = express.Router();
const CategoriasController = require('../controladores/CategoriasControlador');

// Rutas para las categorías
router.get('/', CategoriasController.verCategorias);
router.post('/categorias', CategoriasController.crearCategoria);
router.delete('/categorias/:id', CategoriasController.borrarCategoria);

// Exportamos los routers
module.exports = router;