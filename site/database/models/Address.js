const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "Address";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        address: {
            type: dataTypes.STRING,
        },
        user_id: {
            type: dataTypes.INTEGER,
        },
    }
    let config = {
        tableName: "addresses", //el mismo nombre en el modelo
        timestamps: false
    }
    const Address = sequelize.define(alias,cols,config);

    
    Address.associate = function(models){
        Address.belongsTo(models.User, {
            alias: "userAddresses",
            foreignKey: "user_id"
        })
    }


    return Address;
}