const Sequelize = require("sequelize");
const { db } = require("../conexion/db");

const actores = db.define('actores', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
    },
    nombreApellido: {
        type: Sequelize.STRING(50),
        allowNull:false
    }
}, { tableName: "actores", timestamps: false});

module.exports = actores;