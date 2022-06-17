﻿var path = ruta;

$('.btnCloseSession').on('click', function () {
    $.ajax({
        type: "POST",
        url: path + '/Home/cerrar_sesion',
        accept: 'application/json',
        beforeSend: function () {

        },
        success: function (data) {
            if (data == 'OK') {
                //console.log('sesion cerrada');
                window.location.href = path + '/Login';
            } else {
                //console.log(data);
            }
        }
    });
})

function build_menu_admin() {

    $.ajax({
        type: "POST",
        url: path + '/Home/validar_menu',
        //data: { "id_usuario": id_usuario, "usuario": usuario },
        accept: 'application/json',
        success: function (response_json) {

            //var response_json = JSON.parse(response);

            if (response_json.estado != 'OK' && response_json.data[0].validacion != "OK") {
                //show_toast('warning', response_json.descripcion);
                alerta(response_json.descripcion, 'info');
                return;
            }

            var old_cat = '';
            var icon = '';
            var menu = '';

            var lista_menu = response_json.data;

            if (lista_menu.length > 0) {
                var ID_TIPO_MENU = 1; // 1(un nivel) - 2(dos niveles)

                if (ID_TIPO_MENU == 1) {
                    for (var i = 0; i < lista_menu.length; i++) {
                        menu += "<li>";
                        menu += "<a class='waves-effect waves-dark' href='" + lista_menu[i].ruta_opcion + "' aria-expanded='false'><i class='" + lista_menu[i].icono + "'></i><span class='hide-menu'>" + lista_menu[i].nombre_opcion + "</span></a>";
                        menu += '</li>';
                    }
                }
                else
                if (ID_TIPO_MENU == 2) {
                    for (var i = 0; i < lista_menu.length; i++) {

                        if (old_cat != lista_menu[i].nombre_categoria) {
                            if (old_cat != '') {
                                menu = menu + "</ul>";
                                menu = menu + "</li>";
                            }
                            icon = lista_menu[i].icono;

                            menu = menu + "<li>";
                            menu = menu + "<a class='has-arrow waves-effect waves-dark' href='#' aria-expanded='false'><i class='" + icon + "'></i><span class='hide-menu'>" + lista_menu[i].nombre_categoria + "</span></a>";

                            old_cat = lista_menu[i].nombre_categoria;
                            menu = menu + "<ul aria-expanded='false' class='collapse'>";

                        }
                        menu = menu + "<li><a href='" + lista_menu[i].ruta_opcion + "'>" + lista_menu[i].nombre_opcion + "</a></li>";
                    }
                    menu = menu + "</ul>";
                    menu = menu + "</li>";
                }
                alert('aaa');
                $('#sidebarnav').append(menu);
                $('#sidebarnav').metisMenu();
            }
        },
        error: function (xhr, status, error) {
            var error_especifico = eval("(" + xhr.responseText + ")");
            var error_mostrar = '';
            if (xhr.status === 0) {
                error_mostrar = ('Verificar conexión a internet - ' + error_especifico.Message);
            } else if (xhr.status == 404) {
                error_mostrar = ('URL solicitada no encontrada [Error 404] - ' + error_especifico.Message);
            } else if (xhr.status == 500) {
                error_mostrar = ('Error interno del servidor [Error 500] - ' + error_especifico.Message);
            } else if (status === 'parsererror') {
                error_mostrar = ('JSON solicitado falló - ' + error_especifico.Message);
            } else if (status === 'timeout') {
                error_mostrar = ('Error en tiempo de espera - ' + error_especifico.Message);
            } else if (status === 'abort') {
                error_mostrar = ('Solicitud Ajax abortada - ' + error_especifico.Message);
            } else {
                error_mostrar = ('Error desconocido: - ' + error_especifico.Message);
            }
            //show_toast('error', error_mostrar);
            console.log(error_mostrar);
        }
    });
}

function build_menu_cliente() {
    var menu_ = '';

    menu_ += '<li>';
    menu_ += '<a class="waves-effect waves-dark" href="Home" aria-expanded="false"><i class="mdi mdi-gauge"></i><span class="hide-menu">Inicio</span></a>';
    menu_ += '</li>';

    menu_ += '<li>';
    menu_ += '<a class="waves-effect waves-dark" href="Atencion" aria-expanded="false"><i class="mdi mdi-gauge"></i><span class="hide-menu">Atención al cliente</span></a>';
    menu_ += '</li>';

    menu_ += '<li>';
    menu_ += '<a class="waves-effect waves-dark" href="RegistroCitas" aria-expanded="false"><i class="mdi mdi-gauge"></i><span class="hide-menu">Registro de citas</span></a>';
    menu_ += '</li>';

    $('#sidebarnav').append(menu_);
    $('#sidebarnav').metisMenu();
}

/*
 0 - NO CLIENTE
 1 - ADMIN
 2 - CLIENTE
 */
if (id_tipousuario == 1) {
    $('#ChatButton').addClass('hide-element');
    build_menu_admin();
} else if (id_tipousuario == 2 || id_tipousuario == 0) {
    build_menu_cliente();

    $('.carousel').carousel({
        interval: 300000
    });
}

function validar_flag_chat() {
    $.ajax({
        type: "GET",
        url: path + '/Home/validar_flag_chat',
        accept: 'application/json',
        success: function (data) {
            /*
            -1 = error
             0 = deshabilitado
             1 = habilitado
            */

            if (data == -1) {
                //alert('Ocurrió un error');
                return
            }

            if (data == 1) {
                $('#mdl_saludo_chatbot').modal('show');
            }
        }
    });
}

