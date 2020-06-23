var express = require('express');
var router = express.Router();
let usersController = require('../controllers/usersController');
const {check, validationResult } = require('express-validator');

// Ruta de login
router.get('/login', usersController.login);

// Ruta de login post
router.post('/login', [
  check('email').isEmail().withMessage('Email inválido'),
  check('password').isLength({min: 8}).withMessage('La contraseña debe tener al menos 8 caracteres')
],usersController.postLogin);

// Ruta de registro
router.get('/register', usersController.register);

module.exports = router;