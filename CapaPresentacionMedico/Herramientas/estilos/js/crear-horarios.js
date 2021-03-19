

var fecha = new Date();
var fecha_dia = fecha.getDate() + "/" + (fecha.getMonth() + 1) + "/" + fecha.getFullYear();
var año = fecha.getFullYear();
var horariosBD;
var horarios;
var resumen;


function abrirModalAgregarHorarios() {
    $('#modalHorariosAtencion').modal('show');

}

function cerrarModalHorarios() {
    $('#modalHorariosAtencion').modal('hide');
}


$(document).ready(function (e) {
    $("#cphMaster_txtFechaAtencion").mask("00/00/0000");
    $("#cphMaster_txtHoraAtencionEntrada").mask("00:00 SS");
    $("#cphMaster_txtHoraAtencionSalida").mask('00:00 SS');
    var disabledDays = [0, 6];
    $('.datepicker-here').datepicker({
        autoClose: true,
        language: 'es',
        position: 'right top',
        minDate: new Date(),
        onRenderCell: function (date, cellType) {
            if (cellType == 'day') {
                var day = date.getDay(),
                    isDisabled = disabledDays.indexOf(day) != -1;

                return {
                    disabled: isDisabled
                };
            }
        }
    });
    $('.timepicker').mdtimepicker({
        theme: 'red',
        hourPadding: false,
        readOnly: false,
        format: 'hh:mm tt'
    });
    $('.timepicker-blue').mdtimepicker({
        theme: 'blue',
        hourPadding: false,
        readOnly: false,
        format: 'hh:mm tt'
    });

    horarios = $("#ListaHorarios").DataTable({
        "paging": false,
        "retrieve": true,
        "info": false,
        "searching": false,
        "responsive": true,
        "autoWidth": false,
        "columns": [
            null,
            null,
            null,
            { "orderable": false },
            { "orderable": false }
        ],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ horarios",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Agregar horarios de atención.",
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

    resumen = $("#ResumenHorariosRegistrar").DataTable({
        "paging": false,
        "retrieve": true,
        "info": false,
        "searching": false,
        "responsive": true,
        "autoWidth": false,
        "columns": [
            { "orderable": false },
            { "orderable": false },
            { "orderable": false }
        ],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ horarios",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Agregar horarios de atención.",
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
        $('#cphMaster_selectMedicoRegistrarHorarios').append('<option value="' + data[i].id_medico + '">' + data[i].apellido_medico + " " + data[i].nombre_medico + '</option>');
    }
}

$(document).on('change', '#cphMaster_selectMedicoRegistrarHorarios', function (event) {
    $('#cphMaster_hfIdMedicoRegistrarHorarios').val($("#cphMaster_selectMedicoRegistrarHorarios option:selected").val());
    var id_medico = $("#cphMaster_selectMedicoRegistrarHorarios").val();
    if (id_medico !== "") {
        obtenerDatosMedico(id_medico);
    } else {
        $("#cphMaster_txtDniRegistrarHorarios").val("");
        $("#cphMaster_txtEspecialidadRegistrarMedico").val("");
        $("#cphMaster_txtSexoRegistrarMedico").val("");
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
    $("#cphMaster_txtDniRegistrarHorarios").val(objMedico.dni_medico);
    $("#cphMaster_txtEspecialidadRegistrarMedico").val(objMedico.especialidad.nombre_especialidad);
    var sexo;
    if (objMedico.sexo_medico == "M") {
        sexo = "Masculino";
    } else {
        sexo = "Femenino";
    }
    $("#cphMaster_txtSexoRegistrarMedico").val(sexo);
}

function irPasoDos() {
    var medico = $("#cphMaster_selectMedicoRegistrarHorarios").val();
    if (medico !== "") {
        document.getElementById("spanMedico").innerHTML = $("#cphMaster_selectMedicoRegistrarHorarios option:selected").text();
        document.getElementById("spanEspecialidad").innerHTML = $("#cphMaster_txtEspecialidadRegistrarMedico").val();
        obtenerListaHorariosMedico(medico);
        document.getElementById("nav-definirHorarios-tab").className = "nav-item nav-link border border-bottom-0 w3-text-white w3-pink";
        document.getElementById("nav-seleccionarMedico-tab").className = "nav-item nav-link border border-bottom-0 text-secondary bg-white disabled";
        $('#nav-definirHorarios-tab').tab('show');
    } else {
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-light border-info w3-hover-text-blue m-1 w-25'
            },
            buttonsStyling: false
        });
        swalWithBootstrapButtons.fire({
            title: 'Operación Cancelada',
            text: "Por favor, seleccione un médico para asignar horarios",
            type: 'info',
            timer: 5000,
            showConfirmButton: true,
            confirmButtonText:"Aceptar",
            footer: "© " + año + " Copyright FIMA"
        });
    }
}




$(document).on('click', '.btn-eliminar-horario', function (e) {
    e.preventDefault();
    var id = e.currentTarget.id;
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-warning m-1 w-25',
            cancelButton: 'btn btn-light border-warning m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: '¿Esta seguro?',
        text: "No podra recuperar los datos del cliente.",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'No',
        cancelButtonText: 'Si',
        reverseButtons: true
    }).then((result) => {
        if (!result.value) {
            var cant = horarios.rows().count();
            var band = 0;
            var i = 0;
            while (i < cant && band === 0) {
                var row = horarios.row(i).data();
                if (id == row[0]) {
                    band = 1;
                    horarios.row(i).remove().draw();
                } else {
                    i = i + 1;
                }
            }
        }
    });
});

$(document).on('click', '.btn-modificar-horario', function (e) {
    e.preventDefault();
    var id = e.currentTarget.id;
    document.getElementById("modificar").style.display = "block";
    document.getElementById("btnModificarHorario").style.display = "block";
    document.getElementById("btnAñadirHorario").style.display = "none";
    document.getElementById("añadir").style.display = "none";
    $('#modalHorariosAtencion').modal('show');
    var cant = horarios.rows().count();
    var band = 0;
    var i = 0;
    var row;
    while (i < cant && band === 0) {
        row = horarios.row(i).data();
        if (id == row[0]) {
            band = 1;
        } else {
            i = i + 1;
        }
    }
    if (band === 1) {
        $("#cphMaster_txtFechaAtencion").val(row[0]);
        $("#cphMaster_txtFechaAtencionModificar").val(row[0]);
        $("#cphMaster_txtHoraAtencionEntrada").val(row[1]);
        $("#cphMaster_txtHoraAtencionSalida").val(row[2]);
        $('#cphMaster_hfFechaModificar').val(id);
    }
});



function validarModalHorario(tipo) {
    var fecha = $("#cphMaster_txtFechaAtencion").val();
    var hora_entrada = $("#cphMaster_txtHoraAtencionEntrada").val();
    var hora_salida = $("#cphMaster_txtHoraAtencionSalida").val();
    var horaEntrada = hora_entrada.split(':');
    var horaSalida = hora_salida.split(':');
    var horaEntradaComparar = horaEntrada[0];
    var horaSalidaComparar = horaSalida[0];
    if (fecha == "" || hora_entrada == "" || hora_salida == "") {
        document.getElementById("fmCrearHorarios").className = "was-validated";
    }
    else {
        if (parseInt(horaSalidaComparar, 16) <= parseInt(horaEntradaComparar, 16) ) {
            mensajeHorasInicioFin();
        }
        else {
            if (tipo == "M") {
                modificarHorario(fecha, hora_entrada, hora_salida);
            } else {
                añadirHorario(fecha, hora_entrada, hora_salida);
            }
        }
    }
}


//function validarModalHorario(tipo) {
//    var fecha = $("#cphMaster_txtFechaAtencion").val();
//    var hora_entrada = $("#cphMaster_txtHoraAtencionEntrada").val();
//    var hora_salida = $("#cphMaster_txtHoraAtencionSalida").val();
//    var v_hora_entrada_id = hora_entrada.split(' ');
//    var v_hora_entrada = v_hora_entrada_id[0].split(':');
//    var v_hora_salida_id = hora_salida.split(' ');
//    var v_hora_salida = v_hora_salida_id[0].split(':');
//    if (fecha == "" || hora_entrada == "" || hora_salida == "") {
//        document.getElementById("fmCrearHorarios").className = "was-validated";
//    } else {
//        if (v_hora_entrada_id[1] == v_hora_salida_id[1]) {
//            if (parseInt(v_hora_entrada[0], 16) !== parseInt(12,16)) {
//                if (parseInt(v_hora_entrada[0], 16) < parseInt(v_hora_salida[0], 16)) {
//                    if (tipo == "M") {
//                        modificarHorario(fecha, hora_entrada, hora_salida);
//                    } else {
//                        añadirHorario(fecha, hora_entrada, hora_salida);
//                    }

//                } else {
//                    mensajeHorasInicioFin();
//                }
//            } else {
//                if (parseInt(v_hora_entrada[0], 16) !== parseInt(v_hora_salida[0], 16)) {
//                    if (tipo == "M") {
//                        modificarHorario(fecha, hora_entrada, hora_salida);
//                    } else {
//                        añadirHorario(fecha, hora_entrada, hora_salida);
//                    }
//                } else {
//                    mensajeHorasInicioFin();
//                }
//            }
            
//        }
//        else {
//            if (v_hora_entrada_id[1] == "AM" && v_hora_salida_id[1] == "PM") {
//                if (tipo == "M") {
//                    modificarHorario(fecha, hora_entrada, hora_salida);
//                } else {
//                    añadirHorario(fecha, hora_entrada, hora_salida);
//                }
//            } else {
//                mensajeSeleccionIncorrecta();
//            }
//        }
//    }
//}

function mensajeHorasInicioFin() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-info w3-hover-text-blue m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: 'Operación Cancelada',
        text: "El horario de salida para la fecha " + $("#cphMaster_txtFechaAtencion").val() + " debe ser posterior al horario de entrada.",
        type: 'info',
        timer: 5000,
        showConfirmButton: true,
        footer: "© " + año + " Copyright FIMA"
    });
}

