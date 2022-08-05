var path = ruta;
//var test = 2;
var msg_previo = '';

var _label = ''

$(document).ready(function () {
    $('#txtMessage').focus();
});

//var bot_img = path + "/images/bot.jpg";
//var person_img = path + "/images/me.jpg";
var bot_img = 'https://freesvg.org/img/1538298822.png';
var person_img = 'https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png';

$('#img_chat').attr('src', bot_img);

$('#ChatButton').on('click', function () {
    $('#mdl_chat').modal('show');
    scroll_chat();
    $(this).addClass('hide-element');
    $('#txtMessage').focus();
})

$('#btn_min_chat').on('click', function () {
    $('#mdl_chat').modal('hide');
    $('#ChatButton').removeClass('hide-element');
})

function get_current_time() {
    var d = new Date();
    var h = d.getHours();
    var m = d.getMinutes();

    if (h.toString().length == 1) {
        h = '0' + h.toString();
    }
    if (m.toString().length == 1) {
        m = '0' + m.toString();
    }

    return h + ':' + m;
}

function append_msg(msg, sender, type_source, list) {
    var content_prev = $('#card_chat').html();
    var content = '';
    var aditional_class = '';
    if (type_source == 'option') {
        aditional_class = 'invisible-element';
    }

    if (sender == 'bot') {
        //content = content + '<div class="d-flex justify-content-start mb-4">';
        //content = content + '<div class="img_cont_msg">';
        //content = content + '<img src="' + bot_img + '" class="rounded-circle user_img_msg ' + aditional_class + '">';
        //content = content + '</div>';

        if (type_source == 'option') {
            content += '<li style="margin-top: 10px;">';
        } else {
            content += '<li>';
        }
        
        content += '<div class="chat-img"><img src="' + bot_img + '" class="' + aditional_class + '"/></div>';
        content += '<div class="chat-content">';
        if (type_source == 'text') {
            content += '<div class="box bg-light-success">' + msg + '</div>';
            //content = content + '<div class="msg_container">';
            //content = content + msg;
            //content = content + '<span class="msg_time">' + get_current_time() + '</span>';
            //content = content + '</div>';
        } else if (type_source == 'image') {
            content = content + msg;
        } else if (type_source == 'option') {
            content = content + msg;
        } else if (type_source == 'options_title') {
            //content = content + '<div class="msg_container title_container">';
            //content = content + msg;
            //content = content + '</div>';
            content += '<div class="chat-content" style="margin-bottom: -10px;">';
            content += '<div class="box bg-light-success">' + msg + '</div>';
            content += '</div>';
        }

        //content = content + '</div>';
        content += '</div>';
        if (type_source != 'option') {
            content += '<div class="chat-time">' + get_current_time() + '</div>';
        }
        content += '</li>';
    } else if (sender == 'person') {
        // OLD_VERSION
        //content = content + '<div class="d-flex justify-content-end mb-4">';
        //content = content + '<div class="msg_container_send">';
        //content = content + msg;
        //content = content + '<span class="msg_time_send">' + get_current_time() + '</span>';
        //content = content + '</div>';
        //content = content + '<div class="img_cont_msg">';
        //content = content + '<img src="' + person_img + '" class="rounded-circle user_img_msg">';
        //content = content + '</div>';
        //content = content + '</div>';

        content += '<li class="reverse">';
        content += '<div class="chat-time">' + get_current_time() + '</div>';
        content += '<div class="chat-content">';
        content += '<div class="box bg-light-inverse">' + msg + '</div>';
        content += '</div>';
        content += '<div class="chat-img"><img src="' + person_img + '" /></div>';
        content += '</li>';
    }

    $('#card_chat').html('');
    $('#card_chat').append(content_prev + content);

    guardar_flujo(type_source, sender, type_source == 'image' ? '---' : (list == '' ? msg : list), content);

    if ((msg == 'Gracias! Por su preferencia' || msg.includes('ticket de seguimiento') || msg == 'En este momento procedo a llamar al Call Center') && sender == 'bot') {

        if (msg == 'En este momento procedo a llamar al Call Center') {
            alerta('Se procederá a llamar al Call Center', 'info');
            setTimeout(function () {
                alerta('Luego por favor calificar la encuesta', 'info');    
            }, 2500);
            setTimeout(function () {
                callNumber(call_center_invitado);
            }, 5000);
        } else {
            alerta('Responda a la siguiente encuesta por favor', 'info');
            setTimeout(function () {
                mostrar_encuesta();
            }, 6000);
        }

    }

    scroll_chat();
}

