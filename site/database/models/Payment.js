const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "Payments";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        card_number: {
            type: dataTypes.VARCHAR(30)
        },
        user_id: {
            type: dataTypes.INTEGER,
        },
    }
    let config = {
        tableName: "payments", //el mismo nombre en el modelo
        timestamps: false
    }
    const Payment = sequelize.define(alias,cols,config)

    
    Payment.associate = function(models){
        Payment.hasMany(models.Usuario, {
            alias: "userPayments",
            foreignKey: "user_id"
        })
    }


    return Payment;
}