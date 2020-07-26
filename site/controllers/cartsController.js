const fs = require('fs');
const path = require('path');
const {check, validationResult,body } = require('express-validator');
let db=require('../database/models');
const sequelize = db.sequelize;
const usersController = require('./usersController');
let productsController = require('./productsController');


let cartsController = {
    'renderWithMessage'(req, res, mensaje=null, status=null){
        let msj = mensaje;
        let stat = status;
        usersController.refreshUser(req, res) 
        .then(function(usuarioRefrescado){
           return res.render("productCart", {mensaje: msj, status: stat, usuario: req.session.usuarioLogueado});
        }).catch(function(error){
           let mensaje = "Error: no se pudieron obtener los datos del carro de compras. Detalle: " + error;
           let status = "error";
           return res.render("productCart", {mensaje: mensaje, status: status, usuario: req.session.usuarioLogueado});
        });
     },
    'productCart': function(req,res){
        //cartsController.renderWithMessage(req,res);
        if(req.session.usuarioLogueado == undefined){
            mensaje = "¡Ingresá tu email y contraseña para continuar";
            return res.render('users/login',{mensaje: mensaje, status: "success"});
        } else {
            db.Cart.findOne({
                include:[
                    {association:"Product"},
                    {association:"User"},
                ],
                where:{
                    user_id: req.session.usuarioLogueado
                    //y que el status del carrito sea activo (no finalizado/confirmado)
                },
            })
            .then(function(cartProduct){
                if (cartProduct == null) {
                    mensaje = "Aun no hay productos cargados en tu carrito";
                    return res.render("carts/productCart",{products:undefined, mensaje: mensaje, status: "success", usuario: req.session.usuarioLogueado});
                }else{
                    return res.render("carts/productCart",{products: cartProduct.Product, usuario: req.session.usuarioLogueado});
                }
            })
            .catch(error=>console.log(error))
        }
    },
    'productCartPayment': function(req,res){
        console.log("domicilio-------->" + req.query.domicilio);
        if(req.query.domicilio != undefined){
            db.Address.findOne({
                where: {
                    id: req.query.domicilio
                },
                include: db.State
            }).then((address)=>{
                return res.render("carts/cartPayment",{usuario: req.session.usuarioLogueado, address});
            });
        } else {
            return res.render("carts/cartPayment",{usuario: req.session.usuarioLogueado, address: undefined});
        }
    },
    'addProduct': function(req,res){
        if(req.session.usuarioLogueado == undefined){
            mensaje = "¡Ingresá tu email y contraseña para continuar";
            return res.render('users/login',{mensaje: mensaje, status: "success"});
        } else {
            db.Cart.findOne({
                include:[
                    {association:"Product"},
                    {association:"User"},
                ],
                where:{
                    user_id: req.session.usuarioLogueado,
                    finished: false,
                },
            })
            .then(function(carrito){
                let productFind = null;
                for (i=0; i<carrito.Product.length; i++){
                    if(carrito.Product[i].id == req.params.id){
                        productFind = carrito.Product[i];
                        break;
                    }
                }
                if(productFind!=null){
                    let mensaje = "Atención!: El producto que deseas ya estaba añadido a tu carrito de compras!";
                    let status = "warning";
                    productsController.renderWithMessage(req, res, mensaje, status);
                }else{
                    db.cartProduct.create({
                        cart_id:carrito[i].id,
                        product_id: req.params.id,
                        units: 1,
                    })
                    .then(function(item){ 
                        let mensaje = `El producto [Codigo ${item.product_id}] se agregó a tu carrito de compras.`;
                        let status = "info";
                        productsController.renderWithMessage(req, res, mensaje, status);
                     })
                    .catch(function(error) { 
                        let mensaje = "Error: el producto no se pudo agregar al carrito de compras. Detalle: " + error;
                        let status = "error";
                        productsController.renderWithMessage(req, res, mensaje, status);
                     });
                }
                res.render("carts/productCart",{carrito: carrito.Product, usuario: req.session.usuarioLogueado});
            })
            .catch(error=>console.log(error))
        }
    },
    'confirm': function(req,res){
        //db.____.update/findOrCrate().then((_________)=>{
            return res.render("____" );
       // });
    },
    'address': function(req,res){
        let dbStates = db.State.findAll();
        let dbUserAddresses = db.Address.findAll({
            where: {
                user_id: req.session.usuarioLogueado.id
            },
            include: db.State
        });
        Promise.all([dbStates, dbUserAddresses])
        .then(([states, addresses]) => {
            return res.render("carts/addressCart", {usuario: req.session.usuarioLogueado, states, addresses});
        });
    },
    'postAddress': function(req,res){
        let errors = validationResult(req);
            if(errors.errors.length == 0){
                let userId = req.session.usuarioLogueado.id;

                db.Address.create({
                    address: req.body.domicilio,
                    zip_code: req.body.codigoPostal,
                    locality: req.body.localidad,
                    state_id: req.body.provincia,
                    user_id: userId
                })
                .then((address) => {
                    console.log("----------------------"+address)
                    if (!address) {
                        res.render('carts/productCartPayment', { errors:errors.errors })
                    } else {
                        db.Address.findOne({
                            where: {
                                id: address.id
                            },
                            include: db.State
                        }).then((address)=>{
                            mensaje = "¡El domicilio de entrega se registró exitosamente!";
                            return res.render("carts/productCartPayment",{mensaje, status: "success", address, usuario: req.session.usuarioLogueado});
                        });
                    }
                }).catch(function(err){
                    console.log(err);
                })
            } else {
                console.log(errors)
                let dbStates = db.State.findAll();
                let dbUserAddresses = db.Address.findAll({
                    where: {
                        user_id: req.session.usuarioLogueado.id
                    },
                    include: db.State
                });
                Promise.all([dbStates, dbUserAddresses])
                .then(([states, addresses]) => {
                    return res.render("carts/addressCart", {usuario: req.session.usuarioLogueado, states, addresses, errors: errors.errors});
                });
                //return res.render("carts/addressCart",{errors: errors.errors} );
            }
    },
    'delete': function(req,res){
        //db.____.destroy().then((_________)=>{
            return res.render("____" );
       // });
    },

}

module.exports = cartsController
