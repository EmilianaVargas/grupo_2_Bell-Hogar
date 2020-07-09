const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "State";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: dataTypes.STRING,
        },
    }
    let config = {
        tableName: "states", //el mismo nombre en el modelo
        timestamps: false
    }
    const States = sequelize.define(alias,cols,config);

    
    // States.associate = function(models){
    //     States.HasMany(models.Address,{
    //         alias: "stateAddresses",
    //         foreignKey: "addres_id"
    //     })
    // }


    return States;
}