using Tea.DA.SQLConnector;
using Tea.entities;
using Tea.utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Tea.DA;

namespace Tea.BL
{
    public class PuntoVisitadoBL
    {
        PuntoVisitadoDA puntoVisitadoDA = new PuntoVisitadoDA();

        public List<PuntoVisitado> listar_puntos_visitados(int año, int mes, string main_path, string random_str)
        {
            return puntoVisitadoDA.listar_puntos_visitados(año, mes, main_path, random_str);
        }

        public List<PuntoVisitado> listar_visitas(int año, int mes, string main_path, string random_str)
        {
            return puntoVisitadoDA.listar_visitas(año, mes, main_path, random_str);
        }

        public List<PuntoVisitado> listar_encuestas(int año, int mes, string main_path, string random_str)
        {
            return puntoVisitadoDA.listar_encuestas(año, mes, main_path, random_str);
        }
    }
}
