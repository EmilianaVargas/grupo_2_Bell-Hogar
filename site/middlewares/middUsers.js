const fs = require('fs');
const path = require('path');
const {check, validationResult, body} = require('express-validator');

// Lee el JSON de usuarios
const usersFilePath = path.join(__dirname, '../data/users.json');
const usuariosDB = JSON.parse(fs.readFileSync(usersFilePath,'utf-8'));

function usersById(id){
    let usuario = null;
    usuariosDB.forEach((usu, i) => {
        if (usu["id"] == id) {
            usuario = usu;
        }
    });
    return usuario;
}

function searchByEmail(email){
    let usuario = null;
    usuariosDB.forEach((usu, i) => {
        if (usu["email"] == email) {
            usuario = usu;
        }
    });
    return usuario;
}

   let middUsers = {
      middNext: function(req, res, next){

        next();
    },
      registerUserValidation: [
         check('id')
            .exists().withMessage('DNI no definido.')
            .trim()
            .isNumeric({min: 8}).withMessage('Error: No es un DNI válido.'),
         check('nombre')
            .exists().withMessage('Nombre no definido.')
            .trim()
            .isLength({min: 3}).withMessage('Error: El Nombre debe tener al menos 3 caracteres.'),
         check('apellido')
            .exists().withMessage('Apellido no definido.')
            .trim()
            .isLength({min: 3}).withMessage('Error: El Apellido debe tener al menos 3 caracteres.'),
         check('telefono')
            .exists().withMessage('Telefono no definido.')
            .trim()
            .isNumeric().withMessage('Error: No es un telefono válido.'),
         check('domicilio')
            .exists().withMessage('Domicilio no definido.')
            .trim(),
         check('password')
            .exists().withMessage('Password no definido.')
            .trim()
            .isLength({min: 8}).withMessage('Error: La Contraseña debe contener al menos 8 caracteres.'),
         check('email')
            .exists().withMessage('Email no definido.')
            .isEmail().withMessage('El Email no es válido.')
            .normalizeEmail(),
         body().custom(function(req){
               if (req.password === req.password2) {
                  return true;
               }else {
                  return false;
               }
            }).withMessage('Error: Ambos campos de contraseña deben ser iguales.'),
         body('id').custom(function(id){
                let exist = usersById(id);
                if (exist == null) {
                   return true;
                }else{
                   return false;
                }
             }).withMessage('Error: DNI ya registrado.'),
         body('email').custom(function(email){
            let exist = searchByEmail(email);
            if (exist == null) {
               return true;
            }else{
               return false;
            }
         }).withMessage('Error: Email ya registrado.'),
      ],
   }

module.exports = middUsers;
