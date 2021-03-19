
var fecha = new Date();
var año = fecha.getFullYear();

function MensajeMedicoCorrecto() {
    document.getElementById("fmABMMedicos").reset();
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25',
            cancelButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'Operación Confirmada',
        text: "El medico se ha registrado correctamente.",
        type: 'success',
        showCancelButton: true,
        showConfirmButton: false,
        cancelButtonText: 'Cerrar',
        confirmButtonText: 'Aceptar',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (!result.value) {
            var preview = document.querySelector('#cphMaster_imagenRegistrarMedico');
            preview.src = "/Fotos/masculino.jpg";
            $("#cphMaster_txtNombreRegistrarMedico").val("");
            $("#cphMaster_txtApellidoRegistrarMedico").val("");
            $("#cphMaster_txtCuilRegistrarMedico").val("");
            $("#cphMaster_txtDescripcionRegistrarMedico").val("");
            $("#cphMaster_txtTelefonoRegistrarMedico").val("");
            $("#cphMaster_selectSexoRegistrarMedico").val("");
            $("#cphMaster_txtFechaNacimientoRegistrarMedico").val("");
            $("#cphMaster_selectEspecialidadesRegistrarMedico").val("");
        }
    });
}

function MensajeMedicoIncorrecto() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-danger m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: 'Operación Rechazada',
        text: "El medico ya se encuentra registrado en el sistema.",
        type: 'error',
        showConfirmButton: true,
        footer: "© " + año + " Copyright FIMA"
    });
}



function MensajeCorrectoModificarMedico() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25',
            cancelButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'Operación Confirmada',
        text: "Los datos del médico se modificaron correctamente.",
        type: 'success',
        showCancelButton: true,
        showConfirmButton: false,
        cancelButtonText: 'Cerrar',
        confirmButtonText: 'Aceptar',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (!result.value) {
            var preview = document.querySelector('#cphMaster_imagenRegistrarMedico');
            preview.src = "/Fotos/masculino.jpg";
            $("#cphMaster_txtNombreRegistrarMedico").val("");
            $("#cphMaster_txtApellidoRegistrarMedico").val(""); 
            $("#cphMaster_txtCuilRegistrarMedico").val(""); 
            $("#cphMaster_txtTelefonoRegistrarMedico").val("");
            $("#cphMaster_selectSexoRegistrarMedico").val("");
            $("#cphMaster_txtFechaNacimientoRegistrarMedico").val("");
            $("#cphMaster_selectEspecialidadesRegistrarMedico").val("");
        }
    });
}

function MensajeIncorrectoModificarMedico() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-danger m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: 'Operación Rechazada',
        text: "Los datos del médico no se pudieron modificar. Error al modificar.",
        type: 'error',
        showConfirmButton: true,
        footer: "© " + año + " Copyright FIMA"
    });
}


function MensajeReservaConfirmada() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25',
            cancelButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'Operación Confirmada',
        text: "La reserva se confirmo correctamente, se envio un correo a la dirección email del paciente.",
        type: 'success',
        showCancelButton: true,
        showConfirmButton: false,
        cancelButtonText: 'Cerrar',
        confirmButtonText: 'Aceptar',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (!result.value) {
            $("#cphMaster_txtDescripcionConfirmarReserva").val("");
        }
    });
}

function MensajeReservaConfirmadaIncorrecta() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-danger m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: 'Operación Rechazada',
        text: "La reserva no se pudo confirmar por algun motivo por favor actualice la pagina y realice las acciones nuevamente.",
        type: 'error',
        showConfirmButton: true,
        footer: "© " + año + " Copyright FIMA"
    });
}


function MensajeReservaConfirmadaCorrectaCorreoFallido() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25',
            cancelButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'Operación Confirmada',
        text: "La reserva se confirmo correctamente, pero no se pudo enviar el correo electronico.",
        type: 'success',
        showCancelButton: true,
        showConfirmButton: false,
        cancelButtonText: 'Cerrar',
        confirmButtonText: 'Aceptar',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (!result.value) {
            $("#cphMaster_txtDescripcionConfirmarReserva").val("");
        }
    });
}