function mensajeSeleccionIncorrecta() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-info w3-hover-text-blue m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: 'Operación Cancelada',
        text: "Verifique las siglas de los horarios seleccionados (AM,PM).",
        type: 'info',
        timer: 5000,
        showConfirmButton: true,
        footer: "© " + año + " Copyright FIMA"
    });
}

function mensajeHorarioExisteBD() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-danger w3-hover-text-red m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: 'Operación Cancelada',
        text: "El horario que intenta asignar para el médico " + document.getElementById("spanMedico").innerHTML + " ya se encuentra creado. Por favor ingrese otro.",
        type: 'error',
        timer: 6000,
        showConfirmButton: true,
        footer: "© " + año + " Copyright FIMA"
    });
}

function mensajeHorarioExisteTabla() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-info w3-hover-text-blue m-1 w-25'
        },
        buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
        title: 'Operación Cancelada',
        text: "El horario que intenta asignar para el médico " + document.getElementById("spanMedico").innerHTML + " ya se encuntra en la lista de horarios.",
        type: 'info',
        timer: 6000,
        showConfirmButton: true,
        footer: "© " + año + " Copyright FIMA"
    });
}

function añadirHorario(fecha, hora_entrada, hora_salida) {
    var band = 0;
    var cant = horariosBD.rows().count();
    var i = 0;
    while (band === 0 && i < cant) {
        var row = horariosBD.row(i).data();
        if (row[2] == fecha) {
            band = 1;
        } else {
            i = i + 1;
        }
    }
    if (band === 0) {
        var count = horarios.rows().count();
        var j = 0;
        while (band === 0 && j < count) {
            var item = horarios.row(j).data();
            if (item[0] == fecha) {
                band = 1;
            } else {
                j = j + 1;
            }
        }
        if (band === 0) {
            horarios.row.add([
                fecha,
                hora_entrada,
                hora_salida,
                '<button  type="button" title="Modificar" id="' + fecha + '" class="btn btn-primary btn-modificar-horario  w3-hover-text-blue w3-hover-white"><i class="fa fa-edit" aria-hidden="true"></i></button>',
                '<button  type="button" id="' + fecha + '" title="Eliminar" class="btn btn-danger btn-eliminar-horario  w3-hover-text-red w3-hover-white"><i class="fa fa-trash" aria-hidden="true"></i></button>'
            ]).draw();
            cerrarModalHorarios();
        } else {
            mensajeHorarioExisteTabla();
        }
    } else {
        mensajeHorarioExisteBD();
    }

}

