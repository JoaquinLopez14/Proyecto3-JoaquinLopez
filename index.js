// Importación de módulos y configuración inicial
const express = require("express");
const app = express();
const { db } = require("./conexion/db");
const PORT = process.env.PORT || 3000;

// Middleware para manejar solicitudes JSON
app.use(express.json());

// Middleware para verificar la conexión a la base de datos
app.use(async (req, res, next) => {
    try {
        await db.authenticate();
        next();
    } catch (error) {
        res.status(500).json({ error: "Error en el servidor", description: error.message });
    }
});

// Importación de routers
const AudiovisualesRouter = require("./routing/AudiovisualRouter");
const GenerosRouter = require("./routing/GenerosRouter");
const CategoriaRouter = require("./routing/CategoriasRouter");

// Ruta principal
app.get("/", async (req, res) => {
    try {
      res.status(200).json("Bienvenido a Trailerflix");
    } catch (error) {
      res.status(500).json({error:"Error en el servidor",description: error.message});
    }
});

// Rutas para Recursos
app.use("/catalogo", AudiovisualesRouter);
app.use("/generos", GenerosRouter);
app.use("/categorias", CategoriaRouter);

// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor escuchando en el puerto ${PORT}`);
});


