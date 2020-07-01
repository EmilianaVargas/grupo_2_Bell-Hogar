const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "Usuarios";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        first_name: {
            type: dataTypes.CHAR(20)
        },
        last_name: {
            type: dataTypes.CHAR(20)
        },
        email: {
            type: dataTypes.VARCHAR(30)
        },
        dni: {
            type: dataTypes.DOUBLE(10)
        },
        is_admin: {
            type: dataTypes.CHAR(5)
        },
        image: {
            type: dataTypes.VARCHAR(30)
        },
        phone: {
            type: dataTypes.DOUBLE(15)
        },
        created_at: {
            type: dataTypes.DATE()
        },
        updated_at: {
            type: dataTypes.DATE()
        },
        password_id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        adress_id: {type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        } 
    }
    let config = {
        tableName: "usuarios", //el mismo nombre en el modelo
        timestamps: false
    }
    const Usuario = sequelize.define(alias,cols,config)
    return Usuario;
}