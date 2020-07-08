const fs = require('fs');
const path = require('path');
let db=require('../database/models');
const sequelize = db.sequelize;

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
    let product = null;
    productosDB.forEach((prod, i) => {
        if (prod["id"] == id) {
            product = prod;
        }
    });
    return product;
}


let productsController = {
    'products': function(req,res){
        /*
        db.Producto.findAll({
            include:[{association:"productCategory"},{association:"productBrand"}]
        })
        .then(function(producto){
            res.render('products/products',{usuario: req.session.usuarioLogueado, producto})
        })
        */
        res.render('products/products',{usuario: req.session.usuarioLogueado, products: productosDB});
    },
    'createProduct': function(req,res){
        /*
        db.Category.findAll()
        .then(function(categories){
            return res.render('products/productAdd',{categories:categories})
        }),
        db.subCategory.findAll()
        .then(function(subCategory){
            return res.render('products/productAdd',{subCategory:subCategory})
        }),
        db.Marca.findAll()
        .then(function(marcas){
            return res.render('products/productAdd',{marcas:marcas})
        })
*/

        res.render('products/productAdd',{usuario: req.session.usuarioLogueado});
    },
    'productDetail': function(req,res){
        /* 
        db.Producto.findByPk(req.params.id,{
            include:[{association:"productCategory"},{association:'productMarca'}]
        })
            .then(function(producto){
                if (req.session.usuarioLogueado == undefined) {
                    return res.render('products/productDetail', {producto, usuario: undefined});
                 }else{
                    return res.render('products/productDetail', {producto, usuario: req.session.usuarioLogueado});
                 }
        })
*/
        let product = productById(req.params.id);
        if (req.session.usuarioLogueado == undefined) {
           return res.render('products/productDetail', {product, usuario: undefined});
        }else{
           return res.render('products/productDetail', {product, usuario: req.session.usuarioLogueado});
        }
     },
    'postProduct': function(req,res){
        /*  
        db.Producto.create({
            name: req.body.nombre,
            description: req.body.descripcion,
            category_id:req.body.categoria,
            subCategory_id:req.body.subCategory,
            marca_id:req.body.marca,
            unit_price:req.body.precio,
            stock:req.body.stock
        });
        res.redirect('products/products');*/

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
        res.render('products/products');
    },
    'editProduct': function(req,res){
/* ver nombre de variable "products" o "producto" segun vista o bs respectivamente
        let pedidoProducto=db.Producto.findByPk(req.params.id);
        let pedidoCategory=db.Category.findAll();
        let pedidoSubcategory=db.subCategory.findAll();
        let pedidoMarca=db.Marca.findAll();

        Promise.all([pedidoProducto, pedidoCategory,pedidoSubcategory,pedidoMarca])
        .then(function([producto,categories,subCategory,marcas]){
            if(producto != null){
                return res.render('products/editProduct',{producto,categories,subCategory,marcas})
            } else {
                return res.render('products/editProductError',{usuario: req.session.usuarioLogueado});
            }
        }),
      */

        let product = productById(req.params.id);
        if(product != null){
            return res.render('products/editProduct',{product})
        } else {
            return res.render('products/editProductError',{usuario: req.session.usuarioLogueado});
        }
    },
    'putEditProduct': function(req,res){
        /*
       db.Producto.update({
        name: req.body.nombre,
        description: req.body.descripcion,
        category_id:req.body.categoria,
        subCategory_id:req.body.subCategory,
        marca_id:req.body.marca,
        unit_price:req.body.precio,
        stock:req.body.stock
        }, {
            where:{
                id: req.params.id
                }
            });
        res.redirect('products/products' + req.params.id);
        */
        let product = productById(req.body.id);
        let products = productosDB;
        
        
        if (product != null) {
            product.name = req.body.name;
            product.description = req.body.description;
            product.category = req.body.category;
            product.colors = req.body.colors;
            product.price = req.body.price;
            product.stock = req.body.stock;
            
            products.map((prod) => {
                if(prod.id === product.id){
                prod.name = product.name;
                prod.description = product.description;
                prod.category = product.category;
                prod.colors = product.colors;
                prod.price = product.price;
                prod.stock = product.stock;
            }});
            
            saveJSONfile(products);
            res.render('products/products');
        }
    },
    'formuDelete':function(req,res){
        let product = productById(req.params.id);
        if(product != null){
            return res.render('products/deleteProduct',{product,usuario: req.session.usuarioLogueado});
        } else {
            return res.render('products/editProductError');
        }
    },
    'delete': function(req,res){
        /* primero eliminar toda la info de tablas asociadas
       db.Producto.destroy({
            where:{id= req.params.id}
        });
        res.redirect('products/products');
        };
*/
        let product = productById(req.body.id);
        let nuevoArrayProductos = [];
        let products = productosDB;
        
        nuevoArrayProductos = products.filter(prod => prod.id != product.id);
        saveJSONfile(nuevoArrayProductos);
        return res.render('products/products');
    }
}

module.exports = productsController;

