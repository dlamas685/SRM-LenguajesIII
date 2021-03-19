using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;

namespace CapaAccesoDatos
{
    public class PacienteDAO
    {

        //REGISTRAR PACIENTES EN EL SISTEMA
        public bool registrarPaciente(Paciente objPaciente)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spRegistrarPaciente", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmFotoPaciente", objPaciente.foto_paciente);
                cmd.Parameters.AddWithValue("@prmNombrePaciente", objPaciente.nombre_paciente);
                cmd.Parameters.AddWithValue("@prmApellidoPaciente", objPaciente.apellido_paciente);
                cmd.Parameters.AddWithValue("@prmDniPaciente", objPaciente.dni_paciente);
                cmd.Parameters.AddWithValue("@prmEmailPaciente", objPaciente.email_paciente);
                cmd.Parameters.AddWithValue("@prmTelefonoPaciente", objPaciente.telefono_paciente);
                cmd.Parameters.AddWithValue("@prmFechaNacimientoPaciente", objPaciente.fecha_nacimiento_paciente);
                cmd.Parameters.AddWithValue("@prmDireccionPaciente", objPaciente.direccion_paciente);
                cmd.Parameters.AddWithValue("@prmSexoPaciente", objPaciente.sexo_paciente);
                cmd.Parameters.AddWithValue("@prmContraseñaPaciente", objPaciente.contraseña_paciente);
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


        //INICIAR SESION

        public Paciente iniciarSesionPaciente(String email, String contraseña)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            Paciente objPaciente = null;
            SqlDataReader dr = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spIniciarSesion", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmEmailPaciente", email);
                cmd.Parameters.AddWithValue("@prmContraseñaPaciente", contraseña);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    objPaciente = new Paciente();
                    objPaciente.id_paciente = Convert.ToInt32(dr["id_paciente"].ToString());
                    objPaciente.email_paciente = dr["email_paciente"].ToString();
                    objPaciente.contraseña_paciente = dr["contraseña_paciente"].ToString();
                    objPaciente.foto_paciente = (byte[])(dr["foto_paciente"]);
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
            return objPaciente;
        }

        public Paciente traerDatosPaciente(String email)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            Paciente objPaciente = null;
            SqlDataReader dr = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spTraerDatosPaciente", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmEmailPaciente", email);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    objPaciente = new Paciente();
                    objPaciente.id_paciente = Convert.ToInt32(dr["id_paciente"].ToString());
                    objPaciente.nombre_paciente = dr["nombre_paciente"].ToString();
                    objPaciente.apellido_paciente = dr["apellido_paciente"].ToString();
                    objPaciente.dni_paciente = dr["dni_paciente"].ToString();
                    objPaciente.fecha_nacimiento_paciente = dr["fecha_nacimiento_paciente"].ToString();
                    String telefono = dr["telefono_paciente"].ToString();
                    if (telefono.Equals("-"))
                    {
                        objPaciente.telefono_paciente = "";
                    }
                    else
                    {
                        objPaciente.telefono_paciente = telefono;
                    }
                    objPaciente.direccion_paciente = dr["direccion_paciente"].ToString();
                    objPaciente.sexo_paciente = dr["sexo_paciente"].ToString();
                    objPaciente.email_paciente = dr["email_paciente"].ToString();
                    objPaciente.contraseña_paciente = dr["contraseña_paciente"].ToString();
                    objPaciente.foto_paciente = (byte[])(dr["foto_paciente"]);
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
            return objPaciente;
        }

        public bool ModificarPaciente(Paciente objPaciente)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spModificarPaciente", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmEmailPaciente", objPaciente.email_paciente);
                if (objPaciente.foto_paciente != null)
                {
                    cmd.Parameters.AddWithValue("@prmFotoPaciente", objPaciente.foto_paciente);
                }
                cmd.Parameters.AddWithValue("@prmNombrePaciente", objPaciente.nombre_paciente);
                cmd.Parameters.AddWithValue("@prmApellidoPaciente", objPaciente.apellido_paciente);
                cmd.Parameters.AddWithValue("@prmDireccionPaciente", objPaciente.direccion_paciente);
                cmd.Parameters.AddWithValue("@prmFechaNacimientoMedico", objPaciente.fecha_nacimiento_paciente);
                if (objPaciente.telefono_paciente != "")
                {
                    cmd.Parameters.AddWithValue("@prmTelefonoPaciente", objPaciente.telefono_paciente);
                }
                cmd.Parameters.AddWithValue("@prmSexoPaciente", objPaciente.sexo_paciente);
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

    }
}
