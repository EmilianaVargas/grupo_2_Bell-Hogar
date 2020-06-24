const path = require('path');
const fs = require('fs');
let usersFilePath = path.join(__dirname, '../data/users.json');
let users = JSON.parse(fs.readFileSync(usersFilePath,'utf-8'));

function  middRecordame(req,res,next){
    if(req.cookie.recordame != undefined && req.session.usuarioLogueado == undefined){
        for(let i=0; i<users.length; i++){
            if(users[i].email == req.cookies.recordame){
                usuarioPorLoguearse = users[i]
                break;
            }
        }
        req.session.usuarioLogueado = usuarioPorLoguearse;
    }
}

module.exports = middRecordame;