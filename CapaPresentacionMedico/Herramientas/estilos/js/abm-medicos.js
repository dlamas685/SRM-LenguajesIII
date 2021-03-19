var fecha = new Date();
var año = fecha.getFullYear();

$(document).ready(function (e) {

    $("#cphMaster_txtTelefonoRegistrarMedico").mask("+54 (000) 0000-0000");
    $("#cphMaster_txtTelefonoMedicoModificar").mask("+54 (000) 0000-0000");
    $("#cphMaster_txtFechaNacimientoRegistrarMedico").mask("00/00/0000");
    $("#cphMaster_txtFechaNacimientoMedicoModificar").mask("00/00/0000");
    $("#cphMaster_txtCuilRegistrarMedico").mask("00-00000000-0");
    $("#cphMaster_txtCuilMedicoModificar").mask("00-00000000-0");
    $('.datepicker-here').datepicker({
        language: 'es',
        position: 'left top',
        autoClose: true
    });
    $('#cphMaster_txtFechaNacimientoMedicoModificar').datepicker({
        language: 'es',
        position: 'right top',
        autoClose: true
    });


});


//FUNCION PARA ABRIR EL MODAL  MODIFICAR MEDICO

function abrirModalModificarMedico() {
    $('#modalModificarMedico').modal('show');
}

//FUNCION PARA CERRAR EL MODAL MODIFICAR MEDICO

function cerrarModalModificarMedico() {   
    $('#modalModificarMedico').modal('hide');

}


$('#modalModificarMedico').on('hidden.bs.modal', function (e) {
    document.getElementById("fmABMMedicos").className = "needs-validation";
    $('#cphMaster_txtImagenModificar').val('');
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


//OBTIENE LOS ESPECIALIDADES DE LA BASE DE DATOS PARA EL SELECT ESPECIALIDADES

obtenerEspecialidades();
function obtenerEspecialidades() {
    $.ajax({
        type: "POST",
        url: "ABM_Medicos.aspx/ListarEspecialidades",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirEspecialidades(data.d);
        }
    });
}

//AÑADE LOS ESPECIALIDADES OBTENIDOS AL SELECT ESPECIALIDADES

function añadirEspecialidades(data) {
    for (var i = 0; i < data.length; i++) {
        $('#cphMaster_selectEspecialidadesRegistrarMedico').append('<option value="' + data[i].id_especialidad + '">' + data[i].nombre_especialidad + '</option>');
        $('#cphMaster_selectEspecialidadMedicoModificar').append('<option value="' + data[i].id_especialidad + '">' + data[i].nombre_especialidad + '</option>');
    }
}


//CARGA EL ID DE LA ESPECIALIDADSELECCIONADO EN EL HIDDEN FIELD

$(document).on('change', '#cphMaster_selectEspecialidadesRegistrarMedico', function (event) {
    $('#cphMaster_hfIdEspecialidad').val($("#cphMaster_selectEspecialidadesRegistrarMedico option:selected").val());
});

$(document).on('change', '#cphMaster_selectEspecialidadMedicoModificar', function (event) {
    $('#cphMaster_hfIdEspecialidadModificar').val($("#cphMaster_selectEspecialidadMedicoModificar option:selected").val());

});


$(document).on('change', '#cphMaster_selectSexoMedicoModificar', function (event) {
    var file = $('#cphMaster_txtImagenModificar').val();
    if (file == "Sin foto") {
        trashSelect();
    }
});

$(document).on('change', '#cphMaster_selectSexoRegistrarMedico', function (event) {
    var file = $("#txtImagenRegistrarMedico").val();
    if (file == "") {
        defaultFile();
    }
});




function activarValidarRegistrarMedico() {
    document.getElementById("cphMaster_txtNombreRegistrarMedico").required = true;
    document.getElementById("cphMaster_txtApellidoRegistrarMedico").required = true;
    document.getElementById("cphMaster_txtCuilRegistrarMedico").required = true;
    document.getElementById("cphMaster_txtTelefonoRegistrarMedico").required = true;
    document.getElementById("cphMaster_selectSexoRegistrarMedico").required = true;
    document.getElementById("cphMaster_txtFechaNacimientoRegistrarMedico").required = true;
    document.getElementById("cphMaster_selectEspecialidadesRegistrarMedico").required = true;

    document.getElementById("cphMaster_txtNombreMedicoModificar").required = false;
    document.getElementById("cphMaster_txtApellidoMedicoModificar").required = false;
    document.getElementById("cphMaster_txtCuilMedicoModificar").required = false;
    document.getElementById("cphMaster_txtTelefonoMedicoModificar").required = false;
    document.getElementById("cphMaster_selectSexoMedicoModificar").required = false;
    document.getElementById("cphMaster_txtFechaNacimientoMedicoModificar").required = false;
    document.getElementById("cphMaster_selectEspecialidadMedicoModificar").required = false;
}

function activarValidarModificarMedico() {
    document.getElementById("cphMaster_txtNombreMedicoModificar").required = true;
    document.getElementById("cphMaster_txtApellidoMedicoModificar").required = true;
    document.getElementById("cphMaster_txtCuilMedicoModificar").required = true;
    document.getElementById("cphMaster_txtTelefonoMedicoModificar").required = true;
    document.getElementById("cphMaster_selectSexoMedicoModificar").required = true;
    document.getElementById("cphMaster_txtFechaNacimientoMedicoModificar").required = true;
    document.getElementById("cphMaster_selectEspecialidadMedicoModificar").required = true;
    document.getElementById("cphMaster_txtNombreRegistrarMedico").required = false;
    document.getElementById("cphMaster_txtApellidoRegistrarMedico").required = false;
    document.getElementById("cphMaster_txtCuilRegistrarMedico").required = false;
    document.getElementById("cphMaster_txtTelefonoRegistrarMedico").required = false;
    document.getElementById("cphMaster_selectSexoRegistrarMedico").required = false;
    document.getElementById("cphMaster_txtFechaNacimientoRegistrarMedico").required = false;
    document.getElementById("cphMaster_selectEspecialidadesRegistrarMedico").required = false;
}


function IrRegistrarMedico() {
    document.getElementById("fmABMMedicos").className = "needs-validation";
    activarValidarRegistrarMedico();
}

function IrListaMedico() {
    document.getElementById("fmABMMedicos").className = "needs-validation";
    activarValidarModificarMedico();
}

var medicos;

//COMIENZO DE DATATABLE MEDICOS.

obtenerListaMedicos();

//OBTIENE LA LISTA DE MEDICOS DE LA BASE DE DATOS MEDIANTE AJAX.

function obtenerListaMedicos() {
    $.ajax({
        type: "POST",
        url: "ABM_Medicos.aspx/ListarMedicos",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirFilasTablaMedicos(data.d);
        }
    });
}


