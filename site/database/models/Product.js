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
            type: dataTypes.CHAR(30)
        },
        category: {
            type: dataTypes.CHAR(30)
        }, 
        subCategory: {
            type: dataTypes.CHAR(30)
        },
        brand: {
            type: dataTypes.CHAR(30)
        }, 
        description: {
            type: dataTypes.CHAR(200)
        },
        price: {
            type: dataTypes.CURRENCY()
        },
        image1: {
            type: dataTypes.VARCHAR(30)
        },
        image2: {
            type: dataTypes.VARCHAR(30)
        },
        image3: {
            type: dataTypes.VARCHAR(30)
        },
        image4: {
            type: dataTypes.VARCHAR(30)
        },
        stock: {
            type: dataTypes.DOUBLE(15)
        },
        created_at: {
            type: dataTypes.DATE() 
        },
        updated_at: {
            type: dataTypes.DATE()
        }
    }
    let config = {
        tableName: "products", //el mismo nombre en el modelo
        timestamps: false
    }
    const Producto = sequelize.define(alias,cols,config)
    return Producto;
}