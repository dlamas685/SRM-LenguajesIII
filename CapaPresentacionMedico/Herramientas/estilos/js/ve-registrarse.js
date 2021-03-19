

//MASCARAS PARA LOS CAMPOS REGISTRAR UN NUEVO USUARIO


$(document).ready(function () {
    $("#txtTelefonoRegistrarPaciente").mask("+54 (000) 0000-0000");
    $("#txtFechaNacimientoRegistrarPaciente").mask("00/00/0000");
    $("#txtDniRegistrarPaciente").mask("00000000");
    $('.datepicker-here').datepicker({
        autoClose: true,
        language: 'es',
        position: 'right top'
    });
});



// Disable form submissions if there are invalid fields
(function () {
    'use strict';
    window.addEventListener('load', function () {
        // Get the forms we want to add validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
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


