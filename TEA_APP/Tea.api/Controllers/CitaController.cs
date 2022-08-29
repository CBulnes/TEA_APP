using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Tea.BL;
using Tea.entities;
using Tea.utilities;

namespace Tea.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CitaController : ControllerBase
    {
        private readonly IWebHostEnvironment _host;
        private string main_path;

        public CitaController(IWebHostEnvironment host)
        {
            this._host = host;
            main_path = _host.ContentRootPath;
        }

        CitaBL citaBL = new CitaBL();
        RandomUtilities ru = new RandomUtilities();

        string res = "";
        string random_str = "";

        // POST api/values
        [HttpPost("registrar_cita")]
        public RespuestaUsuario Post([FromBody] Cita oCita)
        {
            RespuestaUsuario res_ = new RespuestaUsuario();
            random_str = ru.RandomString(8) + "|" + ru.CurrentDate();

            try
            {
                res_ = citaBL.registrar_cita(oCita, main_path, random_str);
            }
            catch (Exception)
            {
                res_.descripcion = "Ocurrió un error al registrar la cita";
                res_.estado = false;
            }
            return res_;
        }

        [HttpGet("disponibilidad_doctor/{id_doctor}/{fecha}")]
        public List<Cita> disponibilidad_doctor(int id_doctor, string fecha)
        {
            List<Cita> lista = new List<Cita>();
            random_str = ru.RandomString(8) + "|" + ru.CurrentDate();

            try
            {
                lista = citaBL.disponibilidad_doctor(id_doctor, fecha, main_path, random_str);
            }
            catch (Exception)
            {
                lista.Clear();
            }
            return lista;
        }

        [HttpGet("citas_usuario/{id_usuario}")]
        public List<Cita> citas_usuario(int id_usuario)
        {
            List<Cita> lista = new List<Cita>();
            random_str = ru.RandomString(8) + "|" + ru.CurrentDate();

            try
            {
                lista = citaBL.citas_usuario(id_usuario, main_path, random_str);
            }
            catch (Exception)
            {
                lista.Clear();
            }
            return lista;
        }

    }
}
