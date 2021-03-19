
var fecha = new Date();
var año = fecha.getFullYear();

function MensajeReservaCorrecta() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25',
            cancelButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: '¡GENIAL!',
        text: "Su reserva se realizo sactifactoriamente. Su respuesta estara en menos de 24 hs.",
        type: 'success',
        showCancelButton: false,
        showConfirmButton: true,
        cancelButtonText: 'Cerrar',
        confirmButtonText: 'Aceptar',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (result.value) {
            $('#cphPacientes_txtConsultaSolicitarReserva').val(""); 
        }
    });
}

function MensajeReservaIncorrecta() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-danger m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: '¡Oops!',
        text: "Nos hemos encontrado con un problema. Recuerde que solo se puede realizar una reserva para el médico en el mismo día. Por favor intentelo nuevamente.",
        type: 'error',
        timer: 10000,
        showConfirmButton: true,
        confirmButtonText: 'Cerrar',
        footer: "© " + año + " Copyright FIMA"
    });
}





function MensajeModificarUsuarioInorrecto() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-danger m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: '¡Oops!',
        text: "No hemos encontrado con un problema, no se pudo actualizar su información por favor cierre sesión y vuelva a intentarlo.",
        type: 'error',
        timer: 8000,
        showConfirmButton: true,
        confirmButtonText: 'Cerrar',
        footer: "© " + año + " Copyright FIMA"
    });
}


function MensajeModificarUsuarioCorrecto() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25',
            cancelButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: '¡GENIAL!',
        text: "Su información ha sido actualizada. La foto de perfil de la barra de navegación se actualizara en su próximo inicio de sesión.",
        type: 'success',
        showCancelButton: false,
        showConfirmButton: true,
        cancelButtonText: 'Cerrar',
        confirmButtonText: 'Aceptar',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (result.value) {
            window.location.href = "Inicio_Pagina_Externa.aspx";
        }
    });
}