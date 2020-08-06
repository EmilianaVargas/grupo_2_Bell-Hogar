window.addEventListener("load", function(){
    let formulario = document.querySelector("form.productAdd")
    formulario.addEventListener("submit", function(evento){
        let errores = [];

        let campoNombre = document.querySelector("input#nombre");
            if(campoNombre.value.length<5){
                evento.preventDefault();
            errores.push("El campo nombre debe tener al menos 5 caracteres");
            alert("El campo nombre debe tener al menos 5 caracteres");
            }

        let campoDescripcion = document.querySelector("input#descripcion");
        if(campoDescripcion.value.length<20){
            evento.preventDefault();
            errores.push("El campo descripción debe tener al menos 20 caracteres");
            alert("El campo descripción debe tener al menos 20 caracteres");
            }

        let campoCategoria = document.querySelector("input#categoria");
        if(campoCategoria.value == ""){
            evento.preventDefault();
            errores.push("El campo categoria está vacío");
            alert("El campo categoria no debe estar vacío");
            }

        let campoSubcategoria = document.querySelector("input#subcategoria");
        if(campoSubcategoria.value == ""){
            evento.preventDefault();
            errores.push("El campo subcategoria está vacío");
            alert("El campo subcategoria no debe estar vacío");
            }

        let campoMarca = document.querySelector("input#marca");
        if(campoMarca.value == ""){
            evento.preventDefault();
            errores.push("El campo marca está vacío");
            alert("El campo marca no debe estar vacío");
            }

        let campoPrecio = document.querySelector("input#precio");
        if(campoPrecio.value < 0){
            evento.preventDefault();
            errores.push("El campo precio debe ser un número positivo");
            alert("El campo precio debe ser un número positivo");
            }

        let campoImages = document.querySelector("input#images");
        var filePath = campoImages.value;
        var allowedExtensions = /(.jpg|.jpeg|.png|.gif)$/i;
            if(campoImage1.value != undefined){
                if(!allowedExtensions.exec(filePath)){
                    evento.preventDefault();
                    errores.push("Debe subir 3 imágenes con extensión .jpg, .jpeg, .png o .gif")
                    alert("Debe subir 3 imágenes con extensión .jpg, .jpeg, .png o .gif")
                }
            }

        let campoStock = document.querySelector("input#stock");
            if(campoStock.value < 0){
                evento.preventDefault();
                errores.push("El campo Stock debe ser un número positivo");
                alert("El campo Stock debe ser un número positivo");
            }

        if(errores.length > 0){
            let ulErrores = document.querySelector(".ul-div-errores");
                for (let i = 0; i < errores.length; i++) {
                ulErrores.innerHTML += "<li>" +errores[i]+"</li>";
            }
        }
    });
});

window.addEventListener("load", function(){
    let formulario = document.querySelector("form.editProduct")
    formulario.addEventListener("submit", function(evento){
        let errores = [];

        let campoNombre = document.querySelector("input#nombre");
            if(campoNombre.value.length<5){
                evento.preventDefault();
            errores.push("El campo nombre tiene menos de 5 caracteres");
            alert("El campo nombre debe tener al menos 5 caracteres");
            }
        let campoDescripcion = document.querySelector("input#descripcion");
        if(campoDescripcion.value.length<20){
            evento.preventDefault();
            errores.push("El campo descripción debe tener al menos 20 caracteres");
            alert("El campo descripción debe tener al menos 20 caracteres");
            }
        let campoCategoria = document.querySelector("input#categoria");
        if(campoCategoria.value == ""){
            evento.preventDefault();
            errores.push("El campo categoria está vacío");
            alert("El campo categoria no debe estar vacío");
            }
        let campoSubcategoria = document.querySelector("input#subcategoria");
        if(campoSubcategoria.value == ""){
            evento.preventDefault();
            errores.push("El campo subcategoria está vacío");
            alert("El campo subcategoria no debe estar vacío");
            }
        let campoMarca = document.querySelector("input#marca");
        if(campoMarca.value == ""){
            evento.preventDefault();
            errores.push("El campo marca está vacío");
            alert("El campo marca no debe estar vacío");
            }
        let campoPrecio = document.querySelector("input#precio");
        if(campoPrecio.value < 0){
            evento.preventDefault();
            errores.push("El campo precio debe ser un número positivo");
            alert("El campo precio debe ser un número positivo");
            }
        let campoImages = document.querySelector("input#images");
            if(campoImages.value == ""){
                evento.preventDefault();
                errores.push("El campo imágenes está vacío");
                alert("Debe subir 3 imágenes con extensión .jpg, .jpeg, .png o .gif");
            }
        let campoStock = document.querySelector("input#stock");
            if(campoStock.value < 0){
                evento.preventDefault();
                errores.push("El campo Stock debe ser un número positivo");
                alert("El campo Stock debe ser un número positivo");
            }

        if(errores.length > 0){
            let ulErrores = document.querySelector(".ul-div-errores");
                for (let i = 0; i < errores.length; i++) {
                ulErrores.innerHTML += "<li>" +errores[i]+"</li>";
            }
        }
    });
});
