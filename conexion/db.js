// Configuración de la conexión a la base de datos utilizando Sequelize.
// Esta configuración utiliza valores del archivo .env para definir los parámetros de conexión.
const Sequelize = require ('sequelize');
const dontenv = require ('dotenv');
// Carga las variables de entorno desde el archivo .env
dontenv.config();

// Extrae las variables necesarias del archivo .env
const { DB_SCHEMA, DB_USER, DB_PASSWORD, DB_HOST } = process.env;

// Crea una instancia de Sequelize con la configuración proporcionada
const db = new Sequelize(DB_SCHEMA, DB_USER, DB_PASSWORD, {
    host: DB_HOST,
    dialect: 'mysql',
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000,
    }
});

// async function authenticate() {
//     try {
//         await db.authenticate();
//         console.log("Conexion a la base de datos establecida");
//     } catch (error) {
//         console.error("Error al conectar", error);
//     }
// }

// async function closeConnection() {
//     try {
//         await db.close();
//         console.log("Conexion cerrada");
//     } catch (error) {
//         console.error("Error al cerrar la conexion", error);
//     }
// }

// Exportamos la instancia de la base de datos para su uso en otras partes de la aplicación
module.exports = { db }; 