function scroll_chat() {
    setTimeout(function () {
        var href = $('#go').attr('href');
        window.location.href = href;
        $('#txtMessage').focus();
    }, 300);
}

function mostrar_encuesta() {
    $('#mdl_chat').modal('hide');
    $('#mdl_encuesta').modal('show');
    $('#mdl_saludo_chatbot').modal('hide');
    respuesta_saludo_chat('NO');
}

function guardar_flujo(tipo, remitente, contenido_texto, contenido_html) {
    $.ajax({
        type: "POST",
        url: path + "/Flujo/registrar_flujo",
        accept: 'application/json',
        data: {
            'id_flujo': 0,
            'id_usuario': id_usuario,
            'tipo': tipo,
            'remitente': remitente,
            'contenido_texto': contenido_texto,
            'contenido_html': contenido_html.toString(),
            'habilitado': 1
        },
        success: function (response) {
            console.log(response);
        }
    });
}

function validar_flujo_existente() {
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

                if (id_tipousuario == 0) {
                    var html_img = '';

                    html_img += '<li>';
                    html_img += '<div class="chat-img"><img src="https://freesvg.org/img/1538298822.png" class="invisible-element" /></div>';
                    html_img += '<div class="chat-content" style="display: inline-grid;">';
                    html_img += '<div class="box bg-success"><div class="row">';

                    html_img += '<div class="col-lg-4"><img class="img-responsive" src="' + path + '/images/planes.jpg" style="border-radius: 7px; cursor: pointer;" onclick="cargar_documento(\'Planes_vigentes\')" /></div>';
                    html_img += '<div class="col-lg-4"><img class="img-responsive" src="' + path + '/images/portabilidad.jpg" style="border-radius: 7px; cursor: pointer;" onclick="cargar_documento(\'Portabilidad\')" /></div>';
                    html_img += '<div class="col-lg-4"><img class="img-responsive" src="' + path + '/images/promociones.jpg" style="border-radius: 7px; cursor: pointer;" onclick="cargar_documento(\'Promociones\')" /></div>';

                    html_img += '</div></div>';
                    html_img += '</div>';
                    html_img += '</li>';

                    $('#card_chat').append(html_img);
                    scroll_chat();
                }
            } else {
                append_msg('Hola, ¿cómo puedo ayudarte?', 'bot', 'text', '');
            }

        }
    });
}
if (id_tipousuario == 2 || id_tipousuario == 0) { //cliente - invitado
    validar_flujo_existente();
}

function cargar_documento(valor) {
    $('#mdl_articulo').find('.modal-title').html(valor.split('_').join(' '));
    $('#div_articulo').html('').load(path + '/articulos/' + valor + '.html');
    $('#mdl_articulo').modal('show');
}

$("#txtMessage").on('keyup', function (e) {
    if (e.key === 'Enter' || e.keyCode === 13) {
        /**/
        if (recognizing == true) {
            recognition.stop();
            recognizing = false;
            document.getElementById("btn_speak").innerHTML = '<i class="fa fa-stop" style="font-size: 20px;"></i>';
        }
        /**/
        enviar_consulta();
    }
});

function redirect_message(texto, label) {

    if (texto == 'SiEnchufado' || texto == 'Luz' || texto == 'LaptoRouter' || texto == 'Confirm' || texto == 'NoCable' || texto == 'SiCable' || texto == 'Nointernet' || texto == 'Siinternet' || texto == 'si_otra_consulta' || texto == 'ninguna_consulta') {
        _label = texto;
        texto = label;
    }

    $('#txtMessage').val(texto);

    enviar_consulta();
}

$('#div_send').on('click', function () {
    /**/
    if (recognizing == true) {
        recognition.stop();
        recognizing = false;
        document.getElementById("btn_speak").innerHTML = '<i class="fa fa-stop"></i>';
    }
    /**/
    enviar_consulta();
});

$('#div_speak').on('click', function () {
    //$('#card_chat').html('');
    //append_msg('Hola, ¿cómo puedo ayudarte?', 'bot', 'text', '');
    procesar();
});

$('#div_close_session').on('click', function () {
    $.ajax({
        type: "POST",
        url: path + "/Home/inactivar_sesion",
        accept: 'application/json',
        beforeSend: function () {

        },
        success: function (data) {
            if (data == 'OK') {
                console.log('sesion cerrada');
                window.location.href = path + '/Login';
            } else {
                console.log(data);
            }
        }
    });
});

