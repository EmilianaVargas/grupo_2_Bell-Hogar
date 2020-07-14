var express = require('express');
var router = express.Router();
let productsController = require('../controllers/productsController');
const middUploadProductImage = require('../middlewares/middUploadProductImage');

// Ruta de listado de productos
router.get('/', productsController.products);

// Ruta GET - Creación de productos
router.get('/create', productsController.createProduct);
// Ruta POST - Guardado de creación de producto
router.post('/create', middUploadProductImage.uploadFile, productsController.postProduct);

// Ruta de producto clickeado - Detalle
router.get('/:id', productsController.productDetail);
 
// Rutas de Actualización de productos
router.get('/:id/edit', productsController.editProduct);   
router.put('/:id/edit', middUploadProductImage.uploadFile, productsController.putEditProduct);

// Rutas para eliminar un producto 
router.get('/:id/delete', productsController.formuDelete);
router.delete('/:id/delete', productsController.delete);

module.exports = router;