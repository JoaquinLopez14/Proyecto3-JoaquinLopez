const Sequelize = require("sequelize");
const { db } = require("../conexion/db");

const generos = db.define('generos', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
    },
    clasificacion: {
        type: Sequelize.STRING(100),
        allowNull:false
    }
}, { tableName: "generos", timestamps: false});

module.exports = generos;