function enviar_consulta() {
    var msg = $('#txtMessage').val().trim();

    if (msg.toUpperCase().includes('CALL CENTER') || msg.toUpperCase().includes('CALL-CENTER')) {
        append_msg(msg, 'person', 'text', '');

        $('#txtMessage').val('');
        show_previews_dots();
        append_msg('En este momento procedo a llamar al Call Center', 'bot', 'text', '')
        $('.dots_container_').parent().remove();
        return;
    }

    if (msg.indexOf('documento') !== -1 && id_tipousuario == 2) {
        $('#txtMessage').val('');
        show_previews_dots();
        append_msg(msg, 'person', 'text', '');
        $('.dots_container_').parent().remove();
        //append_msg('Selecciona tu tipo de documento', 'bot', 'text', '');
        //return;

        var generic = [
            {
                "title": "Seleccione su tipo de documento",
                "options": [
                    {
                        "label": "DNI",
                        "value": {
                            "input": {
                                "text": "DNI"
                            }
                        }
                    },
                    {
                        "label": "CARNET DE EXTRANJERÍA",
                        "value": {
                            "input": {
                                "text": "CARNET DE EXTRANJERÍA"
                            }
                        }
                    }
                ],
                "response_type": "option"
            }
        ];

        get_generic_elements(generic);
        return;
    }

    if (msg.toUpperCase() == 'GRACIAS' || msg.toUpperCase() == 'MUCHAS GRACIAS') {
        append_msg(msg, 'person', 'text', '');

        $('#txtMessage').val('');
        show_previews_dots();
        $('.dots_container_').parent().remove();

        var generic = [
            {
                "title": "¿Tienes alguna consulta adicional?",
                "options": [
                    {
                        "label": "SI",
                        "value": {
                            "input": {
                                "text": "si_otra_consulta"
                            }
                        }
                    },
                    {
                        "label": "NINGUNA",
                        "value": {
                            "input": {
                                "text": "ninguna_consulta"
                            }
                        }
                    }
                ],
                "response_type": "option"
            }
        ];

        get_generic_elements(generic);
        return;
    }

    if ((msg == 'DNI' || msg == 'dni' || msg == 'CARNET DE EXTRANJERIA' || msg == 'carnet de extranjeria' || msg == 'CARNET DE EXTRANJERÍA' || msg == 'carnet de extranjería') && id_tipousuario == 2) {
        $('#txtMessage').val('');
        show_previews_dots();
        append_msg(msg, 'person', 'text', '');
        $('.dots_container_').parent().remove();

        if (msg == tipo_documento) {
            msg_previo = 'Tipo de documento correcto, ingrese el número de documento';
            append_msg(msg_previo, 'bot', 'text', '');
            $('#txtMessage').focus();
        } else {
            var generic = [
                {
                    "title": "El tipo de documento seleccionado es incorrecto.<br/>Seleccione su tipo de documento",
                    "options": [
                        {
                            "label": "DNI",
                            "value": {
                                "input": {
                                    "text": "DNI"
                                }
                            }
                        },
                        {
                            "label": "CARNET EXTRANJERIA",
                            "value": {
                                "input": {
                                    "text": "CARNET EXTRANJERIA"
                                }
                            }
                        }
                    ],
                    "response_type": "option"
                }
            ];

            get_generic_elements(generic);
        }
        return;
    }

    if (msg_previo == 'Tipo de documento correcto, ingrese el número de documento' || msg_previo == 'Número de documento incorrecto, vuelva a ingresarlo') {
        $('#txtMessage').val('');
        show_previews_dots();
        append_msg(msg, 'person', 'text', '');
        $('.dots_container_').parent().remove();

        if (msg == num_documento) {
            var generic = [
                {
                    "title": "Sus servicios asociados son:",
                    "options": [
                        //{
                        //    "label": "PLAN HOGAR",
                        //    "value": {
                        //        "input": {
                        //            "text": "PLAN HOGAR"
                        //        }
                        //    }
                        //},
                        //{
                        //    "label": "POSTPAGO",
                        //    "value": {
                        //        "input": {
                        //            "text": "POSTPAGO"
                        //        }
                        //    }
                        //},
                        {
                            "label": "VER RECIBOS",
                            "value": {
                                "input": {
                                    "text": "VER RECIBOS"
                                }
                            }
                        }
                    ],
                    "response_type": "option"
                }
            ];
            msg_previo = 'ver recibos';
            get_generic_elements(generic);
        } else {
            append_msg('Número de documento incorrecto, vuelva a ingresarlo', 'bot', 'text', '');
        }
        return;
    }

    if (msg_previo == 'ver recibos') {
        $('#txtMessage').val('');
        show_previews_dots();
        append_msg(msg, 'person', 'text', '');
        $('.dots_container_').parent().remove();

        if (msg == 'VER RECIBOS') {
            append_msg('Cargando recibos...', 'bot', 'text', '');
            msg_previo = '';
            listar_recibos();
        }
        return;
    }

    if (_label == 'ninguna_consulta') {
        append_msg('No tengo otra consulta', 'person', 'text', '');
        $('#txtMessage').val('');
        show_previews_dots();
        $('.dots_container_').parent().remove();
        append_msg('Gracias! Por su preferencia', 'bot', 'text', '');
        _label = '';
        return;
    }

    if (_label == 'si_otra_consulta') {
        append_msg('Tengo otra consulta', 'person', 'text', '');
        $('#txtMessage').val('');
        show_previews_dots();
        $('.dots_container_').parent().remove();
        append_msg('¿Cuál es tu consulta?', 'bot', 'text', '');
        _label = '';
        return;
    }

    var mensaje_enviar = _label == '' ? msg : _label;

    if (msg != '') {
        $.ajax({
            type: "POST",
            url: path + '/Home/send_message',
            data: { "message": mensaje_enviar },
            accept: 'application/json',
            beforeSend: function () {
                $('#txtMessage').val('');

                append_msg(msg, 'person', 'text', '');

                show_previews_dots();

                _label == '';
            },
            success: function (response) {
                console.log('aca: ' +  response);

                $('.dots_container_').parent().remove();

                if (response.error) {
                    if (response.error == 'Session') {
                        window.location.href = path + '/Login';
                    } else {
                        append_msg('Ocurrió un error al procesar su petición', 'bot', 'text', '');
                    }
                } else {
                    var data = JSON.parse(response);
                    if (data.output.generic.length == 0) {
                        append_msg('Ingrese una opcion válida por favor', 'bot', 'text', '');
                    } else {
                        get_generic_elements(data.output.generic);
                    }
                }
            },
            complete: function (data) {
                setTimeout(function () {
                    var myDiv = document.getElementById("card_chat");
                    myDiv.scrollTop = myDiv.scrollHeight;
                }, 100);
            }
        });
    }
}

