window.addEventListener("load", function(){
    let formulario = document.querySelector(".login-form")
    formulario.addEventListener("submit", function(e){
        let errores = [];

        let emailInput = document.getElementById("email");
        regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if(emailInput.value = ""){
            errores.push("Ingrese su email")
        } else if(regexEmail.test(emailInput.value)===false){
            errores.push("El email es inválido")
        }

        let passInput = document.getElementById("password");
        if(passInput.value == ""){
            errores.push("Ingrese su contraseña")
        } 

        if(errores.length > 0){
            e.preventDefault();
            let erroresList = document.querySelector(".ul-div-errores");
            for (let i = 0; i < errores.length; i++){
                erroresList.innerHTML += "<li>" + errores[i] + "</li>"
            }
            console.log(errores)
        }
    })
})