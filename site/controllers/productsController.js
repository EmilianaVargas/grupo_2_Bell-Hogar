const fs = require('fs');
const path = require('path');
let db = require('../database/models');
const {check, validationResult,body } = require('express-validator');

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
        let errors = validationResult(req); // validar variable errors
        if (typeof req.file == undefined) { // validar imagen 
            let nuevoError = {
                value: '',
                msg: 'Error: es obligatorio subir una imagen de producto(jpg, jpeg o png).',
                param: 'image',
                location: 'files'
            }
            errors.errors.push(nuevoError);
        };
        
        if(errors.errors.length == 0){
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
            .then((creacion) => {
                if (!creacion) {
                    res.render('index', { errors:errors.errors })
                } else {
                    mensaje = "¡El producto se creó exitosamente!";
                    return res.render('index',{mensaje: mensaje, status: "success", usuario:req.session.usuarioLogueado});
                }
            })
            .catch(function(err){
                console.log(err);
            })
        } else {
            return res.render("products/productAdd",{errors: errors.errors} );
        }
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
        let errors = validationResult(req); // validar variable errors
        if (typeof req.file == undefined) { // validar imagen 
            let nuevoError = {
                value: '',
                msg: 'Error: es obligatorio subir una imagen de producto(jpg, jpeg o png).',
                param: 'image',
                location: 'files'
            }
            errors.errors.push(nuevoError);
        };

        if(errors.errors.length == 0){
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
            })            
            .then((edicion) => {
                if (!edicion) {
                    res.render('index', { errors:errors.errors })
                } else {
                    mensaje = "¡El producto se actualizó exitosamente!";
                    return res.render('index',{mensaje: mensaje, status: "success", usuario:req.session.usuarioLogueado});
                }
            })
            .catch(function(err){
                console.log(err);
            })
        }else{
            res.render('index',{errors: errors.errors});
        }
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

