const fs = require('fs');
const path = require('path');
const bcrypt=require('bcrypt');
const {check, validationResult,body } = require('express-validator');

// Lee el JSON de usuarios
const usersFilePath = path.join(__dirname, '../data/users.json');
const usuariosDB = JSON.parse(fs.readFileSync(usersFilePath,'utf-8'));
let users = JSON.parse(fs.readFileSync(usersFilePath,'utf-8'));

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
    'register': function(req,res){
        res.render('users/register');
    },
    'postregister': function(req,res){
        let errors = validationResult(req);
	    if (errors.isEmpty()) {
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
            addUser(nuevoUsuario);
            return res.render('index');
        }else{
            return res.render('users/register', {errors: errors.errors} );
        }
    },
    'login': function(req,res){
        res.render('login');
    },
    'postLogin': function(req,res){
        let errors = validationResult(req);
        if (errors.isEmpty()){
            for(var i = 0; i < users.length; i++){
                if(users[i].email == req.body.email){
                    if(req.body.password == users[i].password){
                        var usuarioPorLoguearse = users[i];   
                        break;
                    }
                }
            } 
            if(usuarioPorLoguearse == undefined){
                res.render('login', {errors:errors});
            } else {
                req.session.usuarioLogueado = usuarioPorLoguearse;
                res.render('index');
                
                if(req.body.recordame != undefined){ //los checkbox si no están tildados son undefined
                    let expiracion = new Date(Date.now() + 900000);
                    res.cookies('recordame', usuarioPorLoguearse.email, {expires: expiracion});
                    
                }
            }
        } else {
            res.render('login', {errors: errors})
        }
    }
}

module.exports = usersController;