function MensajeReservaRechazadaCorrecta() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25',
            cancelButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'Operación Confirmada',
        text: "La reserva se rechazo correctamente, se envio un correo a la dirección email del paciente con el motivo.",
        type: 'success',
        showCancelButton: true,
        showConfirmButton: false,
        cancelButtonText: 'Cerrar',
        confirmButtonText: 'Aceptar',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (!result.value) {
            $("#cphMaster_txtMotivoRechazoReserva").val("");
        }
    });
}

function MensajeReservaRechazadaIncorrecta() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-danger m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: 'Operación Rechazada',
        text: "La reserva no se pudo rechazar por algun motivo por favor actualice la pagina y realice las acciones nuevamente.",
        type: 'error',
        showConfirmButton: true,
        footer: "© " + año + " Copyright FIMA"
    });
}


function MensajeReservaRechazadaCorrectaSinCorreo() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25',
            cancelButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'Operación Confirmada',
        text: "La reserva se rechazo correctamente, pero no se pudo enviar el correo electronico.",
        type: 'success',
        showCancelButton: true,
        showConfirmButton: false,
        cancelButtonText: 'Cerrar',
        confirmButtonText: 'Aceptar',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (!result.value) {
            $("#cphMaster_txtMotivoRechazoReserva").val("");
        }
    });
}


function MensajeEmpleadoCorrecto() {
    document.getElementById("fmRegistroUsuarios").reset();
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25',
            cancelButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'Operación Confirmada',
        text: "El usuario se ha registrado correctamente.",
        type: 'success',
        showCancelButton: true,
        showConfirmButton: false,
        cancelButtonText: 'Cerrar',
        confirmButtonText: 'Aceptar',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (!result.value) {
            var preview = document.querySelector('#cphMaster_imagenRegistrarUsuario');
            preview.src = "/Fotos/user.jpg";
            $("#cphMaster_txtNombreRegistrarUsuario").val("");
            $("#cphMaster_txtApellidoRegistrarUsuario").val("");
            $("#cphMaster_txtUsuarioRegistrarUsuario").val("");
            $("#cphMaster_txtContraseñaRegistrarUsuario").val("");
            $("#cphMaster_txtImagenRegistrarUsuario").val("");
        }
    });
}

function MensajeEmpleadoInorrecto() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-danger m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: 'Operación Rechazada',
        text: "El nombre de usuario que intenta utilizar para el empleado ya esta registrado en el sistema.",
        type: 'error',
        showConfirmButton: true,
        footer: "© " + año + " Copyright FIMA"
    });
}


function MensajeReservaCanceladaCorrecta() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25',
            cancelButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'Operación Confirmada',
        text: "La reserva se cancelo correctamente, se envio un correo a la dirección email del paciente con el motivo.",
        type: 'success',
        showCancelButton: true,
        showConfirmButton: false,
        cancelButtonText: 'Cerrar',
        confirmButtonText: 'Aceptar',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (!result.value) {
            $("#cphMaster_txtMotivoCancelarReserva").val("");
        }
    });
}

function MensajeReservaCanceladaIncorrecta() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-danger m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: 'Operación Rechazada',
        text: "La reserva no se pudo cancelar por algun motivo por favor actualice la pagina y realice las acciones nuevamente.",
        type: 'error',
        showConfirmButton: true,
        footer: "© " + año + " Copyright FIMA"
    });
}


function MensajeReservaCanceladaCorrectaSinCorreo() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25',
            cancelButton: 'btn btn-light w3-hover-white w3-hover-text-green border-success m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'Operación Confirmada',
        text: "La reserva se cancelo correctamente, pero no se pudo enviar el correo electronico.",
        type: 'success',
        showCancelButton: true,
        showConfirmButton: false,
        cancelButtonText: 'Cerrar',
        confirmButtonText: 'Aceptar',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (!result.value) {
            $("#cphMaster_txtMotivoCancelarReserva").val("");
        }
    });
}




