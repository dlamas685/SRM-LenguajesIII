
var fecha = new Date();
var año = fecha.getFullYear();

$(document).ready(function (e) {
    var date = new Date();
    var dd = date.getDate();
    var mm = date.getMonth() + 1;
    var yyyy = date.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }

    if (mm < 10) {
        mm = '0' + mm;
    }
    var fecha = dd + "/" + mm + "/" + yyyy;
    $('#cphMaster_txtRangoFechaGenerarListaHorarios').daterangepicker({
        "showDropdowns": true,
        "minYear": 2019,
        "maxYear": 2020,

        "locale": {
            "format": "DD/MM/YYYY",
            "separator": " - ",
            "applyLabel": "Guardar",
            "cancelLabel": "Cancelar",
            "fromLabel": "Desde",
            "toLabel": "Hasta",
            "customRangeLabel": "Personalizar",
            "daysOfWeek": [
                "Do",
                "Lu",
                "Ma",
                "Mi",
                "Ju",
                "Vi",
                "Sa"
            ],
            "monthNames": [
                "Enero",
                "Febrero",
                "Marzo",
                "Abril",
                "Mayo",
                "Junio",
                "Julio",
                "Agosto",
                "Setiembre",
                "Octubre",
                "Noviembre",
                "Diciembre"
            ],
            "firstDay": 1
        },
        "applyButtonClasses": "btn-primary",
        "cancelClass": "btn-danger",
        "startDate": fecha,
        "endDate": fecha,
        "minDate": fecha,
        "opens": "center"
    },
    );


    horariosMedicoRango = $("#ListaFechas").DataTable({
        "paging": true,
        "responsive": true,
        "autoWidth": true,
        "retrieve": true,
        "columns": [
            {
                "visible": false,
                "searchable": false
            },
            { 'responsivePriority': 2 },
            { 'responsivePriority': 1 },
            { 'responsivePriority': 4 },
            { 'responsivePriority': 5 },
            {
                "orderable": false,
                'responsivePriority': 3 
            }
        ],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ horarios",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún horario registrado en el sistema",
            "sInfo": "Mostrando un total de _TOTAL_ horarios",
            "sInfoEmpty": "",
            "sInfoFiltered": "(filtrado de un total de _MAX_ horarios)",
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
});

var horariosMedicoRango;

obtenerListaMedicos();

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
            añadirMedicos(data.d);
        }
    });
}

function añadirMedicos(data) {
    for (var i = 0; i < data.length; i++) {
        $('#cphMaster_selectMedicoGenerarListaHorarios').append('<option value="' + data[i].id_medico + '">' + data[i].apellido_medico + " " + data[i].nombre_medico + '</option>');
    }
}

