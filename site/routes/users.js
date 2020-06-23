var express = require('express');
var router = express.Router();
let usersController = require('../controllers/usersController');
const middUploadFile = require('../middlewares/middUploadFile');


/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});


// Ruta de listado de usuarios
router.get('/', usersController.users);

// Ruta de creación de usuarios
router.get('/create', usersController.createUsers);
router.post('/create', middUploadFile.uploadFile, usersController.postUser);

module.exports = router;
