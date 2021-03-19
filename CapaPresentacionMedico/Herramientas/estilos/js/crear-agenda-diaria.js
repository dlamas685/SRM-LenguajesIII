var fecha = new Date();
var año = fecha.getFullYear();
var horasFecha;

obtenerListaMedicos();

function obtenerListaMedicos() {
    $.ajax({
        type: "POST",
        url: "Ver_Agenda_Diaria.aspx/ListarMedicosConFechasDefinidas",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirMedicos(data.d);
        }
    });
}

function añadirMedicos(data) {
    for (var i = 0; i < data.length; i++) {
        $('#cphMaster_selectMedicoCrearAgenda').append('<option value="' + data[i].id_medico + '">' + data[i].apellido_medico + " " + data[i].nombre_medico + '</option>');
    }
}

$(document).on('change', '#cphMaster_selectMedicoCrearAgenda', function (event) {
    var id_medico = $("#cphMaster_selectMedicoCrearAgenda").val();
    document.getElementById("cardBodyCrearHorarios").style.display = "none";
    document.getElementById("col2HorariosEntradaSalida").style.display = "none";
    document.getElementById("col1HorariosEntradaSalida").style.display = "none";
    $('#cphMaster_selectFechaCrearAgenda').empty();
    $('#cphMaster_selectFechaCrearAgenda').append('<option value="">(Seleccionar fecha)</option>');
    if (id_medico !== "") {
        obtenerDatosMedico(id_medico);
        obtenerFechasMedico(id_medico);
    } else {
        $("#cphMaster_txtDniCrearAgenda").val("");
        $("#cphMaster_txtEspecialidadCrearAgenda").val("");
        $("#cphMaster_txtSexoCrearAgenda").val("");
        document.getElementById("cardCrearHorariosFecha").style.display = "none";
    }
});


function obtenerDatosMedico(id) {
    var obj = JSON.stringify({ id_medico: id });
    $.ajax({
        type: "POST",
        url: "Crear_Horarios.aspx/TraerDatosMedico",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (objMedico) {
            escribirDatosMedico(objMedico.d);
        }
    });
}


function escribirDatosMedico(objMedico) {
    $("#cphMaster_txtDniCrearAgenda").val(objMedico.dni_medico);
    $("#cphMaster_txtEspecialidadCrearAgenda").val(objMedico.especialidad.nombre_especialidad);
    var sexo;
    if (objMedico.sexo_medico == "M") {
        sexo = "Masculino";
    } else {
        sexo = "Femenino";
    }
    $("#cphMaster_txtSexoCrearAgenda").val(sexo);
    document.getElementById("cardCrearHorariosFecha").style.display = "block";

}

function obtenerFechasMedico(id) {
    var obj = JSON.stringify({ id_medico: id });
    $.ajax({
        type: "POST",
        url: "Ver_Agenda_Diaria.aspx/TraerFechasMedico",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirFechasMedico(data.d);
        }
    });
}

function añadirFechasMedico(data) {
    for (var i = 0; i < data.length; i++) {
        $('#cphMaster_selectFechaCrearAgenda').append('<option value="' + data[i].id_horario + '">' + data[i].fecha_atencion + '</option>');
    }
}

$(document).on('change', '#cphMaster_selectFechaCrearAgenda', function (event) {
    var id_horario = $("#cphMaster_selectFechaCrearAgenda").val();
    if (id_horario !== "") {
        document.getElementById("cardBodyCrearHorarios").style.display = "block";
        document.getElementById("col2HorariosEntradaSalida").style.display = "block";
        document.getElementById("col1HorariosEntradaSalida").style.display = "block";
        obtenerHorarioEntradaSalida(id_horario);
        obtenerHorasFecha(id_horario);
    } else {
        document.getElementById("cardBodyCrearHorarios").style.display = "none";
        document.getElementById("col2HorariosEntradaSalida").style.display = "none";
        document.getElementById("col1HorariosEntradaSalida").style.display = "none";
    }
});

function obtenerHorarioEntradaSalida(id) {
    var obj = JSON.stringify({ id_horario: id });
    $.ajax({
        type: "POST",
        url: "Ver_Agenda_Diaria.aspx/TraerHorariosEntradaSalida",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            escribirDatosHorario(data.d);
        }
    });
}

function escribirDatosHorario(data) {
    document.getElementById('spanHoraEntradaCrearAgenda').innerHTML = data.hora_inicio;
    document.getElementById('spanHoraSalidaCrearAgenda').innerHTML = data.hora_fin;
}

function obtenerHorasFecha(id) {
    var obj = JSON.stringify({ id_horario: id });
    $.ajax({
        type: "POST",
        url: "Ver_Agenda_Diaria.aspx/ListarHorasFecha",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirFilasTablaHoras(data.d);
        }
    });
}

