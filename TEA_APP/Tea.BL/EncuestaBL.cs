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
    public class EncuestaBL
    {
        EncuestaDA encuestaDA = new EncuestaDA();

        public string registrar_puntuacion(Puntuacion oPuntuacion, string main_path, string random_str)
        {
            return encuestaDA.registrar_puntuacion(oPuntuacion, main_path, random_str);
        }
    }
}
