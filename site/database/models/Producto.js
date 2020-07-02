const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "Productos";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: dataTypes.CHAR(30)
        },
        description: {
            type: dataTypes.CHAR(200)
        },
        technical_specifications: {
            type: dataTypes.VARCHAR(200)
        },
        unit_price: {
            type: dataTypes.CURRENCY()
        },
        color: {
            type: dataTypes.CHAR(20)
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
        },
        category_id: {
            type: dataTypes.INTEGER,
        },
        marca_id: {type: dataTypes.INTEGER,
        } 
    }
    let config = {
        tableName: "productos", //el mismo nombre en el modelo
        timestamps: false
    }
    const Producto = sequelize.define(alias,cols,config)

    Producto.associate = function(models){
        Producto.belongsTo(models.Category, {
            alias: "productCategory",
            foreignKey: "category_id"
        }),
        Producto.belongsTo(models.Marca,{
            alias: "productMarca",
            foreignKey: "marca_id"
        })
    }


    return Producto;
}