var reservas;

obtenerListaReservasRechazadas();

function obtenerListaReservasRechazadas() {
    $.ajax({
        type: "POST",
        url: "Inicio_Pagina_Interna.aspx/ListarReservasTop",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirFilasTablaReservasRechazadas(data.d);
        }
    });
}

function añadirFilasTablaReservasRechazadas(data) {
    reservas = $("#ListaReservasTOP").DataTable({
        "paging": false,
        "responsive": true,
        "autoWidth": true,
        "info": false,
        "searching": false,
        "retrieve": true,
        "columns": [
            { 'responsivePriority': 1 },
            { 'responsivePriority': 2 },
            { 'responsivePriority': 5 },
            { 'responsivePriority': 6 },
            { 'responsivePriority': 3 },
            { 'responsivePriority': 4 },
            { 'responsivePriority': 7 }
        ],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ reservas",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ninguna reserva registrada.",
            "sInfo": "Mostrando un total de _TOTAL_ reservas rechazadas",
            "sInfoEmpty": "",
            "sInfoFiltered": "(filtrado de un total de _MAX_ reservas rechazadas)",
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
            i + 1,
            data[i].paciente.apellido_paciente + " " + data[i].paciente.nombre_paciente,
            data[i].medico.apellido_medico + " " + data[i].medico.nombre_medico,
            data[i].medico.especialidad.nombre_especialidad,
            data[i].fecha_reserva,
            data[i].hora_reserva,
            data[i].estado_reserva
        ]).draw();
    }
    reservas.columns.adjust().draw();
}




$(document).ready(function (e) {
    $('.datepicker-here').datepicker({
        autoClose: true,
        timepicker: true,
        position: 'right top',
        language: 'es'
    });
});