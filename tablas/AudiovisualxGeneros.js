const Sequelize = require("sequelize");
const { db } = require("../conexion/db");

const AudiovisualxGeneros = db.define('AudiovisualxGeneros', {
    idaudiovisual: {
        type: Sequelize.INTEGER,
        allowNull:false
    },
    idgenero: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
}, { tableName: "AudiovisualxGeneros", timestamps: false});

module.exports = AudiovisualxGeneros;