$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    medicos.columns.adjust().draw();
});

//AÑADE FILAS A LA TABLA MEDICOS.

function añadirFilasTablaMedicos(data) {

    medicos = $("#ListaMedicos").DataTable({
        "paging": true,
        "responsive": true,
        "retrieve": true,
        "columns": [
            {'responsivePriority': 1 },
            {
                "orderable": false,
                'responsivePriority': 2
            },
            { 'responsivePriority': 3 },
            {
                "visible": false,
                "searchable": false
            },
            { 'responsivePriority': 6 },
            { 'responsivePriority': 7 },
            { 'responsivePriority': 8 },
            {
                "visible": false,
                "searchable": false
            },
            { 'responsivePriority': 9 },
            {
                "visible": false,
                "searchable": false
            },
            { 'responsivePriority': 10 },
            {
                "visible": false,
                "searchable": false
            },
            {
                "orderable": false,
                'responsivePriority': 4
            },
            {
                "orderable": false,
                'responsivePriority': 5
            }
        ],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ médicos",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún médico registrado en el sistema",
            "sInfo": "Mostrando un total de _TOTAL_ médicos",
            "sInfoEmpty": "",
            "sInfoFiltered": "(filtrado de un total de _MAX_ médicos)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });
    medicos.clear().draw();
    for (var i = 0; i < data.length; i++) {
        medicos.row.add([
            data[i].id_medico,
            '<img src="' + data[i].foto_medico_url + '" class="img-lg" alt="profile" id="' + data[i].id_medico + '" />',
            data[i].apellido_medico + " " + data[i].nombre_medico,
            data[i].fecha_nacimiento_medico,
            data[i].cuil_medico,
            data[i].edad_medico,
            data[i].sexo_medico,
            data[i].especialidad.id_especialidad,
            data[i].especialidad.nombre_especialidad,
            data[i].telefono_medico,
            data[i].descripcion_medico,
            data[i].estado_foto_medico,
            '<button  type="button" title="Modificar" id="' + data[i].id_medico + '" class="btn btn-primary btn-modificar-medico  w3-hover-text-blue w3-hover-white"  data-toggle="tooltip" data-placement="bottom"><i class="fa fa-edit" aria-hidden="true"></i></button>',
            '<button  type="button" id="' + data[i].id_medico + '" title="Eliminar" class="btn btn-danger btn-eliminar-medico  w3-hover-text-red w3-hover-white"  data-toggle="tooltip" data-placement="bottom"><i class="fa fa-trash" aria-hidden="true"></i></button>'
        ]).draw();
    }


}

$(function () {
    $('[data-toggle="tooltip"]').tooltip();
});

function limpiarCampos() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-warning m-1 w-25',
            cancelButton: 'btn btn-light border-warning m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'Limpiar Campos',
        text: "¿Esta seguro que desea vaciar los campos?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'No',
        footer: "© " + año + " Copyright FIMA",
        cancelButtonText: 'Si',
        reverseButtons: true
    }).then((result) => {
        if (!result.value) {
            var preview = document.querySelector('#cphMaster_imagenRegistrarMedico');
            preview.src = "/Fotos/masculino.jpg";
            $("#cphMaster_txtNombreRegistrarMedico").val("");
            $("#cphMaster_txtImagenRegistrarMedico").val("");
            $("#cphMaster_txtDescripcionRegistrarMedico").val("");
            $("#cphMaster_txtApellidoRegistrarMedico").val("");
            $("#cphMaster_txtCuilRegistrarMedico").val("");
            $("#cphMaster_txtTelefonoRegistrarMedico").val("");
            $("#cphMaster_selectSexoRegistrarMedico").val("");
            $("#cphMaster_txtFechaNacimientoRegistrarMedico").val("");
            $("#cphMaster_selectEspecialidadesRegistrarMedico").val("");
            document.getElementById("fmABMMedicos").className = "needs-validation";
        }
    });
}



