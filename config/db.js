const mysql = require("mysql");

const db_config = {
    connectionLimit: 100,
    host: process.env.HOST,
    user: process.env.USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DATABASE,
    multipleStatements: true,
};

const pool = mysql.createPool(db_config);

module.exports = pool;
