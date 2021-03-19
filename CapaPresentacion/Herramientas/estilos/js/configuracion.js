function previewFileModificar() {
    var preview = document.querySelector('#cphPacientes_imagenModificarPaciente');
    var file = document.querySelector('#cphPacientes_fuploadFotoPaciente').files[0];
    var reader = new FileReader();
    reader.onloadend = function () {
        preview.src = reader.result;
    };
    if (file) {
        reader.readAsDataURL(file);
    } else {
        preview.src = "";
    }
}

function defaultFile() {
    var preview = document.querySelector('#cphPacientes_imagenModificarPaciente');
    var sexo = $("#cphPacientes_selectSexoModificarPaciente").val();
    if (sexo == 2) {
        preview.src = "/Fotos/masculino.jpg";
    } else {
        preview.src = "/Fotos/femenino.jpg";
    }
}

function trashFotoModificar() {
    var preview = document.querySelector('#cphPacientes_imagenModificarPaciente');
    var sexo = $("#cphPacientes_selectSexoModificarPaciente").val();
    if (sexo == 2 || sexo == "") {
        preview.src = "/Fotos/masculino.jpg";
    } else {
        preview.src = "/Fotos/femenino.jpg";
    }
    $('#cphPacientes_txtImagenModificarPaciente').val("Sin foto");
}

$(document).ready(function (e) {
    $("#cphPacientes_txtTelefonoModificarPaciente").mask("+54 (000) 0000-0000");
    $("#cphPacientes_txtFechaNacimientoModificarPaciente").mask("00/00/0000");
    $("#cphPacientes_txtDniModificarPaciente").mask("00000000");
    $('.datepicker-here').datepicker({
        language: 'es',
        position: 'left top',
        autoClose: true
    });
    $("#cphPacientes_txtFechaNacimientoModificarPaciente").val($("#cphPacientes_hfFechaNacimiento").val());
    $("#cphPacientes_txtDniModificarPaciente").attr('readonly', true);
    $("#cphPacientes_txtEmailModificarPaciente").attr('readonly', true);
});


$(document).on('change', '#cphPacientes_selectSexoModificarPaciente', function (event) {
    var foto = $('#cphPacientes_txtImagenModificarPaciente').val();
    if (foto == "Sin foto") {
        defaultFile();
    }  
});


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
