const fs = require('fs');
const path = require('path');
const bcrypt=require('bcrypt');
const {validationResult} = require('express-validator');

// Lee el JSON de usuarios
const usersFilePath = path.join(__dirname, '../data/users.json');
const usuariosDB = JSON.parse(fs.readFileSync(usersFilePath,'utf-8'));

// Guarda el json de usuarios
function saveJSONfile(users) {
    fs.writeFileSync(usersFilePath, JSON.stringify(users, null, ' '));
}

// Agrega un nuevo usuario
function addUser(nuevoUsuario) {
    usuariosDB.push(nuevoUsuario);
    saveJSONfile(usuariosDB);
}

let usersController = {
    'users': function(req,res){
        res.render('users/register');
    },
    'createUsers': function(req,res){
        res.render('users/register');
    },
    'postUser': function(req,res){
        let errors = validationResult(req);
	    if ( ! errors.isEmpty()) {
		    return res.render('users/register', {errors: errors.errors} );
        };

        let nuevoUser = {
            id: req.body.id,
            nombre: req.body.nombre,
            apellido: req.body.apellido,
            telefono: req.body.telefono,
            email: req.body.email,
            password: bcrypt.hashSync(req.body.password, 10),
            category: "user",
            image: req.file.filename,
            domicilio: req.body.domicilio
        }

        addUser(nuevoUser);
        res.render('index');
    },
}

module.exports = usersController;

