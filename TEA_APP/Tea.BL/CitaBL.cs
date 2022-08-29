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
    public class CitaBL
    {
        CitaDA citaDA = new CitaDA();

        public RespuestaUsuario registrar_cita(Cita oCita, string main_path, string random_str)
        {
            RespuestaUsuario res_ = new RespuestaUsuario();
            try
            {
                res_ = citaDA.registrar_cita(oCita, main_path, random_str);
            }
            catch (Exception)
            {
                res_.estado = false;
                res_.descripcion = "Ocurrió un error al registrar la cita.";
            }
            return res_;
        }

        public List<Cita> disponibilidad_doctor(int id_doctor, string fecha, string main_path, string random_str)
        {
            List<Cita> lista = new List<Cita>();
            try
            {
                lista = citaDA.disponibilidad_doctor(id_doctor, fecha, main_path, random_str);
            }
            catch (Exception)
            {
                lista.Clear();
            }
            return lista;
        }

        public List<Cita> citas_usuario(int id_usuario, string main_path, string random_str)
        {
            List<Cita> lista = new List<Cita>();
            try
            {
                lista = citaDA.citas_usuario(id_usuario, main_path, random_str);
            }
            catch (Exception)
            {
                lista.Clear();
            }
            return lista;
        }

    }
}
