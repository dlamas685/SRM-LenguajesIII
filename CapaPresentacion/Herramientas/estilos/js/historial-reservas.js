var reservas;

obtenerListaReservas();

function obtenerListaReservas() {
    var id = document.getElementById("spanIdPaciente").innerHTML;
    var obj = JSON.stringify({ id_paciente: id });
    $.ajax({
        type: "POST",
        url: "Historial_Reservas.aspx/ListarReservasPaciente",
        data: obj,
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
        "retrieve": true,
        "responsive": true,
        "autoWidth": true,
        "columns": [
            {
                "visible": false,
                "searchable": false
            },
            { 'responsivePriority': 1 },
            { 'responsivePriority': 4 },
            { 'responsivePriority': 5 },
            { 'responsivePriority': 2 },
            { 'responsivePriority': 3 },
            { 'responsivePriority': 6 },
            { 'responsivePriority': 7 }
        ],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ reservas",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ninguna reserva.",
            "sInfo": "Mostrando un total de _TOTAL_ reservas",
            "sInfoEmpty": "",
            "sInfoFiltered": "(filtrado de un total de _MAX_ reservas)",
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
            data[i].medico.apellido_medico + " " + data[i].medico.nombre_medico,
            data[i].medico.especialidad.nombre_especialidad,
            data[i].fecha_reserva,
            data[i].hora_reserva,
            data[i].estado_reserva,
            data[i].motivo_observacion_reserva
            
        ]).draw();
    }
    reservas.columns.adjust().draw();
}