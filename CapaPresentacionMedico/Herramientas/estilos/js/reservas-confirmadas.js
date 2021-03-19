var reservas;

obtenerListaReservasConfirmadas();

function obtenerListaReservasConfirmadas() {
    $.ajax({
        type: "POST",
        url: "Reservas_Confirmadas.aspx/ListarReservasConfirmadas",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirFilasTablaReservasConfirmadas(data.d);
        }
    });
}

function añadirFilasTablaReservasConfirmadas(data) {

    reservas = $("#ListaReservasConfirmadas").DataTable({
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
            { 'responsivePriority': 9 },
            { 'responsivePriority': 2 },
            { 'responsivePriority': 3 },
            { 'responsivePriority': 4 },
            { 'responsivePriority': 5 },
            { 'responsivePriority': 6 },
            { 'responsivePriority': 7 },
            { 'responsivePriority': 8 },
            {
                "visible": false              
            },
            {
                "visible": false
            },
            {
                "visible": false,
                "searchable": false
            },
            {
                "orderable": false,
                'responsivePriority': 1
            }
        ],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ reservas confirmadas",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ninguna reserva confirmada.",
            "sInfo": "Mostrando un total de _TOTAL_ reservas confirmadas",
            "sInfoEmpty": "",
            "sInfoFiltered": "(filtrado de un total de _MAX_ reservas confirmadas)",
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
            data[i].empleado.apellido_empleado + " " + data[i].empleado.nombre_empleado,
            data[i].paciente.apellido_paciente + " " + data[i].paciente.nombre_paciente,
            data[i].paciente.telefono_paciente,
            data[i].medico.apellido_medico + " " + data[i].medico.nombre_medico,
            data[i].medico.especialidad.nombre_especialidad,
            data[i].fecha_reserva,
            data[i].hora_reserva,
            data[i].motivo_observacion_reserva,
            data[i].paciente.dni_paciente,
            data[i].paciente.email_paciente,
            data[i].estado_reserva,
            '<button  type="button" title="Cancelar" id="' + data[i].id_reserva + '" class="btn btn-inverse-primary border-primary btn-cancelar-reserva"><i class="fa fa-window-close" aria-hidden="true"></i></button>'
        ]).draw();
    }
    reservas.columns.adjust().draw();
}

$(document).on('click', '.btn-cancelar-reserva', function (e) {
    e.preventDefault();
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
        $("#cphMaster_txtEmailPacienteCancelarReserva").val(row[11]);
        $("#cphMaster_txtEmailPacienteCancelarReserva").attr('readonly',true);
        $("#cphMaster_txtPacienteCancelarReserva").val(row[3]);
        $("#cphMaster_txtPacienteCancelarReserva").attr('readonly', true);
    }
    abrirModalCancelarReserva();
});

function abrirModalCancelarReserva() {
    $('#modalCancelarReserva').modal('show');
}

function salirModalCancelarReserva() {
    $('#modalCancelarReserva').modal('hide');
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


$('#modalCancelarReserva').on('hidden.bs.modal', function (e) {
    document.getElementById("fmReservasConfirmadas").className = "needs-validation";
    $('#cphMaster_txtMotivoRechazoReserva').val('');
});
