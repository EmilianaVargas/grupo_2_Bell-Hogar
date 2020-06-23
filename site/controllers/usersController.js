const fs = require('fs');
const path = require('path');
const { validationResult } = require('express-validator');
let usersFilePath = path.join(__dirname, '../data/users.json');
let users = JSON.parse(fs.readFileSync(usersFilePath,'utf-8'));

let usersController = {
'register': function(req,res){
    res.render('register');
},
'login': function(req,res){
    res.render('login');
},
'postLogin': function(req,res){
    let errors = validationResult(req);
    if (errors.isEmpty()){
        for(var i = 0; i < users.length; i++){
            if(users[i].email == req.body.email){
                var usuarioPorLoguearse = users[i];
            }
        }
        if(usuarioPorLoguearse == undefined){
            res.render('login', {errors:errors});
        } else {
            req.session.usuarioLogueado = usuarioPorLoguearse;
            res.render('index',{usuarioPorLoguearse: usuarioPorLoguearse})
            
            if(req.body.recordame != undefined){ //los checkbox si no están tildados son undefined
                res.cookie('recordame', usuarioPorLoguearse.email, {maxAge: 90000000000000000});
                
            }
        }
    } else {
        res.render('login', {errors: errors})
    }
}
}

module.exports = usersController;