const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "Marcas";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: dataTypes.CHAR(30)
        },
        contact: {
            type: dataTypes.DOUBLE(30)
        },
        product_id: {
            type: dataTypes.INTEGER,
        },
    }
    let config = {
        tableName: "marcas", //el mismo nombre en el modelo
        timestamps: false
    }
    const Marca = sequelize.define(alias,cols,config)

    Marca.associate = function(models){
        Marca.hasMany(models.Producto, {
            alias: "productMarca",
            foreignKey: "product_id"
        })
    }

    return Marca;
}