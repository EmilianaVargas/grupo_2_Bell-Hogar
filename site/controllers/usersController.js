const fs = require('fs');
const path = require('path');
const bcrypt=require('bcrypt');
const {check, validationResult,body } = require('express-validator');

// Lee el JSON de usuarios
const usersFilePath = path.join(__dirname, '../data/users.json');
const usuariosDB = JSON.parse(fs.readFileSync(usersFilePath,'utf-8'));

// Guarda el json de usuarios
function saveJSONfile(usuariosDB) {
    fs.writeFileSync(usersFilePath, JSON.stringify(usuariosDB, null, ' '));
}

// Agrega un nuevo usuario
function addUser(nuevoUsuario) {
    usuariosDB.push(nuevoUsuario);
    saveJSONfile(usuariosDB);
}

let usersController = {
     'users': function(req,res){
        res.render('users/register');//aca debo imprimir todos los usuarios por nombre o un numero total de usuarios cargados??
    },
    'register': function(req,res){
        return res.render("users/register");
    },
    'postregister': function(req,res){
        let errors = validationResult(req); // validar variable errors
     if (typeof req.file == undefined) { // validar imagen avatar
       let nuevoError = {
         value: '',
         msg: 'Error: es obligatorio subir una imagen de perfil (jpg, jpeg o png).',
         param: 'image',
         location: 'files'
       }
       errors.errors.push(nuevoError);
     };

      // Si todo está bien, procedemos a guardar el nuevo usuario (ver de enviar a perfil de usuario!!!)
      if(errors.errors.length == 0){ //sin error
            let nuevoUsuario= {
                id: req.body.id,
                nombre: req.body.nombre,
                apellido: req.body.apellido,
                telefono: req.body.telefono,
                email: req.body.email,
                password: bcrypt.hashSync(req.body.password, 10),
                category: "user",
                image: req.file.filename,
                domicilio: req.body.domicilio
            };
            let mensaje = null;
            addUser(nuevoUsuario);
            mensaje = "¡El usuario se creó exitosamente!";
            return res.render('users/login',{mensaje: mensaje, status: "success", nuevoUsuario: nuevoUsuario.nombre + nuevoUsuario.apellido});
        }else{
            return res.render('users/register', {errors:errors.errors, status: "error", nuevoUsuario: undefined } );
        }
    },
    'login': function(req,res){
        res.render('users/login');
    },
    'postLogin': function(req,res){
        let errors = validationResult(req);
        if (errors.isEmpty()){
            for(var i = 0; i < usuariosDB.length; i++){
                if(usuariosDB[i].email == req.body.email){
                    if(req.body.password == usuariosDB[i].password){
                        var usuarioPorLoguearse = usuariosDB[i];
                        break;
                    }
                }
            }
            if(usuarioPorLoguearse == undefined){
                res.render('users/login', {errors:errors.errors});
            } else {
                req.session.usuarioLogueado = usuarioPorLoguearse;
                if(req.body.recordame != undefined){ //los checkbox si no están tildados son undefined
                    let expiracion = new Date(Date.now() + 900000);
                    res.cookie('recordame', usuarioPorLoguearse.email, {expires: expiracion});
                }
                res.render('index', {usuario: usuarioPorLoguearse});
            }
        } else {
            res.render('users/login', {errors: errors.errors})
        }
    },
    'profile': function(req,res){
        if(req.session.usuarioLogueado != undefined){
            res.render('users/profile',{usuario: req.session.usuarioLogueado})
        } else {
            res.render('error-invitados')
        }
    },
    'logout': (req,res) => {
        req.session.destroy(function(){
           if (req.cookies.recordame != undefined) {
              res.clearCookie("recordame"); 
           };
           let mensaje = "Se cerró la sesión exitosamente";
           return res.render("users/login",{mensaje, status: "success", usuario: undefined});
        });
     },
}

module.exports = usersController;