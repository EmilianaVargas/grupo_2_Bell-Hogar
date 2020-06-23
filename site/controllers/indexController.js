const fs = require('fs');
const path = require('path');

/************ Function to Read an HTML File ************ YA NO SE UTILIZA
*/
// function readHTML (fileName) {
// 	let htmlFile = fs.readFileSync(path.join(__dirname, '/../views/'+fileName+'.html'), 'utf-8');
// 	return htmlFile;
// }


let indexController = {
    'index': function(req,res){
            res.render('index');
    },
    /*'register': function(req,res){
        res.render('register');
    },*/
    'login': function(req,res){
        res.render('login');
            //res.send(loginHTML);
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


