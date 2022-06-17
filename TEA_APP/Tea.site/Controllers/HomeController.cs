using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Tea.site.Models;
using IBM.Cloud.SDK.Core.Authentication.Iam;
using IBM.Watson.Assistant.v2;
using IBM.Watson.Assistant.v2.Model;
using IBM.Cloud.SDK.Core.Http.Exceptions;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System.IO;
using Tea.entities;
using Tea.utilities;

namespace Tea.site.Controllers
{
    public class HomeController : Controller
    {
        private string url_menu = Helper.GetUrlApi() + "/api/menu";
        private string url_punto_visita = Helper.GetUrlApi() + "/api/puntovisitado";
        private string url_encuesta = Helper.GetUrlApi() + "/api/encuesta";
        private string url_visita = Helper.GetUrlApi() + "/api/visita";
        private string url = "";

        RespuestaMenu oRespuesta = new RespuestaMenu();
        RespuestaPuntoVisitado oRespuestaPV = new RespuestaPuntoVisitado();
        RespuestaArchivos oRespuestaA = new RespuestaArchivos();
        Menu oMenu = new Menu();

        dynamic obj = new System.Dynamic.ExpandoObject();

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
                obj.vista = "HOME";
                obj.call_center_invitado = Helper.GetCallCenterInvitado();

                string vista = "";
                if (obj.id_tipousuario == 1) //admin
                {
                    vista = "IndexAdmin";
                }
                if (obj.id_tipousuario == 2 || obj.id_tipousuario == 0) //cliente
                {
                    vista = "Index";
                }
                return View(vista, obj);
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }

        [HttpPost]
        public ActionResult send_message(InputModel input)
        {
            ErrorResponseModel error_rspns = new ErrorResponseModel();

            string api_key = Helper.GetApiKey();
            string version = Helper.GetVersion();
            string url_asistente = Helper.GetUrlAsistente();
            string assistant_id = Helper.GetIdAsistente();

            dynamic obj_response = new System.Dynamic.ExpandoObject();
            string msg = input.message;

            if (!string.IsNullOrEmpty(HttpContext.Session.GetString("nombres") as string))
            {
                try
                {
                    IamAuthenticator authenticator = new IamAuthenticator(
                        apikey: api_key
                    );

                    AssistantService assistant = new AssistantService(version, authenticator);
                    assistant.SetServiceUrl(url_asistente);

                    //assistant.DisableSslVerification(true);

                    var result = assistant.CreateSession(
                        assistantId: assistant_id
                    );

                    //Console.WriteLine(result.Response);
                    string sessionId = result.Result.SessionId;

                    var resultM = assistant.Message(
                    assistantId: assistant_id,
                    sessionId: sessionId,
                    input: new MessageInput()
                    {
                        Text = msg
                    });
                    Console.WriteLine(resultM.Response);

                    var resultF = assistant.DeleteSession(
                        assistantId: assistant_id,
                        sessionId: sessionId
                    );
                    Console.WriteLine(resultF.Response);

                    obj_response = resultM.Response;
                }
                catch (ServiceResponseException e)
                {
                    error_rspns.error = e.Message;
                    obj_response = error_rspns;
                }
                catch (Exception e)
                {
                    error_rspns.error = e.Message;
                    obj_response = error_rspns;
                }

                //return Json(obj_response);
            }
            else
            {
                error_rspns.error = "Session";
                obj_response = error_rspns;

                //return Json(obj_response);
            }
            return Json(obj_response);
        }

        [HttpPost]
        public ActionResult inactivar_sesion()
        {
            string res = "OK";
            try
            {
                HttpContext.Session.Clear();
            }
            catch (Exception ex)
            {
                res = ex.Message.ToString();
            }

            return Content(res);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpPost]
        public ActionResult cerrar_sesion()
        {
            string res = "OK";
            try
            {
                HttpContext.Session.Clear();
            }
            catch (Exception ex)
            {
                res = ex.Message.ToString();
            }

            return Content(res);
        }

        [HttpPost]
        public ActionResult<RespuestaMenu> validar_menu()
        {
            string res = "";
            try
            {
                string id_usuario = Convert.ToInt32(HttpContext.Session.GetInt32("id_usuario")).ToString();
                string id_tipousuario = Convert.ToInt32(HttpContext.Session.GetInt32("id_tipousuario")).ToString();

                url = url_menu + "/" + id_usuario + "/" + id_tipousuario;
                res = ApiCaller.consume_endpoint_method(url, null, "GET");
                oRespuesta = JsonConvert.DeserializeObject<RespuestaMenu>(res);
            }
            catch (Exception ex)
            {
                oRespuesta.estado = "ERROR";
                oRespuesta.descripcion = ex.Message.ToString();
            }
            return oRespuesta;
        }

