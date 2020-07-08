const fs = require('fs');
const path = require('path');
const bcrypt=require('bcrypt');
const {check, validationResult,body } = require('express-validator');
let db = require('../database/models');

let usersController = {
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
                db.User.findOrCreate({
                    where: { email: req.body.email },
                    defaults: {
                        first_name: req.body.nombre,
                        last_name: req.body.apellido,
                        phone: req.body.telefono,
                        email: req.body.email,
                        password: bcrypt.hashSync(req.body.password, 10),
                        is_admin: false,
                        image: req.file.filename,
                        address_id:null,
                        payment_id:null
                    }
                })
                .then(([usuario, creacion]) => {
                    if (!creacion) {
                        res.render('users/login', { errors: [{ msg: 'Usuario ya existente'}] })
                    } else {
                        mensaje = "¡El usuario se creó exitosamente!";
                        return res.render('users/login',{mensaje: mensaje, status: "success", usuario});
                    }
                }).catch(function(err){
                    console.log(err);
                })
            } else {
            res.render('users/register', {errors: errors.errors })
            }
        },
    'login': function(req,res){
        res.render('users/login');
    },
    'postLogin': function(req,res){
        let errors = validationResult(req);
        if (errors.isEmpty()){
           db.User.findOne({
               where: {
                   email: req.body.email
                },
            }).then((usuarioPorLoguearse) => {
            if (usuarioPorLoguearse != null) {
                if (bcrypt.compareSync(req.body.password, usuarioPorLoguearse.password)) {
                    req.session.usuarioLogueado = usuarioPorLoguearse;
                        if(req.body.recordame != undefined){ //los checkbox si no están tildados son undefined
                            let expiracion = new Date(Date.now() + 900000);
                            res.cookie('recordame', usuarioPorLoguearse.email, {expires: expiracion});
                        };
                    res.render('index', {usuario: usuarioPorLoguearse});
                }else {
                    res.render('users/login', {errors: errors.errors})
                };
            } else {
                res.render('users/register', { errors: [{ msg: 'El usuario no existe, favor de registrarse'}] })
            };
            }).catch(function(error){
                console.log(error);
            });
        }
    },
    'profile': function(req,res){
        if(req.session.usuarioLogueado != undefined){
            res.render('users/profile',{usuario: req.session.usuarioLogueado})
        } else {
            res.render('users/error-invitados')
        }
    },
    'edit':function(req,res){
        if(req.session.usuarioLogueado != undefined){
            res.render('users/update',{usuario: req.session.usuarioLogueado});
        } else {
            res.render('users/error-invitados')
        }
    },
    'update':function(req,res){
        let errors = validationResult(req); // validar variable errors
        // if (typeof req.file == undefined) { // validar imagen avatar
        //     let nuevoError = {
        //         value: '',
        //         msg: 'Error: es obligatorio subir una imagen de perfil (jpg, jpeg o png).',
        //         param: 'image',
        //         location: 'files'
        //     }
        //     errors.errors.push(nuevoError);
        //     };
        if(errors.errors.length == 0){ //sin error procedemos a guardar el usuario editado
            console.log("edit");
            db.User.update({
                first_name: req.body.nombre,
                last_name: req.body.apellido,
                phone: req.body.telefono,
                },{
                    where:{
                        email: req.body.email
                    }
                })
                .then((updatedUser) => {
                    console.log("edit: " + updatedUser);
                    return res.redirect("profile");
                }).catch(function(err){
                        console.log('error en catch en:' + err);
                })
        } else {
            console.log("edit: render");
            res.render('users/update', {errors: errors.errors })
        };
    },
    'editAvatar': function(req,res){
        return res.render("users/editAvatar");
    },
    // 'updateAvatar': function(req,res){
        
    // },
    'editPassword': function(req,res){
        return res.render("users/editPassword");
    },
    // 'updatePassword': function(req,res){
       
    // },


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