function logueadosMidd(req,res,next){
    if(req.session.usuarioLogueado == undefined){
        next();
    } else {
        res.render('error-logueados')
    }
}

module.exports = logueadosMidd;