$(document).on('change', '#cphMaster_selectMedicoGenerarListaHorarios', function (event) {
    var id_medico = $("#cphMaster_selectMedicoGenerarListaHorarios").val();
    document.getElementById("cardBodyListarHorarios").style.display = "none";
    horariosMedicoRango.clear().draw();
    if (id_medico !== "") {
        obtenerDatosMedico(id_medico);
    } else {
        $("#cphMaster_txtDniListaHorarios").val("");
        $("#cphMaster_txtEspecialidadListaHorarios").val("");
        $("#cphMaster_txtSexoListaHorarios").val("");
        
        
        document.getElementById("cardListaHorariosAtencion").style.display = "none";
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
    $("#cphMaster_txtDniListaHorarios").val(objMedico.dni_medico);
    $("#cphMaster_txtEspecialidadListaHorarios").val(objMedico.especialidad.nombre_especialidad);
    var sexo;
    if (objMedico.sexo_medico == "M") {
        sexo = "Masculino";
    } else {
        sexo = "Femenino";
    }
    $("#cphMaster_txtSexoListaHorarios").val(sexo);
    document.getElementById("cardListaHorariosAtencion").style.display = "block";

}



function GenerarListaHorarios() {
    var rangofecha = $("#cphMaster_txtRangoFechaGenerarListaHorarios").val();
    var id_medico = $("#cphMaster_selectMedicoGenerarListaHorarios").val();
    var divisionrango = rangofecha.split(' - ');
    var desfechainicio = divisionrango[0];
    var desfechafin = divisionrango[1];
    var divisionfechafin = desfechafin.split('/');
    var divisionfechainicio = desfechainicio.split('/');
    var fecha_fin = divisionfechafin[2] + "-" + divisionfechafin[1] + "-" + divisionfechafin[0];
    var fecha_inicio = divisionfechainicio[2] + "-" + divisionfechainicio[1] + "-" + divisionfechainicio[0];
    obtenerListaHorariosMedico(id_medico, fecha_inicio, fecha_fin);
}

function obtenerListaHorariosMedico(id, fechaInicio, fechaFin) {
    var obj = JSON.stringify({ id_medico: id, fecha_inicio: fechaInicio, fecha_fin: fechaFin });
    $.ajax({
        type: "POST",
        url: "Ver_Horarios.aspx/ListarHorariosMedicoRangoFecha",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirFilasTablaHorariosMedico(data.d);
        }
    });
}


function añadirFilasTablaHorariosMedico(data) {

    horariosMedicoRango.clear().draw();
    for (var i = 0; i < data.length; i++) {
        horariosMedicoRango.row.add([
            data[i].id_horario,
            i + 1,
            data[i].fecha_atencion,
            data[i].hora_inicio,
            data[i].hora_fin,
            '<button  type="button" id="' + data[i].id_horario + '" title="Eliminar" class="btn btn-danger btn-eliminar-fecha  w3-hover-text-red w3-hover-white"><i class="fa fa-trash" aria-hidden="true"></i></button>'
        ]).draw();
    }
    horariosMedicoRango.columns.adjust().draw();
    document.getElementById("cardBodyListarHorarios").style.display = "block";
}



function eliminarDatosHorarios(id_horario, id_medico) {

    var obj = JSON.stringify({ id_horario: id_horario, id_medico: id_medico });

    $.ajax({
        type: "POST",
        url: "Ver_Horarios.aspx/EliminarHorarioMedico",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                GenerarListaHorarios();
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-light border-success m-1 w-25'
                    },
                    buttonsStyling: false
                });

                swalWithBootstrapButtons.fire({
                    title: 'Operación Confirmada',
                    text: "El horario se elimino correctamente",
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
                    text: "El médico tiene reserva registradas para esta fecha, por favor rechace o cancele las reservas e intente de nuevo.",
                    type: 'error',
                    confirmButtonText: 'Cerrar',
                    footer: "© " + año + " Copyright FIMA",
                    reverseButtons: true
                });
            }
        }
    });
}

$(document).on('click', '.btn-eliminar-fecha', function (e) {
    e.preventDefault();
    var id = e.currentTarget.id;
    var id_medico = $("#cphMaster_selectMedicoGenerarListaHorarios").val(); 
    var cant = horariosMedicoRango.rows().count();
    var band = 0;
    var i = 0;
    var row;
    while (i < cant && band === 0) {
        row = horariosMedicoRango.row(i).data();
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
        text: "Se eliminaran los horarios de reservas definidos para la fecha " + row[2] + " asi como su horario de entrada y salida.",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'No',
        cancelButtonText: 'Si',
        footer: "© " + año + " Copyright FIMA",
        reverseButtons: true
    }).then((result) => {
        if (!result.value) {
            eliminarDatosHorarios(id, id_medico);
        } else {
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-light border-info m-1 w-25'
                },
                buttonsStyling: false
            });

            swalWithBootstrapButtons.fire({
                title: 'Operación Cancelada',
                text: "El horario establecido para la fecha " + row[2] + " no se elimino, por lo tanto los horarios de reservas estan a salvo.",
                type: 'info',
                confirmButtonText: 'Cerrar',
                reverseButtons: true,
                footer: "© " + año + " Copyright FIMA"
            });
        }
    });
});