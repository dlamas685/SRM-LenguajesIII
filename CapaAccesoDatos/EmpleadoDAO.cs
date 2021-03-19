using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using CapaEntidades;


namespace CapaAccesoDatos
{
    public class EmpleadoDAO
    {

        public Empleado iniciarSesionEmpleado(String usuario, String contraseña)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            Empleado objEmpleado = null;
            SqlDataReader dr = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spIniciarSesionEmpleado", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmUsuarioEmpleado", usuario);
                cmd.Parameters.AddWithValue("@prmContraseñaEmpleado", contraseña);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    objEmpleado = new Empleado();
                    objEmpleado.id_empleado = Convert.ToInt32(dr["id_empleado"].ToString());
                    objEmpleado.usuario_empleado = dr["usuario_empleado"].ToString();
                    objEmpleado.contraseña_empleado = dr["contraseña_empleado"].ToString();
                    objEmpleado.nombre_empleado = dr["nombre_empleado"].ToString();
                    objEmpleado.apellido_empleado = dr["apellido_empleado"].ToString();
                    objEmpleado.foto_empleado = (byte[])(dr["foto_empleado"]);
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
            return objEmpleado;
        }


        public List<Empleado> ListarEmpleados()
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            List<Empleado> ListaEmpleados = new List<Empleado>();
            SqlDataReader dr = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spListarEmpleados", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Empleado objEmpleado = new Empleado();
                    objEmpleado.id_empleado = Convert.ToInt32(dr["id_empleado"].ToString());
                    objEmpleado.nombre_empleado = dr["nombre_empleado"].ToString();
                    objEmpleado.apellido_empleado = dr["apellido_empleado"].ToString();
                    objEmpleado.usuario_empleado = dr["usuario_empleado"].ToString();
                    objEmpleado.fecha_creacion_empleado = dr["fecha_creacion_empleado"].ToString();
                    byte[] imagenEmpleado = (byte[])(dr["foto_empleado"]);
                    objEmpleado.foto_empleado = imagenEmpleado;
                    objEmpleado.foto_empleado_url = "data:image/jpg;base64," + Convert.ToBase64String(imagenEmpleado);
                    ListaEmpleados.Add(objEmpleado);
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
            return ListaEmpleados;
        }


        public bool EliminarEmpleado(int id_empleado)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spEliminarEmpleado", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdEmpleado", id_empleado);
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

        public bool RegistrarEmpleado(Empleado objEmpleado)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spRegistrarEmpleado", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmFotoEmpleado", objEmpleado.foto_empleado);
                cmd.Parameters.AddWithValue("@prmNombreEmpleado", objEmpleado.nombre_empleado);
                cmd.Parameters.AddWithValue("@prmApellidoEmpleado", objEmpleado.apellido_empleado);
                cmd.Parameters.AddWithValue("@prmUsuarioEmpleado", objEmpleado.usuario_empleado);
                cmd.Parameters.AddWithValue("@prmContraseñaEmpleado", objEmpleado.contraseña_empleado);
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
