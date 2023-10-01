const Sequelize = require("sequelize");
const { db } = require("../conexion/db");

const audiovisual = db.define('audiovisual', {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false
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
    trailer: {
        type: Sequelize.STRING(100),
        allowNull: false
    }
  }, { tableName: "audiovisual", timestamps: false });

  module.exports = audiovisual;