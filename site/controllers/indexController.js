const fs = require('fs');
const path = require('path');


let indexController = {
    'index': function(req,res){
        res.render('index',{usuario: req.session.usuarioLogueado});
    },
    'productCart': function(req,res){
        res.render('productCart',{usuario: req.session.usuarioLogueado});
    },
    'productAdd': function(req,res){
        res.render('productAdd',{usuario: req.session.usuarioLogueado});
    },
    'productCartPayment': function(req,res){
        res.render('productCartPayment',{usuario: req.session.usuarioLogueado});
    }
}

module.exports = indexController;