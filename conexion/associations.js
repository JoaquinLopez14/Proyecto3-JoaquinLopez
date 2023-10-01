// Importamos nuestras tablas
const Audiovisuales = require("../tablas/Audiovisual");
const Categoria = require("../tablas/Categorias");
const Genero = require("../tablas/Generos");
const Actor = require("../tablas/Actores");
const AudiovisualxCategoria = require("../tablas/AudiovisualxCategoria");
const AudiovisualxGeneros = require("../tablas/AudiovisualxGeneros");
const AudiovisualxActores = require("../tablas/AudiovisualxActores");

// Configurar relaciones
// Relación entre Audiovisual y Categorias a través de la tabla intermedia

Audiovisuales.belongsToMany(Categoria, {
    through: AudiovisualxCategoria,
    foreignKey: 'idaudiovisual',
    otherKey: 'idcategoria'
  });
  
  Categoria.belongsToMany(Audiovisuales, {
    through: AudiovisualxCategoria,
    foreignKey: 'idcategoria',
    otherKey: 'idaudiovisual'
  });

// Relación entre Audiovisual y Generos a través de la tabla intermedia
Audiovisuales.belongsToMany(Genero, {
    through: AudiovisualxGeneros,
    foreignKey: 'idaudiovisual',
    otherKey: 'idgenero'
  });

  Genero.belongsToMany(Audiovisuales, {
    through: AudiovisualxGeneros,
    foreignKey: 'idgenero',
    otherKey: 'idaudiovisual'
  });

// Relación entre Audiovisual y Actores a través de la tabla intermedia
Audiovisuales.belongsToMany(Actor, {
    through: AudiovisualxActores,
    foreignKey: 'idaudiovisual',
    otherKey: 'idactor'
});

Actor.belongsToMany(Audiovisuales, {
    through: AudiovisualxActores,
    foreignKey: 'idactor',
    otherKey: 'idaudiovisual'
});

// Exportamos nuestras relaciones
  module.exports = {
    Audiovisuales,
    Categoria,
    Genero,
    Actor,
  }