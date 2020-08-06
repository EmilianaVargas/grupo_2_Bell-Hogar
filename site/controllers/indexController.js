const fs = require('fs');
const path = require('path');
let db = require('../database/models');


let indexController = {
    'index': function(req,res){
        let mensaje = ""
        res.render('index',{usuario: req.session.usuarioLogueado, mensaje:mensaje});
    },
    // 'productCart': function(req,res){
    //     res.render('productCart',{usuario: req.session.usuarioLogueado});
    // // },
    // 'productAdd': function(req,res){
    //     res.render('productAdd',{usuario: req.session.usuarioLogueado});
    // },
    // 'productCartPayment': function(req,res){
    //     res.render('productCartPayment',{usuario: req.session.usuarioLogueado});
    // }
    'news': function(req,res){
        db.Newsletter.create({
            email: req.body.email
        })
            .then(function(newsletter){
                let mensaje = "Ya te suscribiste a las mejores ofertas"
                res.render('index',{mensaje:mensaje})
            })
    }
}

module.exports = indexController;