function modificarHorario(fecha, hora_inicio, hora_fin) {
    var id = $('#cphMaster_hfFechaModificar').val();
    var cant = horarios.rows().count();
    var band = 0;
    var i = 0;
    while (i < cant && band === 0) {
        var row = horarios.row(i).data();
        if (id == row[0]) {
            horarios.cell(i, 0).data(fecha);
            horarios.cell(i, 1).data(hora_inicio);
            horarios.cell(i, 2).data(hora_fin);
            band = 1;
        } else {
            i = i + 1;
        }
    }

    cerrarModalHorarios();

}

function obtenerListaHorariosMedico(id) {
    var obj = JSON.stringify({ id_medico: id });
    $.ajax({
        type: "POST",
        url: "Crear_Horarios.aspx/ListarHorariosMedico",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            añadirFilasTablaHorariosBD(data.d);
        }
    });
}


function añadirFilasTablaHorariosBD(data) {

    horariosBD = $("#ListaHorariosBD").DataTable({
        "paging": true,
        "retrieve": true,
        "responsive": true,
        "autoWidth": false,
        "columns": [
            null,
            null,
            null,
            null,
            null
        ],
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ horarios",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún horario registrado en el sistema",
            "sInfo": "Mostrando un total de _TOTAL_ medicos",
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
    horariosBD.clear().draw();
    for (var i = 0; i < data.length; i++) {
        horariosBD.row.add([
            data[i].medico.id_medico,
            data[i].id_horario,
            data[i].fecha_atencion,
            data[i].hora_inicio,
            data[i].hora_fin
        ]).draw();
    }
}

$('#modalHorariosAtencion').on('hidden.bs.modal', function (e) {
    document.getElementById("fmCrearHorarios").className = "needs-validation";
    document.getElementById("modificar").style.display = "none";
    document.getElementById("añadir").style.display = "block";
    document.getElementById("btnModificarHorario").style.display = "none";
    document.getElementById("btnAñadirHorario").style.display = "block";
    limpiarCamposCrearHorarios();
});

function limpiarCamposCrearHorarios() {
    $("#cphMaster_hfFechaModificar").val("");
    $("#cphMaster_txtFechaAtencion").val("");
    $("#cphMaster_txtHoraAtencionEntrada").val("");
    $("#cphMaster_txtHoraAtencionSalida").val("");
}

function volverPasoUno() {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-light border-warning m-1 w-25',
            cancelButton: 'btn btn-light border-warning m-1 w-25'
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: 'ATENCION',
        text: "Volver a seleccionar médico, borrara todas aquellos horarios creados para el médico " + document.getElementById("spanMedico").innerHTML + " ¿Esta seguro?",
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'No',
        footer: "© " + año + " Copyright FIMA",
        cancelButtonText: 'Si',
        reverseButtons: true
    }).then((result) => {
        if (!result.value) {
            document.getElementById("nav-definirHorarios-tab").className = "nav-item nav-link border border-bottom-0 text-secondary bg-white disabled";
            document.getElementById("nav-seleccionarMedico-tab").className = "nav-item nav-link border border-bottom-0 w3-text-white w3-pink";
            horarios.clear().draw();
            $('#nav-seleccionarMedico-tab').tab('show');
        }
    });
}

