var express = require('express');
var router = express.Router();
let usersController = require('../controllers/usersController');
const {check, validationResult } = require('express-validator');
const middUploadFile = require('../middlewares/middUploadFile');
const middUsers = require('../middlewares/middUsers');

// Ruta de login
router.get('/login', usersController.login);

// Ruta de listado de usuarios
router.get('/', usersController.users);

// Ruta de creación de usuarios
router.get('/register', usersController.createUsers);
router.post('/create', middUsers.registerUserValidation, middUploadFile.uploadFile, usersController.postUser);

// Ruta de login post
router.post('/login', [
  check('email').isEmail().withMessage('Email inválido'),
  check('password').isLength({min: 8}).withMessage('La contraseña debe tener al menos 8 caracteres')
],usersController.postLogin);

// Ruta de registro
router.get('/register', usersController.register);

module.exports = router;

