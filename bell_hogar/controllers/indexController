const fs = require('fs');
const path = require('path');

function readHTML(index){
    let archivoHTML = fs.readFileSync(path.join(__dirname,'/../views/' + index),'utf-8')
    return archivoHTML;
}

let indexController = {
    index: function(req,res){
            let HTML = readHTML('index.html');
            res.send(HTML);
    }
}

module.exports = indexController;