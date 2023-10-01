const Sequelize = require("sequelize");
const { db } = require("../conexion/db");

const AudiovisualxActores = db.define('AudiovisualxActores', {
    idaudiovisual: {
        type: Sequelize.INTEGER,
        allowNull:false
    },
    idactor: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
}, { tableName: "AudiovisualxActores", timestamps: false});

module.exports = AudiovisualxActores;