function show_previews_dots() {
    var content = $('#card_chat').html();

    content += '<li>';
    content += '<div class="chat-img dots_container_"><img src="' + bot_img + '"/></div>';
    //content = content + '<div class="d-flex justify-content-start mb-4">';
    //content = content + '<div class="img_cont_msg">';
    //content = content + '<img src="' + bot_img + '" class="rounded-circle user_img_msg">';
    //content = content + '</div>';

    if ('type_source' != 'text') {
        //content = content + '<div class="msg_container dots_container"><div class="stage"><div class="dot-elastic"></div></div></div>';
        content += '<div class="chat-content">';
        content += '<div class="box bg-light-success">' + '<div class="stage"><div class="dot-elastic"></div></div>' + '</div>';
        content += '</div>';
    }

    //content = content + '</div>';
    content += '</li>';

    $('#card_chat').html('');
    $('#card_chat').append(content);

    scroll_chat();
}

function get_generic_elements(obj_generic) {
    for (var i = 0; i < obj_generic.length; i++) {

        if (obj_generic[i].response_type) {
            var res_type = obj_generic[i].response_type;

            if (res_type == 'text') {
                text_type_obj(obj_generic[i], res_type);
            }
            else
            if (res_type == 'pause') {
                pause_type_obj(obj_generic[i], res_type);
            }
            else
            if (res_type == 'image') {
                image_type_obj(obj_generic[i], res_type);
            }
            else
            if (res_type == 'option') {
                option_type_obj(obj_generic[i], res_type);
            }
            else {
                append_msg('El servicio de Chatbot no responde. Vuelva a intentarlo', 'bot', 'text', '');
            }
        }
    }
}

