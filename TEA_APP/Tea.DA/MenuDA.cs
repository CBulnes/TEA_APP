﻿using Tea.DA.SQLConnector;
using Tea.entities;
using Tea.utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Tea.DA
{
    public class MenuDA
    {
        SqlConnection cn = new SqlConnector().cadConnection_tea;

        public List<Menu> listar_menu(int id_usuario, int id_tipousuario)
        {
            List<Menu> lista_output = new List<Menu>();
            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand(Procedures.sp_listar_menu, cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id_usuario", SqlDbType.Int).Value = id_usuario;
                cmd.Parameters.Add("@id_tipousuario", SqlDbType.Int).Value = id_tipousuario;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable ta = new DataTable();
                da.Fill(ta);

                foreach (DataRow row in ta.Rows)
                {
                    Menu ent_output = new Menu();
                    ent_output.nombre_categoria = Convert.ToString(row["nombre_categoria"]);
                    ent_output.nombre_opcion = Convert.ToString(row["nombre_opcion"]);
                    ent_output.ruta_opcion = Convert.ToString(row["ruta_opcion"]);
                    ent_output.icono = Convert.ToString(row["icono"]);
                    ent_output.acceso_directo = Convert.ToString(row["acceso_directo"]);
                    ent_output.validacion = Convert.ToString(row["validacion"]);
                    lista_output.Add(ent_output);
                }
            }
            catch (Exception e)
            {
                Menu ent_error = new Menu();
                ent_error.validacion = e.Message.ToString();
                lista_output.Add(ent_error);
            }
            cn.Close();
            return lista_output;
        }
    }
}
