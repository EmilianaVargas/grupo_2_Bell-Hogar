const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "Passwords";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        password: {
            type: dataTypes.VARCHAR(30)
        },
        user_id: {
            type: dataTypes.INTEGER,
        }
    }
    let config = {
        tableName: "passwords", //el mismo nombre en el modelo
        timestamps: false
    }
    const Password = sequelize.define(alias,cols,config)

    Password.associate = function(models){
        Password.belongsTo(models.Usuario, {
            alias: "userPassword",
            foreignKey: "user_id"
        })
    }


    return Password;
}