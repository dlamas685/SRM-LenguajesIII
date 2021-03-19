
var fecha = new Date();
var año = fecha.getFullYear();

//MENSAJES SWEET ALERT

//MENSAJE REGISTRO DE PACIENTE CORRECTO.

function MensajePacienteCorrecto() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25',
            cancelButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'Operación Confirmada',
        text: "Se ha registrado correctamente.",
        type: 'success',
        showCancelButton: true,
        showConfirmButton: false,
        cancelButtonText: 'Cerrar',
        confirmButtonText: 'Ir a FIMA',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (!result.value) {
            window.location.href = "Registrarse.aspx";
        }
    });
}

//MENSAJE REGISTRO DE PACIENTE INCORRECTO.

function MensajePacienteIncorrecto() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-danger m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: 'Operación Fallida',
        text: "Ya existe un usuario registrado con ese correo electronico o ese DNI.",
        type: 'error',
        timer: 4000,
        showConfirmButton: false,
        footer: "© " + año + " Copyright FIMA"
    });
}


function MensajeContraseñaIncorrecta() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-danger m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'Operación Fallida',
        text: "Las contraseñas no coinciden, por favor vuelva a escribir las contraseñas.",
        type: 'error',
        confirmButtonText: 'Cerrar',
        timer: 4000,
        showConfirmButton: false,
        footer: "© " + año + " Copyright FIMA"
    });
    $("#txtContraseñaRegistrarPaciente").val("");
    $("#txtContraseñaConfirmarRegistrarPaciente").val("");
}