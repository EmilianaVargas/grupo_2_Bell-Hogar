const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "Brand";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: dataTypes.STRING
        },
        contact: {
            type: dataTypes.DOUBLE
        },
        product_id: {
            type: dataTypes.INTEGER,
        },
    }
    let config = {
        tableName: "brands", //el mismo nombre en el modelo
        timestamps: false
    }
    const Brand = sequelize.define(alias,cols,config)

    Brand.associate = function(models){
        Brand.hasMany(models.Product, {
            alias: "productBrand",
            foreignKey: "product_id"
        })
    }

    return Brand;
}