function text_type_obj(obj_text, type) {
    var text = obj_text.text;

    if (text == 'Se enviara un técnico a su domicilio para revisar el equipo\n' || text == 'Se enviará un técnico a su domicilio para revisar el equipo\n' ||
        text == 'Se enviara un técnico a su zona para revisar las conexiones\n\n' || text == 'Se enviará un técnico a su zona para revisar las conexiones\n\n') {

        $.ajax({
            type: "POST",
            url: path + '/Ticket/registrar_ticket',
            accept: 'application/json',
            data: { 'id_ticket': 0, 'codigo': '', 'id_usuario': id_usuario, 'estado': 'PENDIENTE' },
            success: function (response) {
                console.log(response);
                if (response.codigo != 'ERROR') {
                    text = text.split('\n').join('') + '.<br/>Su ticket de seguimiento es: <b>' + response.codigo + '</b>';
                }
                append_msg(text, 'bot', type, '');
            }
        });
    } else {
        append_msg(text, 'bot', type, '');
    }
}

function pause_type_obj(obj_pause, type) {
    //var typing = obj_pause.typing;
    //var time = obj_pause.time;

    //setTimeout(function () { alert('Alert after ' + time + ' ms, typing: ' + typing); }, time);
}

function image_type_obj(obj_img, type) {
    var title = obj_img.title;
    var source = obj_img.source;

    var img = '<div class=" msg_container">' + title + '<br/><img src="' + source + '" />' + '</div>';

    append_msg(img, 'bot', type, '');
}

function option_type_obj(obj_option, type) {
    var title = obj_option.title;

    if (obj_option.options.length == 0) {
        //alert('No hay opciones para mostrar');
    } else {
        var options = obj_option.options;
        var title = obj_option.title;
        append_msg(title, 'bot', 'options_title', '');

        setTimeout(function () {
            var option_list = '';
            var list = [];
            for (var i = 0; i < options.length; i++) {
                var label = options[i].label;
                var text = options[i].value.input.text;

                if (i == 0) {
                    option_list += '<div class="chat-content chat-option" onclick="redirect_message(\'' + text + '\',\'' + label + '\')">';
                    option_list += '<div class="box bg-light-info">' + label + '</div>';
                    option_list += '</div>';
                    //option_list = option_list + '<div class="text_search msg_container option_container" onclick="redirect_message(\'' + text + '\',\'' + label + '\')">' + label;
                    //option_list = option_list + '<span class="msg_time">' + get_current_time() + '</span>';
                    //option_list = option_list + '</div>';
                } else {
                    option_list += '<div class="chat-content chat-option" onclick="redirect_message(\'' + text + '\',\'' + label + '\')">';
                    option_list += '<div class="box bg-light-info">' + label + '</div>';
                    option_list += '</div>';
                    //option_list = option_list + '<div class="text_search msg_container option_container" onclick="redirect_message(\'' + text + '\',\'' + label + '\')">' + label + '</div>';
                }
                list.push(label);
            }
            append_msg(option_list, 'bot', type, list.toString());
        }, 500);
    }
}

if (!detectMob()) {
    //$('#div_speak').addClass('hide-element');
}

function listar_recibos() {
    $.ajax({
        type: "GET",
        url: path + '/Home/listar_archivos',
        accept: 'application/json',
        beforeSend: function(){
            $('#preloader').removeAttr('style');
            $('#preloader').removeClass('hide-element');
        },
        success: function (response) {
            if (response.estado != 'OK') {
                alerta(response.descripcion, 'info');
                $('#preloader').addClass('hide-element');
                return;
            }

            var _html = '';
            if (response.data.length == 0) {
                _html += '<p>No hay archivos para mostrar</p>';
            } else {
                _html += '<table class="tablesaw table-striped table-hover table-bordered table tablesaw-columntoggle">';
                _html += '<thead><tr><th>#</th><th>RECIBO</th><th>VER</th></tr></thead>';
                _html += '<tbody>';
                for (var archivo of response.data) {
                    var _ruta = path + archivo.ruta;
                    if (archivo.orden == 1) {
                        $('#frame_archivo').attr('src', _ruta);
                    }
                    _html += '<tr><td>' + archivo.orden + '</td><td>' + archivo.nombre + '</td><td><button class="btn btn-primary main_color" onclick="ver_recibo(\'' + _ruta + '\')">VER&nbsp;RECIBO</button></td></tr>';
                }
                _html += '</tbody>';
                _html += '</table>';
            }

            $('#div_lista_archivos').html('').append(_html);            
            $('#mdl_archivos').modal('show');
            $('#preloader').addClass('hide-element');
            append_msg('Recibos cargados correctamente','bot', 'text', '');
        }
    });
}

function ver_recibo(ruta) {
    $('#frame_archivo').attr('src', ruta);
}