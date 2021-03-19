var fecha = new Date();
var año = fecha.getFullYear();

//MENSAJE DE PACIENTE INCORRECTO.

function MensajePacienteIncorrecto() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-danger m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: 'Operación Fallida',
        text: "No existe un usuario con esos datos, por favor verifique la contraseña.",
        type: 'error',
        timer: 4000,
        showConfirmButton: false,
        footer: "© " + año + " Copyright FIMA"
    });
}