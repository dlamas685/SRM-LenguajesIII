using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CapaAccesoDatos
{
    public class HorariosDAO
    {
        public List<Horarios> ListarHorariosMedico(int id_medico)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<Horarios> ListaHorariosMedico = new List<Horarios>();
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spListarHorariosMedico", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdMedico", id_medico);
                conexion.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Horarios objHorarios = new Horarios();
                    objHorarios.id_horario = Convert.ToInt32(dr["id_horario"].ToString());
                    objHorarios.fecha_atencion = dr["fecha_atencion"].ToString();
                    String hora_inicio = dr["hora_inicio"].ToString();
                    var horaInicio = hora_inicio.Split(':');
                    objHorarios.hora_inicio = horaInicio[0] + ':' + horaInicio[1];
                    String hora_fin = dr["hora_fin"].ToString();
                    var horaFin = hora_fin.Split(':');
                    objHorarios.hora_fin = horaFin[0] + ':' + horaFin[1];
                    objHorarios.medico = new Medico();
                    objHorarios.medico.id_medico = Convert.ToInt32(dr["id_medico"].ToString());
                    ListaHorariosMedico.Add(objHorarios);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return ListaHorariosMedico;
        }



        public List<Horarios> ListarHorariosMedicoRangoFecha(int id_medico, String fecha_inicio, String fecha_fin)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<Horarios> ListaHorariosMedico = new List<Horarios>();
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spListarHorariosMedicoRangoFecha", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdMedico", id_medico);
                cmd.Parameters.AddWithValue("@prmFechaInicio", fecha_inicio);
                cmd.Parameters.AddWithValue("@prmFechaFin", fecha_fin);
                conexion.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Horarios objHorarios = new Horarios();
                    objHorarios.id_horario = Convert.ToInt32(dr["id_horario"].ToString());
                    objHorarios.fecha_atencion = dr["fecha_atencion"].ToString();
                    String hora_inicio = dr["hora_inicio"].ToString();
                    var horaInicio = hora_inicio.Split(':');
                    objHorarios.hora_inicio = horaInicio[0] + ':' + horaInicio[1];
                    String hora_fin = dr["hora_fin"].ToString();
                    var horaFin = hora_fin.Split(':');
                    objHorarios.hora_fin = horaFin[0] + ':' + horaFin[1];
                    objHorarios.medico = new Medico();
                    objHorarios.medico.id_medico = Convert.ToInt32(dr["id_medico"].ToString());
                    ListaHorariosMedico.Add(objHorarios);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return ListaHorariosMedico;
        }

        public bool RegistrarHorariosAtencion(int id_medico, String[] horariosMedico, int id_empleado)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                int i = 0;
                int cant = horariosMedico.Length;
                int band = 0;
                while (i < cant && band == 0)
                {
                    cmd = new SqlCommand("spRegistrarHorariosAtencion", conexion);

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@prmIdMedico", id_medico);

                    cmd.Parameters.AddWithValue("@prmIdEmpleado", id_empleado);

                    cmd.Parameters.AddWithValue("@prmFechaAtencion", horariosMedico[i]);

                    i = i + 1;

                    cmd.Parameters.AddWithValue("@prmHoraInicio", horariosMedico[i]);

                    i = i + 1;

                    cmd.Parameters.AddWithValue("@prmHoraFin", horariosMedico[i]);

                    int filas = cmd.ExecuteNonQuery();

                    if (filas == 0)
                    {
                        band = 1;
                    }
                    i = i + 1;
                }
                if (band == 0)
                {
                    respuesta = true;
                }

            }
            catch (Exception ex)
            {
                respuesta = false;
                throw ex;
            }
            finally
            {

                conexion.Close();
            }
            return respuesta;

        }

        public bool EliminarHorarioMedico(int id_medico, int id_horario)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spEliminarHorarioMedico", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdMedico", id_medico);
                cmd.Parameters.AddWithValue("@prmIdHorario", id_horario);
                conexion.Open();
                int filas = cmd.ExecuteNonQuery();
                if (filas > 0)
                {
                    respuesta = true;
                }

            }
            catch (Exception ex)
            {
                respuesta = false;
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return respuesta;
        }

        public List<Horarios> TraerFechasMedico(int id_medico)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<Horarios> ListaHorariosMedico = new List<Horarios>();
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spTraerFechasMedico", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdMedico", id_medico);
                conexion.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Horarios objHorarios = new Horarios();
                    objHorarios.id_horario = Convert.ToInt32(dr["id_horario"].ToString());
                    objHorarios.fecha_atencion = dr["fecha_atencion"].ToString();
                    objHorarios.hora_inicio = dr["hora_inicio"].ToString();
                    objHorarios.hora_fin = dr["hora_fin"].ToString();
                    ListaHorariosMedico.Add(objHorarios);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return ListaHorariosMedico;
        }


        public Horarios TraerHorariosEntradaSalida(int id_horario)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            Horarios objHorario = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spTraerHorariosEntradaSalida", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdHorario", id_horario);
                conexion.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    objHorario = new Horarios();
                    objHorario.id_horario = Convert.ToInt32(dr["id_horario"].ToString());
                    String hora_inicio = dr["hora_inicio"].ToString();
                    var horaInicio = hora_inicio.Split(':');
                    objHorario.hora_inicio = horaInicio[0] + ':' + horaInicio[1];
                    String hora_fin = dr["hora_fin"].ToString();
                    var horaFin = hora_fin.Split(':');
                    objHorario.hora_fin = horaFin[0] + ':' + horaFin[1];
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return objHorario;
        }

        public List<DetalleHorarios> ListarHorasFecha(int id_horario)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<DetalleHorarios> DetallesHorario = new List<DetalleHorarios>();
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spListarHorasFecha", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdHorario", id_horario);
                conexion.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    DetalleHorarios objDetalleHorario = new DetalleHorarios();
                    objDetalleHorario.id_horario_hora = Convert.ToInt32(dr["id_horario_hora"].ToString());
                    String hora = dr["hora"].ToString();
                    var vector = hora.Split(':');
                    objDetalleHorario.hora = vector[0]+':' + vector[1];
                    String estado_hora;
                    String situacion_hora; 
                    int estado = Convert.ToInt32(dr["estado_hora"].ToString());
                    if (estado == 1)
                    {
                        estado_hora = "Habilitada";
                    }
                    else
                    {
                        estado_hora = "Deshabilitada";
                    }
                    int situacion = Convert.ToInt32(dr["situacion_hora"].ToString());
                    if (situacion == 1)
                    {
                        situacion_hora = "Reserveda";
                    }
                    else
                    {
                        situacion_hora = "Sin Reservas";
                    }
                    objDetalleHorario.estado_hora = estado_hora;
                    objDetalleHorario.situacion_hora = situacion_hora;
                    DetallesHorario.Add(objDetalleHorario);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return DetallesHorario;
        }

        public bool DeshabilitarHorarioFecha(int id_horario_hora, int id_horario)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spDeshabilitarHorarioFecha", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdHorario", id_horario);
                cmd.Parameters.AddWithValue("@prmIdHorarioHora", id_horario_hora);
                conexion.Open();
                int filas = cmd.ExecuteNonQuery();
                if (filas > 0)
                {
                    respuesta = true;
                }

            }
            catch (Exception ex)
            {
                respuesta = false;
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return respuesta;
        }

        public bool HabilitarHorarioFecha(int id_horario_hora, int id_horario)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spHabilitarHorarioFecha", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdHorario", id_horario);
                cmd.Parameters.AddWithValue("@prmIdHorarioHora", id_horario_hora);
                conexion.Open();
                int filas = cmd.ExecuteNonQuery();
                if (filas > 0)
                {
                    respuesta = true;
                }

            }
            catch (Exception ex)
            {
                respuesta = false;
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return respuesta;
        }

        public List<Horarios> TraerFechasMedicoRango(int id_medico, String fecha_inicio, String fecha_fin)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<Horarios> ListaHorariosMedico = new List<Horarios>();
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spTraerFechasMedicoRango", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdMedico", id_medico);
                cmd.Parameters.AddWithValue("@prmFechaInicio", fecha_inicio);
                cmd.Parameters.AddWithValue("@prmFechaFin", fecha_fin);
                conexion.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Horarios objHorarios = new Horarios();
                    objHorarios.id_horario = Convert.ToInt32(dr["id_horario"].ToString());
                    objHorarios.fecha_atencion = dr["fecha_atencion"].ToString();
                    ListaHorariosMedico.Add(objHorarios);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return ListaHorariosMedico;
        }

        public List<DetalleHorarios> ListarHorasFechaHabilitadas(int id_horario)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<DetalleHorarios> DetallesHorario = new List<DetalleHorarios>();
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spListarHorasFechaHabilitadas", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdHorario", id_horario);
                conexion.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    DetalleHorarios objDetalleHorario = new DetalleHorarios();
                    objDetalleHorario.id_horario_hora = Convert.ToInt32(dr["id_horario_hora"].ToString());
                    String hora = dr["hora"].ToString();
                    var vector = hora.Split(':');
                    objDetalleHorario.hora = vector[0] + ':' + vector[1];
                    String estado_hora;
                    String situacion_hora;
                    int estado = Convert.ToInt32(dr["estado_hora"].ToString());
                    if (estado == 1)
                    {
                        estado_hora = "Habilitada";
                    }
                    else
                    {
                        estado_hora = "Deshabilitada";
                    }
                    int situacion = Convert.ToInt32(dr["situacion_hora"].ToString());
                    if (situacion == 1)
                    {
                        situacion_hora = "Reserveda";
                    }
                    else
                    {
                        situacion_hora = "Sin Reservas";
                    }
                    objDetalleHorario.estado_hora = estado_hora;
                    objDetalleHorario.situacion_hora = situacion_hora;
                    DetallesHorario.Add(objDetalleHorario);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return DetallesHorario;
        }


    }
}
