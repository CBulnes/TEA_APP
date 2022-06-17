using System;
using System.Collections.Generic;
using System.Text;

namespace Tea.entities
{
    public class RespuestaUsuario
    {
        public bool estado { get; set; } = false;
        public string descripcion { get; set; } = "";
        public Usuario data { get; set; } = null;
        //public dynamic data { get; set; } = null;
    }
}
