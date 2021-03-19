

var usuarios;

validarPermisos();

function validarPermisos() {
    var user = document.getElementById("lblIdEmpleado").innerHTML;
    if (user == 1) {
        //NADA
    } else {
        MensajeAccesoDenegado();
    }
}

function MensajeAccesoDenegado() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light w3-hover-white w3-hover-text-gray border-secondary m-1 w-25',
            cancelButton: 'btn btn-light w3-hover-white w3-hover-text-gray border-secondary m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'ACCESO DENEGADO',
        text: "Usted no tiene permiso para acceder al REGISTRO DE USUARIOS.",
        type: 'question',
        showCancelButton: false,
        showConfirmButton: true,
        cancelButtonText: 'Cerrar',
        confirmButtonText: 'Aceptar',
        footer: "© " + año + " Copyright FIMA"
    }).then((result) => {
        if (result.value) {
            window.location.href = "Inicio_Pagina_Interna.aspx";
        } else {
            window.location.href = "Inicio_Pagina_Interna.aspx";
        }
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


function previewFileRegistrar() {
    var preview = document.querySelector('#cphMaster_imagenRegistrarUsuario');
    var file = document.querySelector('#cphMaster_fuploadFotoUsuario').files[0];
    var reader = new FileReader();
    reader.onloadend = function () {
        preview.src = reader.result;
    };
    if (file) {
        reader.readAsDataURL(file);
    } else {
        preview.src = "";
    }
    document.getElementById("btnSinFotoRegistrarUsuario").style.display = "block";
}


function trashFotoRegistrar() {
    var preview = document.querySelector('#cphMaster_imagenRegistrarUsuario');
    preview.src = "/Fotos/user.jpg";
    $('#cphMaster_txtImagenRegistrarUsuario').val("");
    document.getElementById("btnSinFotoRegistrarUsuario").style.display = "none";
}

function IrRegistrarUsuario() {
    $("#nav-registrarUsuario-tab").tab('show');

}

function IrListaUsuario() {
    $("#nav-modificarUsuarios-tab").tab('show');
    document.getElementById("fmRegistroUsuarios").className = "needs-validation";
}

$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    usuarios.columns.adjust().draw();
});



obtenerListaUsuarios();

function obtenerListaUsuarios() {
    $.ajax({
        type: "POST",
        url: "Registro_Usuarios.aspx/ListarEmpleados",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirFilasTablaUsuarios(data.d);
        }
    });
}

function añadirFilasTablaUsuarios(data) {
    usuarios = $("#ListaEmpleados").DataTable({
        "paging": true,
        "responsive": true,
        "retrieve": true,
        "columns": [
            {
                "visible": false,
                "searchable": false
            },
            { 'responsivePriority': 1 },
            {
                "orderable": false,
                'responsivePriority': 2
            },
            { 'responsivePriority': 3 },
            { 'responsivePriority': 5 },
            { 'responsivePriority': 6 },
            {
                "orderable": false,
                'responsivePriority': 4
            }
        ],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ usuarios",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún usuario registrado en el sistema",
            "sInfo": "Mostrando un total de _TOTAL_ usuarios",
            "sInfoEmpty": "",
            "sInfoFiltered": "(filtrado de un total de _MAX_ usuarios)",
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
    usuarios.clear().draw();
    for (var i = 0; i < data.length; i++) {
        usuarios.row.add([
            data[i].id_empleado,
            i+1,
            '<img src="' + data[i].foto_empleado_url + '" class="img-lg" alt="profile" id="' + data[i].id_empleado + '" />',
            data[i].usuario_empleado,
            data[i].apellido_empleado + " " + data[i].nombre_empleado,
            data[i].fecha_creacion_empleado,
            '<button  type="button" id="' + data[i].id_empleado + '" title="Eliminar" class="btn btn-danger btn-eliminar-usuario  w3-hover-text-red w3-hover-white"  data-toggle="tooltip" data-placement="bottom"><i class="fa fa-trash" aria-hidden="true"></i></button>'
        ]).draw();
    }
}

function eliminarDatosUsuario(data) {

    var obj = JSON.stringify({ id: data });

    $.ajax({
        type: "POST",
        url: "Registro_Usuarios.aspx/EliminarEmpleado",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                obtenerListaUsuarios();
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

$(document).on('click', '.btn-eliminar-usuario', function (e) {
    e.preventDefault();
    var id = e.currentTarget.id;
    var cant = usuarios.rows().count();
    var band = 0;
    var i = 0;
    var row;
    while (i < cant && band === 0) {
        row = usuarios.row(i).data();
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
        text: "No podra recuperar los datos de " + row[3],
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'No',
        cancelButtonText: 'Si',
        reverseButtons: true
    }).then((result) => {
        if (!result.value) {
            eliminarDatosUsuario(id);
        } else {
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-light border-info m-1 w-25'
                },
                buttonsStyling: false
            });

            swalWithBootstrapButtons.fire({
                title: 'Operación Cancelada',
                text: "Los datos de " + row[3] + " no se eliminaron.",
                type: 'info',
                confirmButtonText: 'Cerrar',
                reverseButtons: true
            });
        }
    });
});



