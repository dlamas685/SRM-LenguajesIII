
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
        title: '¡GENIAL!',
        text: "Usted se ha registrado correctamente en FIMA.",
        type: 'success',
        showCancelButton: true,
        showConfirmButton: false,
        cancelButtonText: 'Cerrar',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (!result.value) {
            window.location.href = "Iniciar_Sesion.aspx";
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
        title: '¡Oops!',
        text: "Hemos detectado que ya hay un usuario registrado con sus datos. Recuerde que la dirección de correo electrónico y el DNI deben ser unicos.",
        type: 'error',
        timer: 8000,
        showConfirmButton: true,
        confirmButtonText: 'Cerrar',
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
        title: '¡Oops!',
        text: "Las contraseñas no coinciden, por favor vuelva a escribir las contraseñas.",
        type: 'error',
        confirmButtonText: 'Cerrar',
        timer: 7000,
        showConfirmButton: true,
        footer: "© " + año + " Copyright FIMA"
    });
    $("#txtFechaNacimientoRegistrarPaciente").val(fechaNacimiento);
    $("#txtContraseñaRegistrarPaciente").val("");
    $("#txtContraseñaConfirmarRegistrarPaciente").val("");
}


