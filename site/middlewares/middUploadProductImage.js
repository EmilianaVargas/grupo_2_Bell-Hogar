const multer = require('multer'); // file uploads
const path = require('path');

// Start File uploads config ---------------------------------------------------------
var storage = multer.diskStorage({
  destination: path.join(__dirname,'../public/images'),
  filename: function (req, file, cb) {
    cb(null, file.originalname);
    console.log(file);
  }
});

var upload = multer({
  storage: storage,
  fileFilter: function (req, file, callback) {
    var ext = path.extname(file.originalname);
    ext = ext.toLowerCase(); //para convertir a minuscula extension de image en mayuscula

    if(ext !== '.png' && ext !== '.jpg' && ext !== '.jpeg') {
        return callback(new Error('La iamgen de ser JPG, PNG, JPEG.'))
      }
    callback(null, true)
  }
}).array('images',3);


// End File uploads config ---------------------------------------------------------


let uploadFile = {
  uploadFile: function (req,res,next) {
    upload(req, res, function(err){ // invocamos la función upload de multer para subir el archivo de avatar
      if(err) {
        console.log(err);
        return res.render("products/productAdd", {errors: err});
      } else { 
          next(); 
        } // todo salió bien, continuamos al próximo middleware
    });
  }
}
module.exports = uploadFile;
