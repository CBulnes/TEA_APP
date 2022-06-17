using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Tea.DA;
using Tea.DA.SQLConnector;
using Tea.entities;
using Tea.utilities;

namespace Tea.BL
{
    public class CentroAtencionBL
    {
        CentroAtencionDA centroAtencionDA = new CentroAtencionDA();

        public List<CentroAtencion> listar_centros_atencion(string latitud, string longitud, string main_path, string random_str)
        {
            return centroAtencionDA.listar_centros_atencion(latitud, longitud, main_path, random_str);
        }
    }
}
