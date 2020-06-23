var express = require('express');
var router = express.Router();
let usersController = require('../controllers/usersController');
const middUploadFile = require('../middlewares/middUploadFile');
const middUsers = require('../middlewares/middUsers');

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

// Ruta de listado de usuarios
router.get('/', usersController.users);

// Ruta de creación de usuarios
router.get('/register', usersController.createUsers);
router.post('/create', middUsers.registerUserValidation, middUploadFile.uploadFile, usersController.postUser);

module.exports = router;
