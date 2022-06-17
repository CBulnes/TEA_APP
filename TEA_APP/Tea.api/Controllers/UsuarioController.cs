﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Tea.BL;
using Tea.utilities;
using Tea.entities;

namespace Tea.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        UsuarioBL usuarioBL = new UsuarioBL();

        [HttpPost("validar_usuario")]
        public ActionResult<RespuestaUsuario> validar_usuario([FromBody] Usuario usuario)
        {
            RespuestaUsuario respuesta = new RespuestaUsuario();
            try
            {
                usuario = usuarioBL.validar_usuario(usuario);

                respuesta.estado = usuario.validacion == "OK" ? true : false;
                respuesta.descripcion = usuario.validacion;
                respuesta.data = usuario;
            }
            catch (Exception e)
            {
                respuesta.estado = false;
                respuesta.descripcion = "Ocurrió un error al validar sus credenciales";
            }
            return respuesta;
        }

        [HttpPost("actualizar_contraseña")]
        public ActionResult<RespuestaUsuario> actualizar_contraseña([FromBody] Usuario usuario)
        {
            RespuestaUsuario respuesta = new RespuestaUsuario();
            try
            {
                usuario = usuarioBL.actualizar_contraseña(usuario);

                respuesta.estado = usuario.validacion == "OK" ? true : false;
                respuesta.descripcion = usuario.validacion;
                respuesta.data = usuario;
            }
            catch (Exception e)
            {
                respuesta.estado = false;
                respuesta.descripcion = "Ocurrió un error al actualizar la contraseña";
            }
            return respuesta;
        }

    }
}
