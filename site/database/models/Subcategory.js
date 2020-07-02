const config = require("../config/config");

module.exports = (sequelize, dataTypes) => {
    let alias = "SubCategories";
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: dataTypes.CHAR(30)
        },
        category_id: {
            type: dataTypes.INTEGER,
        },
    }
    let config = {
        tableName: "subCategories", //el mismo nombre en el modelo
        timestamps: false
    }
    const SubCategory = sequelize.define(alias,cols,config)

    SubCategory.associate = function(models){
        SubCategory.belongsTo(models.Category, {
            alias: "subcategory",
            foreignKey: "category_id"
        })
    }

    return SubCategory;
}