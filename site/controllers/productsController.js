const fs = require('fs');
const path = require('path');

// Lee el JSON de productos
const productsFilePath = path.join(__dirname, '../data/products.json');
const productosDB = JSON.parse(fs.readFileSync(productsFilePath,'utf-8'));

// Guarda el json de productos
function saveJSONfile(products) {
    fs.writeFileSync(productsFilePath, JSON.stringify(products, null, ' '));
}

// Agrega un nuevo producto
function addProduct(nuevoProducto) {
    productosDB.push(nuevoProducto);
    saveJSONfile(productosDB);
}

function productById(id){
    let producto = null;
    productosDB.forEach((prod, i) => {
        if (prod["id"] == id) {
            producto = prod;
        }
    });
    return producto;
}

let productsController = {
    'products': function(req,res){
        res.render('products');
    },
    'createProduct': function(req,res){
        res.render('productAdd');
    },
    'productDetail': function(req,res){
        res.render('productDetail');
    },
    'postProduct': function(req,res){
        //Falta verificación de que el producto no exista previamente
        let nuevoProducto = {
            id: req.body.id,
            name: req.body.nombre,
            description: req.body.descripcion,
            category:req.body.categoria,
            colors:req.body.colores,
            price:req.body.precio,
            stock:req.body.stock
        }
        addProduct(nuevoProducto);
        res.render('productAdd');
    },
    'editProduct': function(req,res){
        let product = productById(req.params.id);
        if(product != null){
            return res.render('editProduct',{product})
        } else {
            return res.render('editProductError');
        }
    },
    'putEditProduct': function(req,res){
        let product = productById(req.body.id);
        let products = productosDB;
        
        if (product != null) {
            product.name = req.body.nombre;
            
            products.map((prod) => {
                prod.name = product.name;
            });
            
            saveJSONfile(products);
            res.render('products');
        }
    },
    'formuDelete':function(req,res){
        let product = productById(req.params.id);
        if(product != null){
            return res.render('deleteProduct',{product});
        } else {
            return res.render('editProductError');
        }
    },
    'delete': function(req,res){
        let product = productById(req.body.id);
        let nuevoArrayProductos = [];
        let products = productosDB;
        
        nuevoArrayProductos = products.filter(prod => prod.id != product.id); //¿Por qué no pop?
        saveJSONfile(nuevoArrayProductos);
        //let mensaje = "El producto se eliminó con éxito de la lista.";
        return res.render("products",{products});
    }
}

module.exports = productsController;