setTimeout(function () {
    /*
    0 = no cliente
    1 = admin
    2 = cliente
    */
    if (id_tipousuario == 0 || id_tipousuario == 2) {
        validar_flag_chat();
    } else if (id_tipousuario == 1) {
        $('#buscador').addClass('hide-element');
        $('#mdl_ChatButton, #WAButton').addClass('hide-element');
    }
}, 1000);


function respuesta_saludo_chat(respuesta) {
    $.ajax({
        type: "GET",
        url: path + '/Home/deshabilitar_flag_chat',
        accept: 'application/json',
        beforeSend: function () {

        },
        success: function (data) {
            if (data != 'OK') {
                console.log(data);
                return;
            }

            $('#footer_mdl_bienvenida').addClass('hide-element');
            $('#body_mdl_bienvenida').html('');

            if (respuesta == 'SI') {
                $('#body_mdl_bienvenida').append('<p><br/>¡Genial! Te redireccionaré al chat para resolver tus consultas.</p><p>Recuerda que en cualquier momento puedes encontrarme en el ícono de la esquina inferior izquierda</p>');

                setTimeout(function () {
                    $('#mdl_saludo_chatbot').modal('hide');
                    $('#mdl_chat').modal('show');
                    $('#ChatButton').addClass('hide-element');
                }, 5000);
            } else if (respuesta == 'NO') {
                $('#img_modal_bienvenida').attr('src', path + "/images/sad_chatbot.png");
                $('#body_mdl_bienvenida').append('<br/><p>¡Para otra ocasión será!</p><p>Recuerda que en cualquier momento puedes encontrarme en el ícono de la esquina inferior izquierda</p>');

                setTimeout(function () {
                    $('#mdl_saludo_chatbot').modal('hide');
                }, 5000);
            }
        }
    });
}

function registrar_punto_visitado(punto) {
    $.ajax({
        type: "POST",
        url: path + '/Home/registrar_punto_visitado',
        data: { "id_tipousuario": id_tipousuario, "punto_visitado": punto },
        accept: 'application/json',
        success: function (data) {
            if (data != 'OK') {
                console.log(data);
                return;
            }
        }
    });
}

function registrar_puntuacion(puntuacion) {
    $.ajax({
        type: "POST",
        url: path + '/Home/registrar_puntuacion',
        data: { "id_usuario": id_usuario, "puntuacion": puntuacion },
        accept: 'application/json',
        beforeSend: function () {
            $('.preloader').removeAttr('style');
            $('.preloader').removeClass('hide-element');
        },
        success: function (data) {
            $('.preloader').addClass('hide-element');

            if (data.toString() != '"OK"') {
                alerta(data, 'warning');
                return;
            } else {
                validar_flujo_existente_();
                $('#mdl_encuesta').modal('hide');
                $('#ChatButton').removeClass('hide-element');
                alerta('Encuesta registrada', 'success');
            }
        }
    });
}

function validar_flujo_existente_() {
    $.ajax({
        type: "GET",
        url: path + '/Flujo/validar_flujo_actual',
        accept: 'application/json',
        data: { 'id_ticket': 0, 'codigo': '', 'id_usuario': id_usuario, 'estado': '' },
        beforeSend: function () {
            $('#card_chat').html('');
        },
        success: function (response) {

            if (response.length > 0) {
                var i = response.length;
                var j = 0;
                for (var flujo of response) {
                    j++;
                    var mensaje = flujo.contenido_html;
                    $('#card_chat').append(mensaje);

                    if (i == j) {
                        if ((flujo.contenido_texto == 'Gracias! Por su preferencia' || flujo.contenido_texto.includes('ticket de seguimiento')) && flujo.remitente == 'bot') {
                            mostrar_encuesta();
                        }
                    }
                }
            } else {
                append_msg('Hola, ¿cómo puedo ayudarte?', 'bot', 'text', '');
            }

        }
    });
}

/* AUTOCOMPLETE BUSCADOR ARTICULOS */
//$(function () {
function cargar_lista_articulos() {
    var availableTags = [];

    $.ajax({
        type: "GET",
        url: path + '/Home/listar_articulos',
        accept: 'application/json',
        beforeSend: function () {
            availableTags = [];
        },
        success: function (data) {

            for (var nombre of data) {
                var nombre_;
                nombre_ = nombre.split('_').join(' ');
                availableTags.push(nombre_);
            }

            $("#txt_buscar_articulo").autocomplete({
                source: availableTags
            });

            $('#txt_buscar_articulo').keydown(function (e) {
                if (e.keyCode == 13) {
                    var valor = $(this).val();
                    if (valor == '') {
                        alerta('Seleccione una opción válida', 'info');
                        return false;
                    }
                    else {
                        if (availableTags.includes(valor)) {
                            $(this).val('');

                            $('#mdl_articulo').find('.modal-title').html(valor);
                            $('#div_articulo').html('').load(path + '/articulos/' + valor.split(' ').join('_') + '.html');
                            $('#mdl_articulo').modal('show');

                            return false;
                        } else {
                            alerta('El artículo seleccionado es incorrecto', 'info');
                            return false;
                        }
                    }
                }
            });
        }
    });
    //});
}
if (id_tipousuario != 1) {
    cargar_lista_articulos();
}

function abrir_buscador() {
    $('#txt_buscar_articulo').focus();
}

var hcf;
$(document).ready(function () {
    hcf = $('.page-wrapper').height();
    $('.img_carousel').attr('style', 'height: ' + (parseInt(hcf) - 100).toString() + 'px;');

    $(window).resize(function () {
        hcf = $('.page-wrapper').height();
        $('.img_carousel').attr('style', 'height: ' + (parseInt(hcf) - 100).toString() + 'px;');
    })
})