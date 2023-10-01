// Importación de módulos y configuración
const { Audiovisual } = require('../conexion/associations');
const { Op } = require('sequelize');
const catalogoView = require("../tablas/CatalogoView");

// Mostrar la vista SQL con todas las series y peliculas
const verCatalogo = async (req, res) => {
    try {
        const catalogo = await catalogoView.findAll();
        res.json(catalogo);
    } catch (error) {
        console.error("Error al ver el catálogo", error);
        res.status(500).json({ error: "Error en el servidor", description: error.message });
    }
};

// Buscar una serie o pelicula por su ID usando la vista SQL
const buscarCatalogo = async (req, res) =>{
    try {
        const id = parseInt(req.params.id);
        const catalogo = await catalogoView.findOne({ where: { id }});
        res.json(catalogo);
    } catch (error) {
        console.error("Error al buscar una serie o pelicula" + error);
        res.status(500).json({ error: "Error al buscar" + error});
    }
}

// Mostar todas las series y peliculas por parte de su nombre
const buscarPorNombreCatalogo = async (req,res)=>{
    try {
        const nombre = req.params.nombre;
        const catalogo = await catalogoView.findAll({ where:{ titulo :{[Op.like]:`%${nombre}%`}}});
        res.json(catalogo);
    } catch (error) {
        console.error("Error en mostrar las series y peliculas");
        res.status(500).json({error: "Error en mostrar las series y peliculas" + error});
    }
};

// Mostrar todas las series y pelicuas segun su categoria
const categoriaCatalogo = async (req,res)=>{
    try {
        const categoria = req.params.categoria;
        const catalogo = await catalogoView.findAll({ where: { categoria }});
        res.json(catalogo);
    } catch (error) {
        console.error("Error al mostrar las peliculas y series");
        res.status(500).json({error: "Error al mostrar las peliculas y series por categoria" + error});
    }
};

// Mostrar todas las series y peliculas segun su genero
const generoCatalogo = async (req,res)=>{
    try {
        const generos = req.params.generos;
        const catalogo = await catalogoView.findAll({where:{ generos :{[Op.like]:`%${generos}%`}}});
        res.json(catalogo);
    } catch (error) {
        console.error("Error en mostrar las series y peliculas");
        res.status(500).json({error: "Error al mostrar las series y peliculas por genero" + error});
    }
};

// Exportamos las funciones
module.exports = { verCatalogo, buscarCatalogo, buscarPorNombreCatalogo, categoriaCatalogo, generoCatalogo };