function irPasoTres() {
    var cant = horarios.rows().count();
    if (cant !== 0) {
        for (var i = 0; i < cant; i++) {
            var row = horarios.row(i).data();
            resumen.row.add([
                row[0],
                row[1],
                row[2]
            ]).draw();
        }
        document.getElementById("spanMedicoResumen").innerHTML = document.getElementById("spanMedico").innerHTML;
        document.getElementById("fechaDia").innerHTML = fecha_dia;
        document.getElementById("spanEspecialidadResumen").innerHTML = document.getElementById("spanEspecialidad").innerHTML;
        document.getElementById("nav-definirHorarios-tab").className = "nav-item nav-link border border-bottom-0 text-secondary bg-white disabled";
        document.getElementById("nav-registrarHorarios-tab").className = "nav-item nav-link border border-bottom-0 w3-text-white w3-pink";
        $("#nav-registrarHorarios-tab").tab('show');
    }
    else {
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-light border-info w3-hover-text-blue m-1 w-25'
            },
            buttonsStyling: false
        });
        swalWithBootstrapButtons.fire({
            title: 'Operación Cancelada',
            text: "Por favor añada al menos un horario de atención.",
            type: 'info',
            timer: 6000,
            showConfirmButton: true,
            footer: "© " + año + " Copyright FIMA"
        });
    }
}

