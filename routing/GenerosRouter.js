// Importación de módulos y configuración
const express = require ('express');
const router = express.Router();
const GenerosController = require("../controladores/GenerosControlador");

// Rutas para los generos
router.get("/", GenerosController.verGeneros);
router.post("/generos", GenerosController.crearGenero);
router.delete("/generos/:id", GenerosController.borrarGenero);

// Exportamos los routers
module.exports = router;