const fs = require('fs');
const path = require('path');
let db = require('../database/models');

let productsController = {
    'products': function(req,res){
        db.product.findAll()
            .then(function(product){
                res.render('products/products',{product, usuario: req.session.usuarioLogueado});
            })         
    }, 
    'productDetail': function(req,res){
        db.product.findByPk(req.params.id)
            .then(function(product){
                if (req.session.usuarioLogueado == undefined) {
                    return res.render('products/productDetail', {product, usuario: undefined});
                 }else{
                    return res.render('products/productDetail', {product, usuario: req.session.usuarioLogueado});
                 }
            })
     },
     'createProduct': function(req,res){
        res.render('products/productAdd',{usuario: req.session.usuarioLogueado});
    },
    'postProduct': function(req,res){
        db.product.create({
            name: req.body.nombre,
            description: req.body.descripcion,
            category: req.body.categoria,
            subcategory:req.body.subcategoria,
            brand:req.body.marca,
            price:req.body.precio,
            image1:req.file.filename,
            stock:req.body.stock
        })
        res.render('index',{usuario: req.session.usuarioLogueado});
    },
    'editProduct': function(req,res){
        db.product.findByPk(req.params.id)
            .then(function(product){
                if (product != null) {
                    return res.render('products/editProduct', {product, usuario: req.session.usuarioLogueado});
                 }else{
                    return res.render('products/editProductError', {usuario: req.session.usuarioLogueado});
                 }
            })
    },
    'putEditProduct': function(req,res){
       db.product.update({
        name: req.body.nombre,
        category:req.body.categoria,
        subcategory:req.body.subcategoria,
        brand:req.body.marca,
        description: req.body.descripcion,
        price:req.body.precio,
        image1:req.file.filename,
        stock:req.body.stock
        }, {
            where:{
                id: req.params.id
                }
            });
        res.render('index',{usuario: req.session.usuarioLogueado});
    },
    'formuDelete':function(req,res){
        db.product.findByPk(req.params.id)
        .then(function(product){
            if (product != null) {
                return res.render('products/deleteProduct',{product,usuario: req.session.usuarioLogueado});
             }else{
                return res.render('products/editProductError',{usuario: req.session.usuarioLogueado});
             }
        })
    },
    'delete': function(req,res){
        db.product.destroy({
            where:{
                id: req.params.id
            }
        })
        res.render('index',{usuario: req.session.usuarioLogueado});  
    }
}

module.exports = productsController;

