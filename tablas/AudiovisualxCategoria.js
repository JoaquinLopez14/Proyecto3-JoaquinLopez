const Sequelize = require("sequelize");
const { db } = require("../conexion/db");

const AudiovisualxCategorias = db.define('AudiovisualxCategorias', {
    idaudiovisual: {
        type: Sequelize.INTEGER,
        allowNull:false
    },
    idcategoria: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
}, { tableName: "AudiovisualxCategorias", timestamps: false});

module.exports = AudiovisualxCategorias;