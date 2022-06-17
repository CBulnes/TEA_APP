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
    public class MenuBL
    {
        MenuDA menuDA = new MenuDA();

        public List<Menu> listar_menu(int id_usuario, int id_tipousuario)
        {
            return menuDA.listar_menu(id_usuario, id_tipousuario);
        }
    }
}
