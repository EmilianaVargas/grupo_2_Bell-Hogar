const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "Product";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: dataTypes.STRING,
        },
        description: {
            type: dataTypes.STRING,
        },
        technical_specifications: {
            type: dataTypes.STRING,
        },
        unit_price: {
            type: dataTypes.DECIMAL(10, 2),
        },
        color: {
            type: dataTypes.STRING,
        },
        image1: {
            type: dataTypes.STRING,
        },
        image2: {
            type: dataTypes.STRING,
        },
        image3: {
            type: dataTypes.STRING,
        },
        image4: {
            type: dataTypes.STRING,
        },
        stock: {
            type: dataTypes.DOUBLE
        },
        created_at: {
            type: dataTypes.DATE
        },
        updated_at: {
            type: dataTypes.DATE
        },
        category_id: {
            type: dataTypes.INTEGER,
        },
        brand_id: {type: dataTypes.INTEGER,
        } 
    }
    let config = {
        tableName: "products", //el mismo nombre en el modelo
        timestamps: false
    }
    const Product = sequelize.define(alias,cols,config)

    Product.associate = function(models){
        Product.belongsTo(models.Category, {
            alias: "productCategory",
            foreignKey: "category_id"
        }),
        Product.belongsTo(models.Brand,{
            alias: "productBrand",
            foreignKey: "brand_id"
        })
    }


    return Product;
}