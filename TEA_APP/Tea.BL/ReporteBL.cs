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
    public class ReporteBL
    {
        ReporteDA reporteDA = new ReporteDA();

        public List<ReporteNPS> reporte_nps(int año, int mes, string main_path, string random_str)
        {
            return reporteDA.reporte_nps(año, mes, main_path, random_str);
        }
    }
}