        [HttpGet]
        public ActionResult<int> validar_flag_chat()
        {
            int flag_chat = 0;
            try
            {
                flag_chat = Convert.ToInt32(HttpContext.Session.GetInt32("flag_chat"));
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                flag_chat = -1;
            }
            return flag_chat;
        }

        [HttpGet]
        public ActionResult<string> deshabilitar_flag_chat()
        {
            string rpta = "";
            try
            {
                HttpContext.Session.SetInt32("flag_chat", 0);
                rpta = "OK";
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                rpta = "Ocurrió un error deshabilitando el flag_chat";
            }
            return rpta;
        }

        [HttpPost]
        public ActionResult<string> registrar_punto_visitado(Visita visita)
        {
            string rpta = "";
            try
            {
                url = url_visita + "/registrar_punto_visitado";
                obj = (dynamic)visita;

                rpta = ApiCaller.consume_endpoint_method(url, obj, "PUT");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                rpta = "Ocurrió un error registrando la visita";
            }
            return rpta;
        }

        [HttpGet]
        public ActionResult<RespuestaPuntoVisitado> listar_puntos_visitados(InputVisita oInputVisita)
        {
            string res = "";
            try
            {
                int año = oInputVisita.año;
                int mes = oInputVisita.mes;
                string tipo = oInputVisita.tipo;
                url = url_punto_visita + "/" + año + "/" + mes + "/" + tipo;

                res = ApiCaller.consume_endpoint_method(url, null, "GET");
                oRespuestaPV = JsonConvert.DeserializeObject<RespuestaPuntoVisitado>(res);
            }
            catch (Exception ex)
            {
                oRespuestaPV.estado = "ERROR";
                oRespuestaPV.descripcion = ex.Message.ToString();
            }
            return oRespuestaPV;
        }

        [HttpGet]
        public ActionResult<RespuestaArchivos> listar_archivos()
        {
            try
            {
                string dni = HttpContext.Session.GetString("num_documento");

                List<Archivo> oListaArchivos = new List<Archivo>();

                DirectoryInfo d = new DirectoryInfo("wwwroot/data");
                FileInfo[] Files = d.GetFiles();
                int i = 1;
                foreach (FileInfo file in Files)
                {
                    string nombre_archivo = file.Name.ToString();
                    if (nombre_archivo.IndexOf(dni) != -1)
                    {
                        Archivo oArchivo = new Archivo();
                        oArchivo.orden = i;
                        oArchivo.nombre = nombre_archivo;
                        oArchivo.ruta = "/data/" + nombre_archivo;
                        oListaArchivos.Add(oArchivo);
                        i++;
                    }
                }

                oRespuestaA.data = oListaArchivos;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                oRespuestaA.estado = "ERROR";
                oRespuestaA.descripcion = "Ocurrió un error listando sus recibos";
            }
            return oRespuestaA;
        }

        [HttpPost]
        public ActionResult<string> registrar_puntuacion(Puntuacion oPuntuacion)
        {
            string rpta = "";
            try
            {
                url = url_encuesta + "/registrar_puntuacion";
                obj = (dynamic)oPuntuacion;

                rpta = ApiCaller.consume_endpoint_method(url, obj, "POST");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                rpta = "Ocurrió un error registrando la encuesta";
            }
            return rpta;
        }

        [HttpGet]
        public ActionResult<List<string>> listar_articulos()
        {
            List<string> oListaArticulos = new List<string>();
            try
            {
                DirectoryInfo d = new DirectoryInfo("wwwroot/articulos");
                FileInfo[] Files = d.GetFiles();

                foreach (FileInfo file in Files)
                {
                    oListaArticulos.Add(file.Name.ToString().Replace(".html", ""));
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                oListaArticulos.Clear();
            }
            return oListaArticulos;
        }

        [HttpPost]
        public ActionResult<string> redireccionar(InputVisita oInputVisita)
        {
            if (oInputVisita.tipo == "REGISTRO")
            {
                return RedirectToAction("Index", "Registro");
            }
            else //LOGIN
            {
                return RedirectToAction("Index", "Login");
            }
        }
    }

}
