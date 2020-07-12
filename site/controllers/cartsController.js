const fs = require('fs');
const path = require('path');
const {check, validationResult,body } = require('express-validator');
let db=require('../database/models');
const sequelize = db.sequelize;

let cartsController = {
    'productCart': function(req,res){
       res.render('carts/productCart',{usuario: req.session.usuarioLogueado});
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
                return res.render("carts/productCartPayment",{usuario: req.session.usuarioLogueado, address});
            });
        } else {
            return res.render("carts/productCartPayment",{usuario: req.session.usuarioLogueado, address: undefined});
        }

        // db.Address.findAll({
        //     limit: 1,
        //     where: {
        //         user_id: req.session.usuarioLogueado.id
        //     },
        //     order: [ [ 'createdAt', 'DESC' ]],
        //     include: db.State
        // }).then((address) => {
        //     return res.render("carts/productCartPayment",{usuario: req.session.usuarioLogueado, address: address} );
        // })
    },
    'addOneProduct': function(req,res){
        //db.___.findAll().then((______)=>{
            return res.render("______" );
       // });
    },
    'update': function(req,res){
        //db.____.findAll().then((_________)=>{
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
                return res.render("carts/productCartPayment",{errors: errors.errors} );
            }
    },
    'delete': function(req,res){
        //db.____.findAll().then((_________)=>{
            return res.render("____" );
       // });
    },

}

module.exports = cartsController