function volverPasoDos() {
    document.getElementById("nav-registrarHorarios-tab").className = "nav-item nav-link border border-bottom-0 text-secondary bg-white disabled";
    document.getElementById("nav-definirHorarios-tab").className = "nav-item nav-link border border-bottom-0 w3-text-white w3-pink";
    $("#nav-definirHorarios-tab").tab('show');
    resumen.clear().draw();
    document.getElementById("spanMedicoResumen").innerHTML = "";
    document.getElementById("fechaDia").innerHTML = "";
    document.getElementById("spanEspecialidadResumen").innerHTML = "";
}

function RegistrarHorariosAtencion() {
    var horariosMedico = [];
    var idMedico = $("#cphMaster_hfIdMedicoRegistrarHorarios").val();
    var c = 0;
    var cant = resumen.rows().count();
    for (var i = 0; i < cant; i++) {
        var row = resumen.row(i).data();
        var fecha = row[0].split('/');
        fecha = fecha[2] + "-" + fecha[1] + "-" + fecha[0];
        horariosMedico[c] = fecha;
        c = c + 1;
        horariosMedico[c] = row[1];
        c = c + 1;
        horariosMedico[c] = row[2];
        c = c + 1;
    }
    insertarHorarios(idMedico, horariosMedico);
}

function insertarHorarios(idMedico, horariosMedico) {
    var obj = JSON.stringify({ idMedico: idMedico, horariosMedico: horariosMedico });
    $.ajax({
        type: "POST",
        url: "Crear_Horarios.aspx/RegistrarHorariosAtencion",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + "\n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (respose) {
            if (respose) {
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-light border-success w3-hover-text-green m-1 w-25'
                    },
                    buttonsStyling: false
                });
                swalWithBootstrapButtons.fire({
                    title: 'Operación Confirmada',
                    text: "Los horarios de atención se han registrado correctamente.",
                    type: 'success',
                    timer: 5000,
                    showConfirmButton: true,
                    footer: "© " + año + " Copyright FIMA"
                }).then((result) => {
                    if (result.value) {
                        window.location.href = "Crear_Horarios.aspx";
                    }
                });

            } else {
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-light border-danger w3-hover-text-red m-1 w-25'
                    },
                    buttonsStyling: false
                });
                swalWithBootstrapButtons.fire({
                    title: 'Operación Rechazada',
                    text: "No se han podido registrar los horarios de atención, horarios en anterioridad ya registrados.",
                    type: 'error',
                    timer: 5000,
                    showConfirmButton: true,
                    footer: "© " + año + " Copyright FIMA"
                });
            }
        }
    });
}