const fs = require('fs');
const path = require('path');

let indexController = {
    'index': function(req,res){
        res.render('index');
    },
    'productDetail': function(req,res){
        res.render('productDetail');
    },
    'products': function(req,res){
        res.render('products');
    },
    'productCart': function(req,res){
        res.render('productCart');
    },
    'productAdd': function(req,res){
        res.render('productAdd');
    },
    'productCartPayment': function(req,res){
        res.render('productCartPayment');
    }
}

module.exports = indexController;