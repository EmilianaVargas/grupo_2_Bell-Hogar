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
        },
        subcategory_id: {
            type: dataTypes.INTEGER,
        }
    }
    let config = {
        tableName: "categories", //el mismo nombre en el modelo
        timestamps: false
    }
    const Category = sequelize.define(alias,cols,config)

    Category.associate = function(models){
        Category.hasMany(models.Producto, {
            alias: "productCategory",
            foreignKey: "product_id"
        }),
        Category.hasMany(models.Subcategory,{
            alias:"subcategory",
            foreignKey: "subcategory_id"
        })
    }

    return Category;
}