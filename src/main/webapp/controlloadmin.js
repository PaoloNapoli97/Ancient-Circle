function attivaReg(id) {
    document.getElementById("form-modifica-" + id).style.display = "block";
}

function chiudiForm(id) {
    document.getElementById("form-modifica-" + id).style.display = "none";
}

// function prosegui() {
//     var username = document.getElementById("user").value;
//     var confusername = document.getElementById("confusername").value;

//     // Verifica se username e conferma username coincidono
//     if (username != confusername) {
//         alert("USERNAME e CONFERMA USERNAME non coincidono");
//         return false; // Impedisce la prosecuzione se non coincidono
//     }

//     var password = document.getElementById("password").value;
//     var confpassword = document.getElementById("confpassword").value;

//     // Verifica se password e conferma password coincidono
//     if (password != confpassword) {
//         alert("PASSWORD e CONFERMA PASSWORD non coincidono");
//         return false; // Impedisce la prosecuzione se non coincidono
//     }

//     return true; // Se tutto coincide, prosegue
// }
// function nolog() {
//     var username = document.getElementById("user").value;
//     var password = document.getElementById("password");
//     if (username == null || password == null) {
//         alert("INSERIRE DEI CAMPI VALIDI")
//         return false;
//     }
//     else
//         return true;
// }