$(document).on('click', '.btn-modificar-medico', function (e) {
    e.preventDefault();
    var id = e.currentTarget.id;
    var cant = medicos.rows().count();
    var band = 0;
    var i = 0;
    var row;
    while (i < cant && band === 0) {
        row = medicos.row(i).data();
        if (row[0] == id) {
            band = 1;
        } else {
            i = i + 1;
        }
    }
    if (band == 1) {
        $("#cphMaster_hfIdMedico").val(row[0]);
        var cadena = row[2].split(' ');
        var url = $("#" + row[0]).attr('src');
        $("#cphMaster_imagenMedico").attr('src',url);
        var nombre = cadena[1];
        var apellido = cadena[0];
        $("#cphMaster_txtNombreMedicoModificar").val(nombre);
        $("#cphMaster_txtApellidoMedicoModificar").val(apellido);
        $("#cphMaster_txtCuilMedicoModificar").val(row[4]);
        $("#cphMaster_txtFechaNacimientoMedicoModificar").val(row[3]);
        $("#cphMaster_txtTelefonoMedicoModificar").val(row[9]);
        if (row[10] !== "-") {
            $("#cphMaster_txtDescripcionMedicoModificar").val(row[10]);
        } else {
            $("#cphMaster_txtDescripcionMedicoModificar").val("");
        }
        if (row[6] == "Masculino") {
            $("#cphMaster_selectSexoMedicoModificar").val(2);
        } else {
            $("#cphMaster_selectSexoMedicoModificar").val(1);
        }
        if (row[11] == "Sin foto") {
            $("#cphMaster_txtImagenModificar").val(row[11]);
        }
        $("#cphMaster_selectEspecialidadMedicoModificar").val(row[7]);
        $("#cphMaster_hfIdEspecialidadModificar").val(row[7]);
    }
    abrirModalModificarMedico();
});


