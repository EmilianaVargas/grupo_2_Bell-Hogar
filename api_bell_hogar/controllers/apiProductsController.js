let db = require('../database/models');
const sequelize = db.sequelize;


let apiProductsController = {
    'productsList':function(req,res){
        db.product.findAll({
            attributes: {exclude:["id","price","description","subcategory","brand","image1","image2","image3","image4","stock","category"]},
        })
            .then(function(products){
                let respuesta = {
                    meta: {
                        status: 200,
                        total: products.length
                    },
                    data: products
                }
            res.json(respuesta);   
            });
    },
    'productsCount':function(req,res){
        db.product.count()
            .then(function(productsCount){
                let respuesta = {
                    meta:{
                        status:200,
                        data: productsCount.length
                    },
                    data: productsCount
                }
                res.json(respuesta);
            });
    },
    'productsMasStock':function(req,res){
        db.product.findAll({
            attributes: {exclude:["id","price","description","subcategory","brand","image1","image2","image3","image4","category"]},
            order: [
                ["stock","DESC"]
            ],
            limit: 10
        })
            .then(function(products){
                let respuesta = {
                    meta: {
                        status: 200,
                        total: products.length
                    },
                    data: products
                }
            res.json(respuesta);   
            });
    },
    'productsMenosStock':function(req,res){
        db.product.findAll({
            attributes: {exclude:["id","price","description","subcategory","brand","image1","image2","image3","image4","category"]},
            order: [
                ["stock","ASC"]
            ],
            limit: 10
        })
            .then(function(products){
                let respuesta = {
                    meta: {
                        status: 200,
                        total: products.length
                    },
                    data: products
                }
            res.json(respuesta);   
            });
    },
    'productsByCategory': function(req,res){
        const totalStock = db.product.findAll({
            attributes: [
              'category',
              [sequelize.fn('sum', sequelize.col('stock')), 'totalStock'],
            ],
            group: ['category'],
          })
            .then(function(totalStock){
                let respuesta = {
                    meta: {
                        status: 200,
                        total: totalStock.length
                    },
                    data: totalStock
                }
            res.json(respuesta);   
            });
    },
    'productsByCategoryName': function(req,res){
        db.product.findAll({
            attributes: {exclude:["id","price","description","subcategory","brand","image1","image2","image3","image4"]},
            order: ["category"]
          })
            .then(function(products){
                let respuesta = {
                    meta: {
                        status: 200,
                        total: products.length
                    },
                    data: products,
                }
            res.json(respuesta);   
            });
    }
}

module.exports = apiProductsController;