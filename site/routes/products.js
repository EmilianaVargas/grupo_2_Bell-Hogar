var express = require('express');
var router = express.Router();
let productsController = require('../controllers/productsController');

// Ruta de listado de productos
router.get('/', productsController.products);

// Ruta de creación de productos
router.get('/create', productsController.createProduct);

// Ruta de producto particular
router.get('/:id', productsController.productDetail);

// Ruta de creación de producto
router.post('/create', productsController.postProduct);

// Ruta de edición de productos
router.get('/:id/edit', productsController.editProduct);   

// Ruta de envío de la edición
router.put('/:id/edit', productsController.putEditProduct);

// Ruta para eliminar un producto
router.delete('/:id', productsController.deleteProduct);

module.exports = router;