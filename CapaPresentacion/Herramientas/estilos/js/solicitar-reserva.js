

var fecha = new Date();
var año = fecha.getFullYear();
var medicos;


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

//FUNCION PARA ABRIR EL MODAL SOLICITAR RESERVA

function abrirModalSolicitarReserva() {
    $('#modalSolicitarReserva').modal('show');
}

//FUNCION PARA CERRAR EL MODAL SOLICITAR RESERVA

function cerrarModalSolicitarReserva() {
    $('#modalSolicitarReserva').modal('hide');
    $('#cphMaster_selectFechaCrearAgenda').empty();
    $('#cphMaster_selectFechaCrearAgenda').append('<option value="">(Seleccionar fecha)</option>');
}


$('#modalSolicitarReserva').on('hidden.bs.modal', function (e) {
    document.getElementById("fmSolicitarReserva").className = "needs-validation";
    document.getElementById("colHoraReserva").style.display = "none";
    $('#cphPacientes_txtConsultaSolicitarReserva').val("");   
    $('#cphPacientes_selectFechaReservaSolicitarReserva').empty();
    $('#cphPacientes_selectFechaReservaSolicitarReserva').append('<option value="">(Seleccionar fecha de reserva)</option>');
    $('#cphPacientes_selectHorarReservaSolicitarReserva').empty();
    $('#cphPacientes_selectHorarReservaSolicitarReserva').append('<option value="">(Seleccionar hora de reserva)</option>');
});

//FUNCION PARA SOLICITAR UNA RESERVA

function solicitarReserva() {
    var id_horario = $("#cphPacientes_selectFechaReservaSolicitarReserva").val();
    var id_horario_hora = $("#cphPacientes_selectHorarReservaSolicitarReserva").val();
    var id_medico = $("#cphPacientes_hfIdMedico").val();
    if (id_horario == "" || id_horario_hora == "") {
        document.getElementById("fmSolicitarReserva").className = "was-validated";
    }
    else {
        registrarReserva(id_medico,id_horario, id_horario_hora);
        cerrarModalSolicitarReserva();
    }
}

// SE DISPARA CON EL DOCUMENTO PARA CREAR EL DATARANGEPICKER

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
    $("#cphPacientes_txtFechaBuscarDisponibilidades").mask("00/00/0000 - 00/00/0000");
    $('#cphPacientes_txtFechaBuscarDisponibilidades').daterangepicker({
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

});

obtenerEspecialidades();
function obtenerEspecialidades() {
    $.ajax({
        type: "POST",
        url: "Solicitar_Reservas.aspx/ListarEspecialidades",
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


function añadirEspecialidades(data) {
    for (var i = 0; i < data.length; i++) {
        $('#cphPacientes_selectEspecialidadMedicoSolicitarReserva').append('<option value="' + data[i].id_especialidad + '">' + data[i].nombre_especialidad + '</option>');
    }
}

$(document).on('change', '#cphPacientes_selectEspecialidadMedicoSolicitarReserva', function (event) {
    document.getElementById("cardbodySolicitarReserva").style.display = "none";
});



function BuscarDisponibilidades() {
    var IdEspecialidad = $('#cphPacientes_selectEspecialidadMedicoSolicitarReserva').val();
    var rangofecha = $("#cphPacientes_txtFechaBuscarDisponibilidades").val();
    if (rangofecha == "") {
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-light border-info m-1 w-25'
            },
            buttonsStyling: false
        });

        swalWithBootstrapButtons.fire({
            title: 'Operación Cancelada',
            text: "Debe seleccionar un rango de fechas.",
            type: 'info',
            confirmButtonText: 'Cerrar',
            footer: "© " + año + " Copyright FIMA",
            reverseButtons: true
        });
    }
    else {
        if (IdEspecialidad == "") {
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-light border-info m-1 w-25'
                },
                buttonsStyling: false
            });

            swalWithBootstrapButtons.fire({
                title: '¡Oops!',
                text: "Para realizar la busqueda necesitamos que seleccione una especialidad.",
                type: 'info',
                confirmButtonText: 'Cerrar',
                footer: "© " + año + " Copyright FIMA",
                reverseButtons: true
            });
        } else {
            var divisionrango = rangofecha.split(' - ');
            var desfechainicio = divisionrango[0];
            var desfechafin = divisionrango[1];
            var divisionfechafin = desfechafin.split('/');
            var divisionfechainicio = desfechainicio.split('/');
            var fecha_fin = divisionfechafin[2] + "-" + divisionfechafin[1] + "-" + divisionfechafin[0];
            var fecha_inicio = divisionfechainicio[2] + "-" + divisionfechainicio[1] + "-" + divisionfechainicio[0];
            obtenerMedicos(IdEspecialidad, fecha_inicio, fecha_fin);
        }

    }
}


function obtenerMedicos(IdEspecialidad, fecha_inicio, fecha_fin) {
    var obj = JSON.stringify({ IdEspecialidad: IdEspecialidad, fecha_inicio: fecha_inicio, fecha_fin: fecha_fin });
    $.ajax({
        type: "POST",
        url: "Solicitar_Reservas.aspx/ListarMedicosEspecialidadFechas",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirFilasTablaMedicos(data.d);
        }
    });
}

