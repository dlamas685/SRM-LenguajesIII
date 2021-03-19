

var fecha = new Date();
var año = fecha.getFullYear();


function MensajeEmpleadoIncorrecto() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-danger m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: 'Operación Fallida',
        text: "No se encontro ningun usuario con ese nombre de usuario o contraseña especificada.",
        type: 'error',
        timer: 4000,
        showConfirmButton: false,
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