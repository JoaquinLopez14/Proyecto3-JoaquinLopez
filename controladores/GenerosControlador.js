// Importación de módulos
const { Genero } = require('../conexion/associations');

// Ruta para ver todos los generos
const verGeneros = async(req,res)=>{
    try {
        const generos = await Genero.findAll();
        res.json(generos);
    } catch (error) {
        console.error("Error al mostrar generos");
        res.status(500).json({ error: "Error al mostrar los generos" + error});
    }
};

// Ruta para crear un nuevo genero
const crearGenero = async(req,res)=>{
    const { clasificacion } = req.body;
    try{ 
        const generos = await Genero.create ({ clasificacion });
        res.status(201).json(generos);
    } catch (error) {
        console.error("Error al crear un nuevo genero", error);
        res.status(500).json({ error: "Error al crear un nuevo genero" + error});
    }
};

// Ruta para eliminar un genero
const borrarGenero = async(req,res)=>{
    const id = req.params.id
    try {
        const genero = await Genero.findByPk(id);
        if (!genero) {
            return res.status(404).json({ error: "No se encontro el genero"});
        } else 
           await genero.destroy();
           res.json({ mensaje: "Genero eliminado con éxito" });
        } catch (error) {
        console.error("Error al eliminar genero", error);
        res.status(500).json({ error: "Error al eliminar genero"});
    }
};

//Exportamos nuestras funciones
module.exports = { verGeneros, crearGenero, borrarGenero };