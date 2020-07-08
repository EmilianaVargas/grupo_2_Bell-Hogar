const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "Products";
    let cols = {
        product_id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: dataTypes.STRING
        },
        category: {
            type: dataTypes.STRING
        }, 
        subCategory: {
            type: dataTypes.STRING
        },
        brand: {
            type: dataTypes.STRING
        }, 
        description: {
            type: dataTypes.STRING
        },
        price: {
            type: dataTypes.DECIMAL
        },
        image1: {
            type: dataTypes.STRING
        },
        image2: {
            type: dataTypes.STRING
        },
        image3: {
            type: dataTypes.STRING
        },
        image4: {
            type: dataTypes.STRING
        },
        stock: {
            type: dataTypes.DOUBLE
        },
        created_at: {
            type: dataTypes.DATE 
        },
        updated_at: {
            type: dataTypes.DATE
        }
    }
    let config = {
        tableName: "products", //el mismo nombre en el modelo
        timestamps: false
    }
    const Producto = sequelize.define(alias,cols,config)
    return Producto;
}