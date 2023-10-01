// Vista del JSON de Series-peliculas

const Sequelize = require("sequelize");
const { db } = require("../conexion/db");

const catalogoView = db.define('catalogoView', {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
    },
    titulo: {
        type: Sequelize.STRING(100),
        allowNull: false
    },
    poster: {
        type: Sequelize.STRING(255),
        allowNull: false
    },
    resumen: {
        type: Sequelize.TEXT,
        allowNull: false
    },
    temporadas: {
        type: Sequelize.SMALLINT,
        allowNull: true
    },
    categoria: {
        type: Sequelize.STRING(50),
    },
    generos: {
        type: Sequelize.STRING,
    },
    reparto: {
        type: Sequelize.STRING,
    },
    trailer: {
        type: Sequelize.STRING(100),
        allowNull: false
    }
  }, { tableName: "catalogoView", timestamps: false });

  module.exports = catalogoView;