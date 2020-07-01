const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "Categories";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: dataTypes.CHAR(30)
        },
        product_id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
    }
    let config = {
        tableName: "categories", //el mismo nombre en el modelo
        timestamps: false
    }
    const Category = sequelize.define(alias,cols,config)
    return Category;
}