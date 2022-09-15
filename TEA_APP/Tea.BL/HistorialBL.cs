﻿using Tea.DA.SQLConnector;
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
    public class HistorialBL
    {
        HistorialDA historialDA = new HistorialDA();

        public RespuestaUsuario registrar_historial(HistorialPaciente oHistorial)
        {
            RespuestaUsuario res_ = new RespuestaUsuario();
            try
            {
                res_ = historialDA.registrar_historial(oHistorial);
            }
            catch (Exception)
            {
                res_.estado = false;
                res_.descripcion = "Ocurrió un error al registrar la información.";
            }
            return res_;
        }
        public RespuestaUsuario registrar_estado_cuestionario(HistorialPaciente oHistorial)
        {
            RespuestaUsuario res_ = new RespuestaUsuario();
            try
            {
                res_ = historialDA.registrar_estado_cuestionario(oHistorial);
            }
            catch (Exception)
            {
                res_.estado = false;
                res_.descripcion = "Ocurrió un error atendiendo su solicitud.";
            }
            return res_;
        }

        public List<HistorialPaciente> listar_historial(int id_usuario)
        {
            List<HistorialPaciente> lista = new List<HistorialPaciente>();
            try
            {
                lista = historialDA.listar_historial(id_usuario);
            }
            catch (Exception)
            {
                lista.Clear();
            }
            return lista;
        }

    }
}
