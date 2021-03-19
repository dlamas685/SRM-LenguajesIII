


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


//FUNCION PARA ABRIR EL MODAL DE CONFIRMAR RESERVA

function abrirModalConfirmarReserva() {
    $('#modalConfirmarReserva').modal('show');
}


// FUNCION PARA CERRAR EL MODAL DE CONFIRMAR RESERVA

function cerrarModalConfirmarReserva() {
    $('#modalConfirmarReserva').modal('hide');
}

//FUNCION PARA CONFIRMAR LA RESERVA

function confirmarSolicitud() {
    var descripcion = $("#cphMaster_txtDescripcionConfirmarReserva").val();
    if (descripcion == "") {
        document.getElementById("fmListarReservas").className = "was-validated";
    } else {
        cerrarModalConfirmarReserva();
    }
}



//EVENTO QUE SE DISPARA CUANDO SE CIERRA EL MODAL CONFIRMAR RESERVA

$('#modalConfirmarReserva').on('hidden.bs.modal', function (e) {
    document.getElementById("cphMaster_txtDescripcionConfirmarReserva").required = false;
    document.getElementById("fmListarReservas").className = "needs-validation";
    limpiarCamposConfirmarReserva(); 
});

//FUNCION QUE LIMPIA LOS CAMPOS DEL MODAL CONFIRMAR RESERVA

function limpiarCamposConfirmarReserva() {
   

    $("#cphMaster_txtDescripcionConfirmarReserva").val("");
    $("#cphMaster_txtPacienteConfirmarReserva").val("");
    $("#cphMaster_txtMedicoConfirmarReserva").val("");
    $("#cphMaster_txtFechaAtencionConfirmarReserva").val("");
    $("#cphMaster_txtHoraAtencionConfirmarReserva").val("");
}


//FUNCION PARA ABRIR EL MODAL DE CONFIRMAR RESERVA

function abrirModalRechazarReserva() {
    $('#modalRechazarReserva').modal('show');
}

// FUNCION PARA CERRAR EL MODAL DE CONFIRMAR RESERVA

function cerrarModalRechazarReserva() {
    $('#modalRechazarReserva').modal('hide');
}

//FUNCION PARA RECHAZAR LA RESERVA

function rechazarReserva() {
    var motivo = $("#cphMaster_txtMotivoRechazoReserva").val();
    if (motivo == "") {
        document.getElementById("fmListarReservas").className = "was-validated";
    } else {
        cerrarModalRechazarReserva();
    }
}


//EVENTO QUE SE DISPARA CUANDO SE CIERRA EL MODAL RECHAZAR RESERVA

$('#modalRechazarReserva').on('hidden.bs.modal', function (e) {
    document.getElementById("cphMaster_txtMotivoRechazoReserva").required = false;
    document.getElementById("fmListarReservas").className = "needs-validation";
    limpiarCamposRechazarReserva();
});

//FUNCION QUE LIMPIA LOS CAMPOS DEL MODAL RECHAZAR RESERVA

function limpiarCamposRechazarReserva() {
    $("#cphMaster_txtMotivoRechazoReserva").val("");
    $("#cphMaster_txtPacienteRechazoReserva").val("");
    $("#cphMaster_txtEmailPacienteRechazoReserva").val("");
}

var reservas;

obtenerListaReservas();

function obtenerListaReservas() {
    $.ajax({
        type: "POST",
        url: "Confirmar_Rechazar_Reservas.aspx/ListarReservasPendientes",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirFilasTablaReservas(data.d);
        }
    });
}


