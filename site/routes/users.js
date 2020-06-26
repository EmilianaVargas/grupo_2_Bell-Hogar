var express = require('express');
var router = express.Router();
let usersController = require('../controllers/usersController');
const {check, validationResult,body } = require('express-validator');
const middUploadFile = require('../middlewares/middUploadFile');
const middUsers = require('../middlewares/middUsers');
const middLogueados = require('../middlewares/middUsuariosLogueados')
const middInvitados = require('../middlewares/middInvitado')


// Ruta de login
router.get('/login',middLogueados, usersController.login);


// Ruta de profile
router.get('/profile',middInvitados, usersController.profile);

// Ruta de listado de usuarios
router.get('/', usersController.users);

// Ruta de creación de usuarios
router.get('/register', middLogueados, usersController.register);
router.post('/create', middUploadFile.uploadFile, middUsers.registerUserValidation, usersController.postregister);

// Ruta de login post
router.post('/login', [
  check('email').isEmail().withMessage('- Email inválido'),
  check('password').isLength({min: 8}).withMessage('- La contraseña debe tener al menos 8 caracteres')
],usersController.postLogin);

// Ruta de check
router.get('/success', function(req,res){
  if(req.session.usuarioLogueado == undefined){
      res.send("No estás logueado");
  } else {
      res.send("El usuario logueado es " + req.session.usuarioLogueado.nombre + " y su email es " + req.session.usuarioLogueado.email);
  }
});

// Ruta de logout
router.post('/logout', usersController.logout);

module.exports = router;

