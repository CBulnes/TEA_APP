using System;
using System.Collections.Generic;
using System.Text;

namespace Tea.entities
{
    public class RespuestaMenu
    {
        public string estado { get; set; } = "";
        public string descripcion { get; set; } = "";
        public List<Menu> data { get; set; } = null;
        //public List<Menu>? data { get; set; } = null;
    }
}
