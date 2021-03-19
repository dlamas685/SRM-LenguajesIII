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
        title: '¡Oops!',
        text: "Dirección de correo electrónico o contraseña incorrecta.",
        type: 'error',
        timer: 6000,
        showConfirmButton: true,
        confirmButtonText: 'Cerrar',
        footer: "© " + año + " Copyright FIMA"
    });
}



(function () {
    'use strict';
    window.addEventListener('load', function () {
        var forms = document.getElementsByClassName('needs-validation');
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();