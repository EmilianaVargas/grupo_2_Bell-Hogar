var express = require('express');
var router = express.Router();
let indexController = require('../controllers/indexController');

// Ruta de inicio
router.get('/', indexController.index);

// Ruta de carrito
router.get('/productCart', indexController.productCart);

// Ruta de pago de carrito
router.get('/productCartPayment', indexController.productCartPayment);

module.exports = router;