﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Tea.site.Models;
using Microsoft.AspNetCore.Mvc;
using Tea.entities;
using Tea.utilities;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Http;

namespace Tea.site.Controllers
{
    public class HistorialCitasController : Controller
    {
        private string url_citas_doctor = Helper.GetUrlApi() + "/api/cita/citas_doctor";
        private string url_historial_usuario = Helper.GetUrlApi() + "/api/cita/historial_usuario";
        private string url_registrar_historial = Helper.GetUrlApi() + "/api/cita/registrar_historial";

        private string url = "";
        dynamic obj = new System.Dynamic.ExpandoObject();

        RespuestaCentroAtencion oRespuesta = new RespuestaCentroAtencion();

        public IActionResult Index()
        {
            if (!string.IsNullOrEmpty(HttpContext.Session.GetString("nombres") as string))
            {
                dynamic obj = new System.Dynamic.ExpandoObject();
                string path = $"{this.Request.Scheme}://{this.Request.Host}{this.Request.PathBase}";
                obj.path = path;
                obj.call_center = Helper.GetCallCenter();
                obj.horario_atencion = Helper.GetHorario();
                obj.whatsapp = Helper.GetWhatsapp();
                obj.nombres = HttpContext.Session.GetString("nombres");
                obj.apellidos = HttpContext.Session.GetString("apellidos");
                obj.id_usuario = HttpContext.Session.GetInt32("id_usuario");
                obj.id_tipousuario = HttpContext.Session.GetInt32("id_tipousuario");
                obj.tipo_documento = HttpContext.Session.GetString("tipo_documento");
                obj.num_documento = HttpContext.Session.GetString("num_documento");
                obj.vista = "ATENCION";
                obj.call_center_invitado = Helper.GetCallCenterInvitado();

                if (obj.id_tipousuario == 1) //admin
                {
                    return RedirectToAction("Index", "Home");
                }
                else //cliente
                {
                    return View("Index", obj);
                }
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }

        [HttpGet]
        public async Task<List<Cita>> CitasDoctor(string fecha, int id_estado)
        {
            int id_usuario = Convert.ToInt32(HttpContext.Session.GetInt32("id_usuario"));
            List<Cita> lista = new List<Cita>();
            string res = "";
            try
            {
                url = url_citas_doctor + "/" + id_usuario + "/" + fecha + "/" + id_estado;
                res = ApiCaller.consume_endpoint_method(url, null, "GET");
                lista = JsonConvert.DeserializeObject<List<Cita>>(res);
            }
            catch (Exception)
            {
                lista.Clear();
            }
            return lista;
        }

        [HttpGet]
        public async Task<List<HistorialPaciente>> HistorialPaciente(int id_usuario)
        {
            List<HistorialPaciente> lista = new List<HistorialPaciente>();
            string res = "";
            try
            {
                url = url_historial_usuario + "/" + id_usuario;
                res = ApiCaller.consume_endpoint_method(url, null, "GET");
                lista = JsonConvert.DeserializeObject<List<HistorialPaciente>>(res);
            }
            catch (Exception)
            {
                lista.Clear();
            }
            return lista;
        }

        [HttpPost]
        public async Task<RespuestaUsuario> RegistrarHistorial(HistorialPaciente model)
        {
            model.id_doctor = Convert.ToInt32(HttpContext.Session.GetInt32("id_usuario"));
            RespuestaUsuario res_ = new RespuestaUsuario();
            string res = "";
            try
            {
                url = url_registrar_historial;
                obj = (dynamic)model;
                res = ApiCaller.consume_endpoint_method(url, obj, "POST");
                res_ = JsonConvert.DeserializeObject<RespuestaUsuario>(res);
            }
            catch (Exception)
            {
                res_.estado = false;
                res_.descripcion = "Ocurrió un error al registrar la cita.";
            }
            return res_;
        }

    }
}
