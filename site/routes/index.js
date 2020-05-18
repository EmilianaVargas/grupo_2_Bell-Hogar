var express = require('express');
var router = express.Router();
let indexController = require('../controllers/indexController');

// Ruta de inicio
router.get('/', indexController.index);

// Ruta de registro
router.get('/register', indexController.register);

// Ruta de login   (ver si la ruta debe ser register/login!!!!)
router.get('/login', indexController.login);

// Ruta de detalle de producto
router.get('/productDetail', indexController.productDetail);

// Ruta de detalle de producto
router.get('/products', indexController.products);

// Ruta de carrito
router.get('/productCart', indexController.productCart);

// Ruta de administracion de producto - backend
router.get('/productAdd', indexController.productAdd);

// Ruta de pago de carrito
router.get('/productCartPayment', indexController.productCartPayment);

module.exports = router;