function añadirFilasTablaMedicos(data) {

    medicos = $("#ListaMedicos").DataTable({
        "paging": false,
        "autoWidth": true,
        "responsive": true,     
        "retrieve": true,
        "info": false,
        "searching": false,        
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
            {
                "visible": false,
                "searchable": false
            },
            {
                "visible": false,
                "searchable": false
            },
            { 'responsivePriority': 5 },
            { 'responsivePriority': 6 },
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
            { 'responsivePriority': 7 },
            {
                "orderable": false,
                'responsivePriority': 4}
        ],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ medicos",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "No se encontraron coincidencias.",
            "sInfo": "Mostrando un total de _TOTAL_ medicos",
            "sInfoEmpty": "",
            "sInfoFiltered": "(filtrado de un total de _MAX_ medicos)",
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
            i + 1,
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
            '<button  type="button" title="Solicitar" id="' + data[i].id_medico + '" class="btn btn-inverse-primary btn-solicitar-reserva w3-hover-text-blue w3-hover-white"><i class="fa fa-calendar-day" aria-hidden="true"></i></button>'
        ]).draw();
    }
    document.getElementById("cardbodySolicitarReserva").style.display = "block";
    medicos.columns.adjust().draw();
}


$(document).on('click', '.btn-solicitar-reserva', function (e) {
    e.preventDefault();
    var rangofecha = $("#cphPacientes_txtFechaBuscarDisponibilidades").val();
    var divisionrango = rangofecha.split(' - ');
    var desfechainicio = divisionrango[0];
    var desfechafin = divisionrango[1];
    var divisionfechafin = desfechafin.split('/');
    var divisionfechainicio = desfechainicio.split('/');
    var fecha_fin = divisionfechafin[2] + "-" + divisionfechafin[1] + "-" + divisionfechafin[0];
    var fecha_inicio = divisionfechainicio[2] + "-" + divisionfechainicio[1] + "-" + divisionfechainicio[0];
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
        $("#cphPacientes_hfIdMedico").val(row[0]);
        var url = $("#" + row[0]).attr('src');
        $("#cphPacientes_imagenMedico").attr('src', url);
        $("#cphPacientes_txtMedicoSolicitarReserva").val(row[3]);
        $("#cphPacientes_txtEspecialidadMedicoSolicitarReserva").val(row[9]);
        obtenerFechasMedicoRango(row[0], fecha_inicio, fecha_fin);
        abrirModalSolicitarReserva();
    }
});

function obtenerFechasMedicoRango(id_medico, fecha_inicio, fecha_fin) {
    var obj = JSON.stringify({ id_medico: id_medico, fecha_inicio: fecha_inicio, fecha_fin: fecha_fin });
    $.ajax({
        type: "POST",
        url: "Solicitar_Reservas.aspx/TraerFechasMedicoRango",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirFechas(data.d);
        }
    });
}


function añadirFechas(data) {
    for (var i = 0; i < data.length; i++) {
        $('#cphPacientes_selectFechaReservaSolicitarReserva').append('<option value="' + data[i].id_horario + '">' + data[i].fecha_atencion + '</option>');
    }
}

$(document).on('change', '#cphPacientes_selectFechaReservaSolicitarReserva', function (event) {
    $('#cphPacientes_hfIdHorario').val($("#cphPacientes_selectFechaReservaSolicitarReserva option:selected").val() + " " + $("#cphPacientes_selectFechaReservaSolicitarReserva option:selected").text());
    var id_horario = $("#cphPacientes_selectFechaReservaSolicitarReserva").val();
    $('#cphPacientes_selectHorarReservaSolicitarReserva').empty();
    $('#cphPacientes_selectHorarReservaSolicitarReserva').append('<option value="">(Seleccionar hora de reserva)</option>');
    if (id_horario !== "") {
        obtenerHorasFecha(id_horario);
        document.getElementById("colHoraReserva").style.display = "block";
    } else {
        document.getElementById("colHoraReserva").style.display = "none";
    }
});

function obtenerHorasFecha(id_horario) {
    var obj = JSON.stringify({ id_horario: id_horario });
    $.ajax({
        type: "POST",
        url: "Solicitar_Reservas.aspx/ListarHorasFechaHabilitadas",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirHoras(data.d);
        }
    });
}


function añadirHoras(data) {
    for (var i = 0; i < data.length; i++) {
        $('#cphPacientes_selectHorarReservaSolicitarReserva').append('<option value="' + data[i].id_horario_hora + '">' + data[i].hora + '</option>');
    }
}

$(document).on('change', '#cphPacientes_selectHorarReservaSolicitarReserva', function (event) {
    $('#cphPacientes_hfIdHorarioHora').val($("#cphPacientes_selectHorarReservaSolicitarReserva option:selected").val() + " "+ $("#cphPacientes_selectHorarReservaSolicitarReserva option:selected").text());
});


$("#cphPacientes_txtFechaBuscarDisponibilidades").change(function () {
    document.getElementById("cardbodySolicitarReserva").style.display = "none";
});