function eliminarDatosMedico(data) {

    var obj = JSON.stringify({ id: data });

    $.ajax({
        type: "POST",
        url: "ABM_Medicos.aspx/EliminarMedico",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                obtenerListaMedicos();
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-light border-success m-1 w-25'
                    },
                    buttonsStyling: false
                });

                swalWithBootstrapButtons.fire({
                    title: 'Operación Confirmada',
                    text: "El médico se elimino correctamente.",
                    type: 'success',
                    confirmButtonText: 'Cerrar',
                    reverseButtons: true
                });
            }
            else {
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-light border-danger m-1 w-25'
                    },
                    buttonsStyling: false
                });

                swalWithBootstrapButtons.fire({
                    title: 'Operación Fallida',
                    text: "No es posible eliminar los datos del médico",
                    type: 'error',
                    confirmButtonText: 'Cerrar',
                    reverseButtons: true
                });
            }
        }
    });
}

$(document).on('click', '.btn-eliminar-medico', function (e) {
    e.preventDefault();
    var id = e.currentTarget.id;
    var cant = medicos.rows().count();
    var band = 0;
    var i = 0;
    var row;
    while (i < cant && band === 0) {
        row = medicos.row(i).data();
        if (row[0] == id) {
            band = 1;
        } else {
            i = i + 1;
        }
    }
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-warning m-1 w-25',
            cancelButton: 'btn btn-light border-warning m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: '¿Esta seguro?',
        text: "No podra recuperar los datos de " + row[2],
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'No',
        cancelButtonText: 'Si',
        reverseButtons: true
    }).then((result) => {
        if (!result.value) {
            eliminarDatosMedico(id);
        } else {
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-light border-info m-1 w-25'
                },
                buttonsStyling: false
            });

            swalWithBootstrapButtons.fire({
                title: 'Operación Cancelada',
                text: "Los datos de " + row[2] +" no se eliminaron.",
                type: 'info',
                confirmButtonText: 'Cerrar',
                reverseButtons: true
            });
        }
    });
});

function previewFile() {
    var preview = document.querySelector('#cphMaster_imagenMedico');
    var file = document.querySelector('#cphMaster_fuploadMedicoModificar').files[0];
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

function trashFile() {

    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-warning m-1 w-25',
            cancelButton: 'btn btn-light border-warning m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'ATENCION',
        text: "Para recuperar la foto tendra que cerrar la ventana con ESC o dando a Salir.",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'No',
        footer: "© " + año + " Copyright FIMA",
        cancelButtonText: 'Si',
        reverseButtons: true
    }).then((result) => {
        if (!result.value) {
            var preview = document.querySelector('#cphMaster_imagenMedico');
            var sexo = $("#cphMaster_selectSexoMedicoModificar").val();
            if (sexo == 2) {
                preview.src = "/Fotos/masculino.jpg";
            } else {
                preview.src = "/Fotos/femenino.jpg";
            }
            $('#cphMaster_txtImagenModificar').val('Sin foto');
        }
    });

}

function trashSelect() {
    var preview = document.querySelector('#cphMaster_imagenMedico');
    var sexo = $("#cphMaster_selectSexoMedicoModificar").val();
    if (sexo == 2) {
        preview.src = "/Fotos/masculino.jpg";
    } else {
        preview.src = "/Fotos/femenino.jpg";
    }
    $('#cphMaster_txtImagenModificar').val('Sin foto');
}


function previewFileRegistrar() {
    var preview = document.querySelector('#cphMaster_imagenRegistrarMedico');
    var file = document.querySelector('#cphMaster_fuploadFotoMedico').files[0];
    var reader = new FileReader();
    document.getElementById('btnSinFotoRegistrarMedico').style.display = 'block';
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
    var preview = document.querySelector('#cphMaster_imagenRegistrarMedico');
    var sexo = $("#cphMaster_selectSexoRegistrarMedico").val();
    if (sexo == 2) {
        preview.src = "/Fotos/masculino.jpg";
    } else {
        preview.src = "/Fotos/femenino.jpg";
    }
}

function trashFotoRegistrar() {
    var preview = document.querySelector('#cphMaster_imagenRegistrarMedico');
    var sexo = $("#cphMaster_selectSexoRegistrarMedico").val();
    if (sexo == 2 || sexo == "") {
        preview.src = "/Fotos/masculino.jpg";
    } else {
        preview.src = "/Fotos/femenino.jpg";
    }
    $('#txtImagenRegistrarMedico').val("");
    document.getElementById('btnSinFotoRegistrarMedico').style.display = 'none';
}