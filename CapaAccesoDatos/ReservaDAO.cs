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
    public class ReservaDAO
    {
        public bool RegistrarReserva(Reserva objReserva, int id_horario_hora)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spRegistrarReserva", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdMedico", objReserva.medico.id_medico);
                cmd.Parameters.AddWithValue("@prmEmailPaciente", objReserva.paciente.email_paciente);
                cmd.Parameters.AddWithValue("@prmFechaReserva", objReserva.fecha_reserva);
                cmd.Parameters.AddWithValue("@prmHoraReserva", objReserva.hora_reserva);
                cmd.Parameters.AddWithValue("@prmConsultaReserva", objReserva.consulta_reserva);
                cmd.Parameters.AddWithValue("@prmIdHorarioHora", id_horario_hora);

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

        public List<Reserva> ListarReservasPendientes()
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            List<Reserva> ListaReservas = new List<Reserva>();
            SqlDataReader dr = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spListarReservas", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Reserva objReserva = new Reserva();
                    objReserva.id_reserva = Convert.ToInt32(dr["id_reserva"].ToString());
                    objReserva.fecha_reserva = dr["fecha_reserva"].ToString();
                    String hora = dr["hora_reserva"].ToString();
                    var vector = hora.Split(':');
                    objReserva.hora_reserva = vector[0] +":"+ vector[1];
                    objReserva.consulta_reserva = dr["consulta_reserva"].ToString();
                    objReserva.medico = new Medico();
                    objReserva.medico.especialidad = new Especialidad();
                    objReserva.medico.nombre_medico = dr["nombre_medico"].ToString();
                    objReserva.medico.apellido_medico = dr["apellido_medico"].ToString();
                    objReserva.paciente = new Paciente();
                    objReserva.paciente.nombre_paciente = dr["nombre_paciente"].ToString();
                    objReserva.paciente.apellido_paciente = dr["apellido_paciente"].ToString();
                    objReserva.paciente.email_paciente = dr["email_paciente"].ToString();
                    objReserva.paciente.telefono_paciente = dr["telefono_paciente"].ToString();
                    String sexo = dr["sexo_paciente"].ToString();
                    if (sexo.Equals("M"))
                    {
                        objReserva.paciente.sexo_paciente = "Masculino";
                    }
                    else
                    {
                        objReserva.paciente.sexo_paciente = "Femenino";
                    }

                    objReserva.medico.especialidad.nombre_especialidad = dr["nombre_especialidad"].ToString();
                    
                    ListaReservas.Add(objReserva);
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
            return ListaReservas;
        }

        public bool ConfirmarReserva(Reserva objReserva)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spConfirmarReserva", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdReserva", objReserva.id_reserva);
                cmd.Parameters.AddWithValue("@prmUsuario", objReserva.empleado.usuario_empleado);
                cmd.Parameters.AddWithValue("@prmObservacion", objReserva.motivo_observacion_reserva);
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

        public bool RechazarReserva(Reserva objReserva)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spRechazarReserva", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdReserva", objReserva.id_reserva);
                cmd.Parameters.AddWithValue("@prmUsuario", objReserva.empleado.usuario_empleado);
                cmd.Parameters.AddWithValue("@prmMotivo", objReserva.motivo_observacion_reserva);
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


        public bool CancelarReserva(Reserva objReserva)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spCancelarReserva", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdReserva", objReserva.id_reserva);
                cmd.Parameters.AddWithValue("@prmUsuario", objReserva.empleado.usuario_empleado);
                cmd.Parameters.AddWithValue("@prmMotivo", objReserva.motivo_observacion_reserva);
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

        public List<Reserva> ListarReservasRechazadas()
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            List<Reserva> ListaReservas = new List<Reserva>();
            SqlDataReader dr = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spListarReservasRechazadas", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Reserva objReserva = new Reserva();
                    objReserva.id_reserva = Convert.ToInt32(dr["id_reserva"].ToString());
                    objReserva.fecha_reserva = dr["fecha_reserva"].ToString();
                    String hora = dr["hora_reserva"].ToString();
                    var vector = hora.Split(':');
                    objReserva.hora_reserva = vector[0] + ":" + vector[1];
                    objReserva.consulta_reserva = dr["consulta_reserva"].ToString();
                    objReserva.medico = new Medico();
                    objReserva.medico.especialidad = new Especialidad();
                    objReserva.medico.nombre_medico = dr["nombre_medico"].ToString();
                    objReserva.medico.apellido_medico = dr["apellido_medico"].ToString();
                    objReserva.paciente = new Paciente();
                    objReserva.paciente.nombre_paciente = dr["nombre_paciente"].ToString();
                    objReserva.paciente.apellido_paciente = dr["apellido_paciente"].ToString();
                    objReserva.paciente.email_paciente = dr["email_paciente"].ToString();
                    objReserva.paciente.telefono_paciente = dr["telefono_paciente"].ToString();
                    String sexo = dr["sexo_paciente"].ToString();
                    if (sexo.Equals("M"))
                    {
                        objReserva.paciente.sexo_paciente = "Masculino";
                    }
                    else
                    {
                        objReserva.paciente.sexo_paciente = "Femenino";
                    }

                    objReserva.medico.especialidad.nombre_especialidad = dr["nombre_especialidad"].ToString();
                    objReserva.estado_reserva = dr["estado_reserva"].ToString();
                    objReserva.empleado = new Empleado();
                    objReserva.empleado.nombre_empleado = dr["nombre_empleado"].ToString();
                    objReserva.empleado.apellido_empleado = dr["apellido_empleado"].ToString();
                    objReserva.motivo_observacion_reserva = dr["motivo_observacion_reserva"].ToString();
                    ListaReservas.Add(objReserva);
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
            return ListaReservas;
        }

        public List<Reserva> ListarReservasConfirmadas()
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            List<Reserva> ListaReservas = new List<Reserva>();
            SqlDataReader dr = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spListarReservasConfirmadas", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Reserva objReserva = new Reserva();
                    objReserva.id_reserva = Convert.ToInt32(dr["id_reserva"].ToString());
                    objReserva.fecha_reserva = dr["fecha_reserva"].ToString();
                    String hora = dr["hora_reserva"].ToString();
                    var vector = hora.Split(':');
                    objReserva.hora_reserva = vector[0] + ":" + vector[1];
                    objReserva.consulta_reserva = dr["consulta_reserva"].ToString();
                    objReserva.medico = new Medico();
                    objReserva.medico.especialidad = new Especialidad();
                    objReserva.medico.nombre_medico = dr["nombre_medico"].ToString();
                    objReserva.medico.apellido_medico = dr["apellido_medico"].ToString();
                    objReserva.paciente = new Paciente();
                    objReserva.paciente.nombre_paciente = dr["nombre_paciente"].ToString();
                    objReserva.paciente.apellido_paciente = dr["apellido_paciente"].ToString();
                    objReserva.paciente.dni_paciente = dr["dni_paciente"].ToString();
                    objReserva.paciente.email_paciente = dr["email_paciente"].ToString();
                    objReserva.paciente.telefono_paciente = dr["telefono_paciente"].ToString();
                    String sexo = dr["sexo_paciente"].ToString();
                    if (sexo.Equals("M"))
                    {
                        objReserva.paciente.sexo_paciente = "Masculino";
                    }
                    else
                    {
                        objReserva.paciente.sexo_paciente = "Femenino";
                    }

                    objReserva.medico.especialidad.nombre_especialidad = dr["nombre_especialidad"].ToString();
                    objReserva.estado_reserva = dr["estado_reserva"].ToString();
                    objReserva.empleado = new Empleado();
                    objReserva.empleado.nombre_empleado = dr["nombre_empleado"].ToString();
                    objReserva.empleado.apellido_empleado = dr["apellido_empleado"].ToString();
                    objReserva.motivo_observacion_reserva = dr["motivo_observacion_reserva"].ToString();
                    ListaReservas.Add(objReserva);
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
            return ListaReservas;
        }

        public List<Reserva> ListarReservasPaciente(int id_paciente)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            List<Reserva> ListaReservas = new List<Reserva>();
            SqlDataReader dr = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spListarReservasPaciente", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdPaciente", id_paciente);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Reserva objReserva = new Reserva();
                    objReserva.id_reserva = Convert.ToInt32(dr["id_reserva"].ToString());
                    objReserva.fecha_reserva = dr["fecha_reserva"].ToString();
                    String hora = dr["hora_reserva"].ToString();
                    var vector = hora.Split(':');
                    objReserva.hora_reserva = vector[0] + ":" + vector[1];
                    objReserva.consulta_reserva = dr["consulta_reserva"].ToString();
                    objReserva.medico = new Medico();
                    objReserva.medico.especialidad = new Especialidad();
                    objReserva.medico.nombre_medico = dr["nombre_medico"].ToString();
                    objReserva.medico.apellido_medico = dr["apellido_medico"].ToString();
                    objReserva.paciente = new Paciente();
                    objReserva.paciente.nombre_paciente = dr["nombre_paciente"].ToString();
                    objReserva.paciente.apellido_paciente = dr["apellido_paciente"].ToString();
                    objReserva.paciente.email_paciente = dr["email_paciente"].ToString();
                    objReserva.paciente.telefono_paciente = dr["telefono_paciente"].ToString();
                    String sexo = dr["sexo_paciente"].ToString();
                    if (sexo.Equals("M"))
                    {
                        objReserva.paciente.sexo_paciente = "Masculino";
                    }
                    else
                    {
                        objReserva.paciente.sexo_paciente = "Femenino";
                    }

                    objReserva.medico.especialidad.nombre_especialidad = dr["nombre_especialidad"].ToString();
                    objReserva.estado_reserva = dr["estado_reserva"].ToString();
                    objReserva.motivo_observacion_reserva = dr["motivo_observacion_reserva"].ToString();
                    ListaReservas.Add(objReserva);
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
            return ListaReservas;
        }

        public List<Reserva> ListarReservasTop()
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            List<Reserva> ListaReservas = new List<Reserva>();
            SqlDataReader dr = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spTopDiezReservasPendientes", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Reserva objReserva = new Reserva();
                    objReserva.id_reserva = Convert.ToInt32(dr["id_reserva"].ToString());
                    objReserva.fecha_reserva = dr["fecha_reserva"].ToString();
                    String hora = dr["hora_reserva"].ToString();
                    var vector = hora.Split(':');
                    objReserva.hora_reserva = vector[0] + ":" + vector[1];
                    objReserva.medico = new Medico();
                    objReserva.medico.especialidad = new Especialidad();
                    objReserva.medico.nombre_medico = dr["nombre_medico"].ToString();
                    objReserva.medico.apellido_medico = dr["apellido_medico"].ToString();
                    objReserva.paciente = new Paciente();
                    objReserva.paciente.nombre_paciente = dr["nombre_paciente"].ToString();
                    objReserva.paciente.apellido_paciente = dr["apellido_paciente"].ToString();
                    objReserva.medico.especialidad.nombre_especialidad = dr["nombre_especialidad"].ToString();
                    objReserva.estado_reserva = dr["estado_reserva"].ToString();
                    ListaReservas.Add(objReserva);
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
            return ListaReservas;
        }

        public Cantidades TraerCantidades()
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            Cantidades objCantidades = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spTraerDatosInicio", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                conexion.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objCantidades = new Cantidades();
                    objCantidades.cantidad_pacientes = Convert.ToInt32(dr["cantidad_pacientes"].ToString());
                    objCantidades.cantidad_reservas = Convert.ToInt32(dr["cantidad_reservas"].ToString());
                    objCantidades.cantidad_medicos = Convert.ToInt32(dr["cantidad_medicos"].ToString());
                    objCantidades.cantidad_empleados = Convert.ToInt32(dr["cantidad_empleados"].ToString());
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
            return objCantidades;
        }

    }
}
