const fs = require('fs');
const path = require('path');

/*function readHTML(index){
    let archivoHTML = fs.readFileSync(path.join(__dirname,'/../views/' + index),'utf-8')
    return archivoHTML;
}

/ ************ Function to Read an HTML File ************
*/
function readHTML (fileName) {
	let htmlFile = fs.readFileSync(path.join(__dirname, '/../views/'+fileName+'.html'), 'utf-8');
	return htmlFile;
}


let indexController = {
    'index': function(req,res){
            let indexHTML = readHTML('index');
            res.send(indexHTML);
    },
    'register': function(req,res){
        let registerHTML = readHTML('register');
            res.send(registerHTML);
    },
    'login': function(req,res){
        let loginHTML = readHTML('login');
            res.send(loginHTML);
    },
    'productDetail': function(req,res){
        let productDetailHTML = readHTML('productDetail');
            res.send(productDetailHTML);
    },
    'productCart': function(req,res){
        let productCartHTML = readHTML('productCart');
            res.send(productCartHTML);
    },
    'productAdd': function(req,res){
        let productAddHTML = readHTML('productAdd');
            res.send(productAddHTML);
    }
}

module.exports = indexController;



/*ver un resumen de la oferta - home
/producto:toda la información relevante del producto y poder agregar fácilmente el producto a mi carrito para poder
comprarlo
/carrito:detalle de mi carrito de compras en cualquier momento para finalizar la compra y poder modificar productos del carrito para poder eliminarlos
de la compra o modificar la cantidad.
/registro: registrarme para acceder a mi historial de compras y facilitar futuras compras.
/Página del backend de administración donde el personal del sitio carga nuevos
productos y gestiona los existentes:facilidad, saber si un campo es obligatorio para acelerar la
carga,  que el formulario me marque los errores para evitar cargar productos incompletos o erróneos.(No será necesario implementar ninguna funcionalidad más que los enlaces entre las diferentes
páginas. Para consignas como la validación de formularios deberán mostrar cómo se verán los errores aún si el formulario no esté funcional.)
*/
