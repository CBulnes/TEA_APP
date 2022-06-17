using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Tea.site.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Tea.entities;
using Tea.utilities;

namespace Tea.site.Controllers
{
    public class TicketController : Controller
    {
        private string url_usuario = Helper.GetUrlApi() + "/api/usuario";
        private string url = "";

        dynamic obj = new System.Dynamic.ExpandoObject();

        [HttpPost]
        public ActionResult<Ticket> registrar_ticket(Ticket oTicket)
        {
            string rpta = "";
            try
            {
                oTicket.codigo = generar_ticket();

                url = url_usuario + "/registrar_ticket";

                obj = (dynamic)oTicket;

                rpta = ApiCaller.consume_endpoint_method(url, obj, "POST");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                oTicket.codigo = "ERROR";
            }
            return oTicket;
        }

        public string generar_ticket()
        {
            Ticket oTicket = new Ticket();
            string rpta = "";
            try
            {
                url = url_usuario + "/generar_ticket";

                rpta = ApiCaller.consume_endpoint_method(url, null, "GET");
                oTicket = JsonConvert.DeserializeObject<Ticket>(rpta);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                rpta = "Ocurrió un error generando el ticket";
            }
            return oTicket.codigo;
        }
    }
}
