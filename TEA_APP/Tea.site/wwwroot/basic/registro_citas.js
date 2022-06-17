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
        { 'tipo_marcacion': 'FERIADO', 'fecha_marcacion': '2022-05-28'}
    ];

    $("#my-calendar").zabuto_calendar({
        legend: []
    });
}
cargar_citas();

function cerrar_modal_cita() {
    $('#mdl_cita').modal('hide');
}

$('#dtpicker1').datetimepicker({
    format: 'hh:mm A'
});

function guardar_cita() {
    var fecha = $('#txtFecha').attr('data-fecha');
    var hora = $('#txtHora').val();

    alert('Reservar ' + fecha + ' a las ' + hora);
}

function validateHhMm(e) {
    var isValid = /^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$/.test(e.value);

    if (isValid) {
    } else {
        alert("El formato de hora ingresada es incorrecto.");
    }
}