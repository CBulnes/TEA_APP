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
    public class UsuarioBL
    {
        UsuarioDA usuarioDA = new UsuarioDA();

        public Usuario validar_usuario(Usuario usuario)
        {
            return usuarioDA.validar_usuario(usuario);
        }
        public Usuario actualizar_contraseña(Usuario usuario)
        {
            return usuarioDA.actualizar_contraseña(usuario);
        }
        public List<Usuario> listar_doctores()
        {
            return usuarioDA.listar_doctores();
        }

    }
}
