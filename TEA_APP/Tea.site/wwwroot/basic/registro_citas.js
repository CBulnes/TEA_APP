var path = ruta;

var lista_marcaciones = [];

function cargar_citas() {
    //$.ajax({
    //    url: '/Asistencia/getMarcacionesDia?tipo=GENERAL',
    //    type: "GET",
    //    data: {},
    //    success: function (data) {
    //        lista_marcaciones = data;
    //    },
    //    error: function (response) {
    //        alertSecondary("Mensaje", "Ocurrió un error al obtener su registro de marcaciones.");
    //        lista_marcaciones = [];
    //    },
    //    complete: function () {
    //        $("#my-calendar").zabuto_calendar({
    //            legend: []
    //        });
    //        setTimeout(function () {
    //            cargar_vista_semanal('INIT');
    //        }, 500);
    //    }
    //});
    lista_marcaciones = [
        { 'estado': 'PENDIENTE', 'fecha_cita': '2022-08-15' }
    ];

    $("#my-calendar").zabuto_calendar({
        legend: []
    });
}
cargar_citas();

function cargar_lista_doctores() {
    var html = '';
    $.ajax({
        url: "/RegistroCitas/listar_doctores",
        type: "GET",
        data: {},
        async: false,
        beforeSend: function () {
            html += '<option value="-1">Seleccionar</option>';
        },
        success: function (data) {
            for (var item of data) {
                html += '<option value="' + item.id_usuario + '">' + item.nombres + '</option>';
            }
        },
        error: function (response) {
            html = '<option value="-1">Seleccionar</option>';
        },
        complete: function () {
            $('#cboDoctor').html(html);
        }
    });
}
cargar_lista_doctores();

function cerrar_modal_cita() {
    $('#mdl_cita').modal('hide');
}

$('#dtpicker1').datetimepicker({
    format: 'hh:00 A'
});

function guardar_cita() {
    var fecha = $('#txtFecha').attr('data-fecha');
    var hora = $('#txtHora').val();
    var doctor = $('#cboDoctor').val();

    if (hora == '') {
        /*alertSecondary("Mensaje", "Seleccione la hora para el registro de la cita.");*/
        alert("Seleccione la hora para el registro de la cita.");
        return;
    }

    if (doctor == '-1') {
        /*alertSecondary("Mensaje", "Seleccione el especialista.");*/
        alert("Seleccione el especialista.");
        return;
    }

    var data_ = {
        id_cita: 0,
        id_usuario: 0,
        estado_cita: 0,
        fecha_cita: fecha,
        hora_cita: hora,
        id_doctor_asignado: doctor
    };

    $.ajax({
        url: "/RegistroCitas/RegistrarCita",
        type: "POST", //(idRegistro > 0 ? "PUT" : "POST"),
        data: data_,
        success: function (data) {
            console.log(data);
            if (data.estado) {
                /*alertSuccess("Muy bien", "Cita guardada exitosamente.");*/
                alert("Cita guardada exitosamente.");
                //$("#load_data").hide();
                //recargarInstruccion();
                $('#txtHora').val('');
                $('#cboDoctor').val('-1');
                $('#mdl_cita').modal('hide');
            } else {
                /*alertWarning("Atención", data.message);*/
                alert(data.descripcion);
                //$("#load_data").hide();
            }
        },
        error: function (response) {
            /*alertWarning("Atención", "Ocurrió un error al guardar la cita.");*/
            aler("Ocurrió un error al guardar la cita.");
            //$("#load_data").hide();
        }
    });
}

function validateHhMm(e) {
    var isValid = /^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$/.test(e.value);

    if (isValid) {
    } else {
        alert("El formato de hora ingresada es incorrecto.");
    }
}

function disponibilidad_doctor() {    
    var fecha = $('#txtFecha').attr('data-fecha');
    var doctor = $('#cboDoctor').val();
    var html = '';

    $.ajax({
        url: "/RegistroCitas/DisponibilidadDoctor?id_doctor=" + doctor + "&fecha=" + fecha,
        type: "GET",
        data: null,
        beforeSend: function () {
            if (doctor == '-1') {
                $('#divDisponibilidad').html('<tr><td colspan="2" class="text-center">Seleccione un especialista</td></tr>');
            }
        },
        success: function (data) {
            if (data.length > 0) {
                for (item of data) {
                    var clase = item.estado == 'DISPONIBLE' ? 'item_disponible' : 'item_reservado';
                    var hora = item.estado == 'DISPONIBLE' ? item.hora_cita : '';
                    var accion = ' onclick="seleccionar_hora_disponible(this)" data-hora="' + hora + '"';
                    html += '<tr class="' + clase + '"' + accion + '><td class="text-center">' + item.hora_cita + '</td><td class="text-center">' + item.estado + '</td></tr>';
                }
            }
        },
        error: function (response) {
            $('#divDisponibilidad').html('<tr><td colspan="2" class="text-center">Seleccione un especialista</td></tr>');
        },
        complete: function () {
            if (doctor != '-1') {
                $('#divDisponibilidad').html(html);
            }
        }
    });
}

function seleccionar_hora_disponible(e) {
    var hora = $(e).attr('data-hora');

    if (hora == '') {
        alert("Ya hay una cita registrada en el horario seleccionado.");
        $('#txtHora').val('');
        return;
    } else {
        hora = hora.replace(' am', ' AM');
        hora = hora.replace(' pm', ' PM');
        $('#txtHora').val(hora);
    }
}