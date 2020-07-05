const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "Subcategory";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: dataTypes.STRING,
        },
        category_id: {
            type: dataTypes.INTEGER,
        },
    }
    let config = {
        tableName: "subcategories", //el mismo nombre en el modelo
        timestamps: false
    }
    const Subcategory = sequelize.define(alias,cols,config)

    Subcategory.associate = function(models){
        Subcategory.belongsTo(models.Category, {
            alias: "subcategory",
            foreignKey: "category_id"
        })
    }

    return Subcategory;
}