function añadirFilasTablaReservas(data) {

    reservas = $("#ListaReservas").DataTable({
        "paging": true,
        "responsive": true,
        "autoWidth": true,
        "retrieve": true,
        "columns": [
            {
                "visible": false,
                "searchable": false
            },
            { 'responsivePriority': 1 },
            { 'responsivePriority': 2 },
            { 'responsivePriority': 3 },
            { 'responsivePriority': 4 },
            { 'responsivePriority': 7 },
            { 'responsivePriority': 8 },
            { 'responsivePriority': 9 },
            {
                "visible": false,
                "searchable": false
            },
            {
                "visible": false,
                "searchable": false
            },
            {
                "visible": false,
                "searchable": false
            },
            {
                "orderable": false,
                'responsivePriority': 5 
            },
            {
                "orderable": false,
                'responsivePriority': 6 
            }
        ],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ reservas pendientes",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ninguna reserva pendiente.",
            "sInfo": "Mostrando un total de _TOTAL_ reservas pendientes",
            "sInfoEmpty": "",
            "sInfoFiltered": "(filtrado de un total de _MAX_ reservas pendientes)",
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
   reservas.clear().draw();
    for (var i = 0; i < data.length; i++) {
       reservas.row.add([
           data[i].id_reserva,
           i + 1,
           data[i].paciente.apellido_paciente + " " + data[i].paciente.nombre_paciente,
           data[i].medico.apellido_medico + " " + data[i].medico.nombre_medico,
           data[i].medico.especialidad.nombre_especialidad,
           data[i].fecha_reserva,
           data[i].hora_reserva,
           data[i].consulta_reserva,
           data[i].paciente.email_paciente,
           data[i].paciente.telefono_paciente,
           data[i].paciente.sexo_paciente,
           '<button  type="button" title="Confirmar" id="' + data[i].id_reserva + '" class="btn btn-inverse-success btn-confirmar-reserva  w3-hover-text-green w3-hover-white"><i class="glyphicon glyphicon-ok" aria-hidden="true"></i></button>',
           '<button  type="button" id="' + data[i].id_reserva + '" title="Rechazar" class="btn btn-inverse-danger btn-rechazar-reserva  w3-hover-text-red w3-hover-white"><i class="fa fa-window-close" aria-hidden="true"></i></button>'
        ]).draw();
    }
    reservas.columns.adjust().draw();
}

$(document).on('click', '.btn-confirmar-reserva', function (e) {
    document.getElementById("cphMaster_txtDescripcionConfirmarReserva").required = true;
    e.preventDefault();
    var id = e.currentTarget.id;
    var cant = reservas.rows().count();
    var band = 0;
    var i = 0;
    var row;
    while (i < cant && band === 0) {
        row = reservas.row(i).data();
        if (row[0] == id) {
            band = 1;
        } else {
            i = i + 1;
        }
    }
    if (band == 1) {
        $("#cphMaster_hfIdReserva").val(row[0]);
        $("#cphMaster_txtPacienteConfirmarReserva").val(row[2]);
        $("#cphMaster_txtMedicoConfirmarReserva").val(row[3]);
        $("#cphMaster_txtFechaAtencionConfirmarReserva").val(row[5]);
        $("#cphMaster_txtHoraAtencionConfirmarReserva").val(row[6]);
        $("#cphMaster_txtEmailPacienteConfirmarReserva").val(row[8]);
        $("#cphMaster_txtEspecialidadConfirmarReserva").val(row[4]);
        $("#cphMaster_txtPacienteConfirmarReserva").attr('readonly', true);
        $("#cphMaster_txtMedicoConfirmarReserva").attr('readonly', true);
        $("#cphMaster_txtFechaAtencionConfirmarReserva").attr('readonly', true);
        $("#cphMaster_txtHoraAtencionConfirmarReserva").attr('readonly', true);
        $("#cphMaster_txtEmailPacienteConfirmarReserva").attr('readonly', true);
        $("#cphMaster_txtEspecialidadConfirmarReserva").attr('readonly', true);
        abrirModalConfirmarReserva();
    }
});


$(document).on('click', '.btn-rechazar-reserva ', function (e) {
    document.getElementById("cphMaster_txtMotivoRechazoReserva").required = true;
    e.preventDefault();
    var id = e.currentTarget.id;
    var cant = reservas.rows().count();

    var band = 0;
    var i = 0;
    var row;
    while (i < cant && band === 0) {
        row = reservas.row(i).data();
        if (row[0] == id) {
            band = 1;
        } else {
            i = i + 1;
        }
    }
    if (band == 1) {
        $("#cphMaster_hfIdReserva").val(row[0]);
        $("#cphMaster_txtPacienteRechazoReserva").val(row[2]);
        $("#cphMaster_txtEmailPacienteRechazoReserva").val(row[8]);
        $("#cphMaster_hfIdReserva").attr('readonly', true);
        $("#cphMaster_txtPacienteRechazoReserva").attr('readonly', true);
        $("#cphMaster_txtEmailPacienteRechazoReserva").attr('readonly', true);
        abrirModalRechazarReserva();
    }
});