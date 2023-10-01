// Importación de módulos
const { Categoria } = require ('../conexion/associations');

// Funcion para ver todas las categorias de las series y peliculas
const verCategorias= async (req, res) => {
    try {
      const categorias = await Categoria.findAll();
      res.json(categorias);
    } catch (error) {
      console.error("Error al mostrar las categorias:", error);
      res.status(500).json({ error: "Error al mostrar las categorias " + error });
    }
  };

// Funcion para crear una categoria
const crearCategoria = async (req, res) => {
const { tipo } = req.body;
    try {
      const categoria = await Categoria.create({ tipo });
      res.status(201).json(categoria);
    } catch (error) {
      console.error("Error al crear categoría:", error);
      res.status(500).json({ error: "Error al crear categoría" });
    }
  };

// Funcion para borrar una categoria
const borrarCategoria = async (req, res) => {
const id = req.params.id;
    try {
      const categoria = await Categoria.findByPk(id);
      if (!categoria) {
        return res.status(404).json({ error: "Error al buscar" });
      }
      await categoria.destroy();
      res.json({ mensaje: "Categoria eliminada" });
    } catch (error) {
      console.error("Error al eliminar categoria: ", error);
      res.status(500).json({ error: "Error al eliminar categoria" });
    }
  };

// Exportamos las funciones
module.exports = { verCategorias, crearCategoria, borrarCategoria};