function añadirFilasTablaHoras(data) {
    horasFecha = $("#ListaHorasFecha").DataTable({
        "paging": true,
        "retrieve": true,
        "info": false,
        "searching": false,
        "responsive": true,
        "autoWidth": false,
        "columns": [
            {
                "visible": false,
                "searchable": false
            },
            null,
            null,
            null,
            null,
            { "orderable": false }
        ],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ horas",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ninguna hora registrada en el sistema",
            "sInfo": "Mostrando un total de _TOTAL_ horas",
            "sInfoEmpty": "",
            "sInfoFiltered": "(filtrado de un total de _MAX_ horas)",
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
    horasFecha.clear().draw();
    for (var i = 0; i < data.length; i++) {
        if (data[i].estado_hora == "Habilitada") {
            horasFecha.row.add([
                data[i].id_horario_hora,
                i + 1,
                data[i].hora,
                data[i].estado_hora,
                data[i].situacion_hora,
                '<button  type="button" id="' + data[i].id_horario_hora + '" title="Deshabilitar" class="btn btn-inverse-danger btn-deshabilitar-hora w3-hover-text-red w3-hover-white"><i class="fa fa-ban" aria-hidden="true"></i> Deshabilitar</button>'
            ]).draw();
        } else {
            horasFecha.row.add([
                data[i].id_horario_hora,
                i + 1,
                data[i].hora,
                data[i].estado_hora,
                data[i].situacion_hora,
                '<button  type="button" id="' + data[i].id_horario_hora + '" title="Habilitar" class="btn btn-inverse-success btn-habilitar-hora w3-hover-text-teal w3-hover-white"><i class="glyphicon glyphicon-ok" aria-hidden="true"></i> Habilitar</button>'
            ]).draw();
        }
        
    }
}

function deshabilitarHorarioFecha(id_horario_hora, id_horario) {
    var obj = JSON.stringify({ id_horario: id_horario, id_horario_hora: id_horario_hora});
    $.ajax({
        type: "POST",
        url: "Ver_Agenda_Diaria.aspx/DeshabilitarHorarioFecha",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                obtenerHorasFecha(id_horario);
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-light border-success m-1 w-25'
                    },
                    buttonsStyling: false
                });

                swalWithBootstrapButtons.fire({
                    title: 'Operación Confirmada',
                    text: "El horario fue deshabilitado correctamente",
                    type: 'success',
                    confirmButtonText: 'Cerrar',
                    reverseButtons: true,
                    footer: "© " + año + " Copyright FIMA"
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
                    text: "No es posible dehabilitar el horario.",
                    type: 'error',
                    confirmButtonText: 'Cerrar',
                    reverseButtons: true,
                    footer: "© " + año + " Copyright FIMA"
                });
            }
        }
    });
}

$(document).on('click', '.btn-deshabilitar-hora', function (e) {
    e.preventDefault();
    var id_horario_hora = e.currentTarget.id;
    var id_horario = $("#cphMaster_selectFechaCrearAgenda").val();
    var cant = horasFecha.rows().count();
    var band = 0;
    var i = 0;
    var row;
    while (i < cant && band === 0) {
        row = horasFecha.row(i).data();
        if (row[0] == id_horario_hora) {
            band = 1;
        } else {
            i = i + 1;
        }
    }
    deshabilitarHorarioFecha(id_horario_hora,id_horario);
    
});

function habilitarHorarioFecha(id_horario_hora, id_horario) {
    var obj = JSON.stringify({ id_horario: id_horario, id_horario_hora: id_horario_hora });
    $.ajax({
        type: "POST",
        url: "Ver_Agenda_Diaria.aspx/HabilitarHorarioFecha",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function(xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function(response) {
            if (response.d) {
                obtenerHorasFecha(id_horario);
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-light border-success m-1 w-25'
                    },
                    buttonsStyling: false
                });

                swalWithBootstrapButtons.fire({
                    title: 'Operación Confirmada',
                    text: "El horario fue habilitado correctamente",
                    type: 'success',
                    confirmButtonText: 'Cerrar',
                    reverseButtons: true,
                    footer: "© " + año + " Copyright FIMA"
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
                    text: "No es posible habilitar el horario.",
                    type: 'error',
                    confirmButtonText: 'Cerrar',
                    reverseButtons: true,
                    footer: "© " + año + " Copyright FIMA"
                });
            }
        }
    });
}

$(document).on('click', '.btn-habilitar-hora', function(e) {
    e.preventDefault();
    var id_horario_hora = e.currentTarget.id;
    var id_horario = $("#cphMaster_selectFechaCrearAgenda").val();
    var cant = horasFecha.rows().count();
    var band = 0;
    var i = 0;
    var row;
    while (i < cant && band === 0) {
        row = horasFecha.row(i).data();
        if (row[0] == id_horario_hora) {
            band = 1;
        } else {
            i = i + 1;
        }
    }
    habilitarHorarioFecha(id_horario_hora, id_horario);

});