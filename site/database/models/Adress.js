const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "Addresses";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        adress1: {
            type: dataTypes.VARCHAR(30)
        },
        adress2: {
            type: dataTypes.VARCHAR(30)
        },
        user_id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
    }
    let config = {
        tableName: "addresses", //el mismo nombre en el modelo
        timestamps: false
    }
    const Adress = sequelize.define(alias,cols,config)
    return Adress;
}