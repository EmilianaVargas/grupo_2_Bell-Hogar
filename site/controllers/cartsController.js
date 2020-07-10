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
            return res.render("carts/productCartPayment",{usuario: req.session.usuarioLogueado} );
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
        db.State.findAll()
        .then((states)=>{
            return res.render("carts/addressCart", {usuario: req.session.usuarioLogueado, states});
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
                    console.log("----------------------"+userId)
                    if (!address) {
                        res.render('carts/productCartPayment', { errors:errors.errors })
                    } else {
                        mensaje = "¡El domicilio de entrega se registro exitosamente!";
                        db.State.findAll().then((states)=>{
                            return res.render("carts/productCartPayment",{mensaje, status: "success", address:address , usuario: req.session.usuarioLogueado, states});
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