const express = require('express');
const router = express.Router();
const cartsController = require('../controllers/cartsController');
const {check, validationResult,body } = require('express-validator');

const middLogueados = require('../middlewares/middUsuariosLogueados')
const middInvitados = require('../middlewares/middInvitado')

// Detalle de productos en el carrito
router.get('/productCart', cartsController.productCart);

// Incorporacion de productos al carrito
//router.post('/', cartsController.addOneProduct);

// Confirmacion de carrito
router.get('/productCartPayment', middInvitados, cartsController.productCartPayment);
//router.put('/:id', cartsController.update);


//retiro en tienda



//envio a domicilio - vinculación con tabla Address
router.get('/addressCart', cartsController.address);
router.post('/addressCart', [
    check('domicilio').isLength({min: 3}).withMessage('- Domicilio inválido'),
    check('codigoPostal').isInt({min:5000, max:6000}).withMessage('- Código postal inválido'),
    check('localidad').isLength({min: 3}).withMessage('- Localidad inválida')
  ],cartsController.postAddress);

// Rutas de edición de usuario
//router.delete('/:id', cartsController.delete);

module.exports = router;
