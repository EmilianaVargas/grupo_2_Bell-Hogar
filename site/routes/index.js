var express = require('express');
var router = express.Router();
let indexController = require('../controllers/indexController');
let middInvitado = require('../middlewares/middInvitado')

// Ruta de inicio
router.get('/', indexController.index);

// Ruta de carrito
router.get('/productCart', indexController.productCart);

// Ruta de pago de carrito
router.get('/productCartPayment', middInvitado, indexController.productCartPayment);

module.exports = router;