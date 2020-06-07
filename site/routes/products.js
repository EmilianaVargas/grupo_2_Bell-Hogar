var express = require('express');
var router = express.Router();
let productsController = require('../controllers/productsController');
const middUploadFile = require('../middlewares/middUploadFile');

// Ruta de listado de productos
router.get('/', productsController.products);

// Ruta de creación de productos
router.get('/create', productsController.createProduct);

// Ruta de producto particular
router.get('/:id', productsController.productDetail);

// Ruta de creación de producto
router.post('/create', middUploadFile.uploadFile, productsController.postProduct);

// Ruta de edición de productos
router.get('/:id/edit', productsController.editProduct);   

// Ruta de envío de la edición
router.put('/:id/edit', productsController.putEditProduct);

// Ruta para eliminar un producto
router.get('/:id/delete', productsController.formuDelete);
router.delete('/:id', productsController.delete);

module.exports = router;