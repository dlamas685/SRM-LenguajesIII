using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using CapaEntidades;
using System.Web;
using System.IO;

namespace CapaAccesoDatos
{
    public class MedicoDAO
    {
        public List<Medico> ListarMedicos()
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            List<Medico> ListaMedicos = new List<Medico>();
            SqlDataReader dr = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spListarMedicos", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Medico objMedico = new Medico();
                    DateTime fechaNacimiento = Convert.ToDateTime(dr["fecha_nacimiento_medico"]);
                    int edad = CalcularEdad(fechaNacimiento);
                    objMedico.edad_medico = edad;
                    objMedico.id_medico = Convert.ToInt32(dr["id_medico"].ToString());
                    objMedico.nombre_medico = dr["nombre_medico"].ToString();
                    objMedico.apellido_medico = dr["apellido_medico"].ToString();
                    objMedico.cuil_medico = dr["cuil_medico"].ToString();
                    objMedico.fecha_nacimiento_medico = dr["fecha_nacimiento_medico"].ToString();
                    objMedico.descripcion_medico = dr["descripcion_medico"].ToString();
                    objMedico.dni_medico = dr["dni_medico"].ToString();
                    objMedico.telefono_medico = dr["telefono_medico"].ToString();
                    String sexo = dr["sexo_medico"].ToString();
                    if (sexo.Equals("M"))
                    {
                        objMedico.sexo_medico = "Masculino";
                    }
                    else
                    {
                        objMedico.sexo_medico = "Femenino";
                    }
                    string ruta1 = HttpContext.Current.Server.MapPath("~/Fotos/masculino.jpg");
                    string ruta2 = HttpContext.Current.Server.MapPath("~/Fotos/femenino.jpg");
                    byte[] fotoMasculina = File.ReadAllBytes(ruta1);
                    byte[] fotoFemenina = File.ReadAllBytes(ruta2);
                    objMedico.especialidad = new Especialidad();
                    objMedico.especialidad.id_especialidad = Convert.ToInt32(dr["id_especialidad"].ToString());
                    objMedico.especialidad.nombre_especialidad = dr["nombre_especialidad"].ToString();
                    byte[] imagenMedico = (byte[])(dr["foto_medico"]);
                    if (Convert.ToBase64String(imagenMedico).Equals(Convert.ToBase64String(fotoMasculina)) || Convert.ToBase64String(imagenMedico).Equals(Convert.ToBase64String(fotoFemenina)))
                    {
                        objMedico.estado_foto_medico = "Sin foto";
                    }
                    else
                    {
                        objMedico.estado_foto_medico = "Con foto";
                    }
                    objMedico.foto_medico_url = "data:image/jpg;base64," + Convert.ToBase64String(imagenMedico);
                    ListaMedicos.Add(objMedico);
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
            return ListaMedicos;
        }

        //LISTAR ESPECIALIDADES
        public List<Especialidad> ListarEspecialidades()
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            List<Especialidad> ListaEspecialidades = new List<Especialidad>();
            SqlDataReader dr = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spListarEspecialidades", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Especialidad objEspecialidad = new Especialidad();
                    objEspecialidad.id_especialidad = Convert.ToInt32(dr["id_especialidad"].ToString());
                    objEspecialidad.nombre_especialidad = dr["nombre_especialidad"].ToString();
                    objEspecialidad.descripcion_especialidad = dr["descripcion_especialidad"].ToString();
                    ListaEspecialidades.Add(objEspecialidad);
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
            return ListaEspecialidades;
        }

        //REGISTRAR MEDICO
        public bool RegistrarMedico(Medico objMedico)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spRegistrarMedico", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmFotoMedico", objMedico.foto_medico);
                cmd.Parameters.AddWithValue("@prmNombreMedico", objMedico.nombre_medico);
                cmd.Parameters.AddWithValue("@prmApellidoMedico", objMedico.apellido_medico);
                cmd.Parameters.AddWithValue("@prmDniMedico", objMedico.dni_medico);
                cmd.Parameters.AddWithValue("@prmCuilMedico", objMedico.cuil_medico);
                cmd.Parameters.AddWithValue("@prmTelefonoMedico", objMedico.telefono_medico);
                cmd.Parameters.AddWithValue("@prmFechaNacimientoMedico", objMedico.fecha_nacimiento_medico);
                if (objMedico.descripcion_medico != "")
                {
                    cmd.Parameters.AddWithValue("@prmDescripcionMedico", objMedico.descripcion_medico);
                }
                cmd.Parameters.AddWithValue("@prmSexoMedico", objMedico.sexo_medico);
                cmd.Parameters.AddWithValue("@prmIdEspecialidad", objMedico.especialidad.id_especialidad);
                cmd.Parameters.AddWithValue("@prmUsuarioEmpleado", objMedico.empleado.usuario_empleado);
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

        public static int CalcularEdad(DateTime fechaNacimiento)
        {
            DateTime fechaActual = DateTime.Today;
            if (fechaNacimiento > fechaActual)
            {
                Console.WriteLine("La fecha de nacimiento es mayor que la actual.");
                return -1;
            }
            else
            {
                int edad = fechaActual.Year - fechaNacimiento.Year;
                if (fechaNacimiento.Month > fechaActual.Month)
                {
                    --edad;
                }
                return edad;
            }
        }

        public Medico TraerDatosMedico(int id_medico)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            Medico objMedico = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spTrearDatosMedico", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdMedico", id_medico);
                conexion.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    objMedico = new Medico();
                    DateTime fechaNacimiento = Convert.ToDateTime(dr["fecha_nacimiento_medico"]);
                    int edad = CalcularEdad(fechaNacimiento);
                    objMedico.edad_medico = edad;
                    objMedico.id_medico = Convert.ToInt32(dr["id_medico"].ToString());
                    objMedico.nombre_medico = dr["nombre_medico"].ToString();
                    objMedico.apellido_medico = dr["apellido_medico"].ToString();
                    objMedico.cuil_medico = dr["cuil_medico"].ToString();
                    objMedico.fecha_nacimiento_medico = dr["fecha_nacimiento_medico"].ToString();
                    objMedico.descripcion_medico = dr["descripcion_medico"].ToString();
                    objMedico.dni_medico = dr["dni_medico"].ToString();
                    objMedico.telefono_medico = dr["telefono_medico"].ToString();
                    objMedico.sexo_medico = dr["sexo_medico"].ToString();
                    objMedico.especialidad = new Especialidad();
                    objMedico.especialidad.id_especialidad = Convert.ToInt32(dr["id_especialidad"].ToString());
                    objMedico.especialidad.nombre_especialidad = dr["nombre_especialidad"].ToString();
                    byte[] imagenMedico = (byte[])(dr["foto_medico"]);
                    objMedico.foto_medico_url = "data:image/jpg;base64," + Convert.ToBase64String(imagenMedico);
                    
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
            return objMedico;
        }

        public bool EliminarMedico(int id_medico)
        {
            SqlConnection conexion = null;
            SqlCommand cmd = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                cmd = new SqlCommand("spEliminarMedico", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdMedico", id_medico);
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
        public bool ModificarMedico(Medico objMedico)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            bool respuesta = false;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spModificarMedico", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmIdMedico", objMedico.id_medico);
                if (objMedico.foto_medico != null)
                {
                    cmd.Parameters.AddWithValue("@prmFotoMedico", objMedico.foto_medico);
                }
                cmd.Parameters.AddWithValue("@prmNombreMedico", objMedico.nombre_medico);
                cmd.Parameters.AddWithValue("@prmApellidoMedico", objMedico.apellido_medico);
                cmd.Parameters.AddWithValue("@prmDniMedico", objMedico.dni_medico);
                cmd.Parameters.AddWithValue("@prmCuilMedico", objMedico.cuil_medico);
                cmd.Parameters.AddWithValue("@prmTelefonoMedico", objMedico.telefono_medico);
                cmd.Parameters.AddWithValue("@prmFechaNacimientoMedico", objMedico.fecha_nacimiento_medico);
                if (objMedico.descripcion_medico != "")
                {
                    cmd.Parameters.AddWithValue("@prmDescripcionMedico", objMedico.descripcion_medico);
                }
                cmd.Parameters.AddWithValue("@prmSexoMedico", objMedico.sexo_medico);
                cmd.Parameters.AddWithValue("@prmIdEspecialidad", objMedico.especialidad.id_especialidad);
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

        public List<Medico> ListarMedicosConFechasDefinidas()
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            List<Medico> ListaMedicos = new List<Medico>();
            SqlDataReader dr = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spListarMedicosConFechasDefinidas", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Medico objMedico = new Medico();
                    objMedico.id_medico = Convert.ToInt32(dr["id_medico"].ToString());
                    objMedico.nombre_medico = dr["nombre_medico"].ToString();
                    objMedico.apellido_medico = dr["apellido_medico"].ToString();
                    ListaMedicos.Add(objMedico);
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
            return ListaMedicos;
        }

        public List<Medico> ListarMedicosEspecialidadFechas(int id_especialidad, String fecha_inicio, String fecha_fin)
        {
            SqlCommand cmd = null;
            SqlConnection conexion = null;
            List<Medico> ListaMedicos = new List<Medico>();
            SqlDataReader dr = null;
            try
            {
                conexion = new Conexion().ConexionBD();
                conexion.Open();
                cmd = new SqlCommand("spListarMedicosEspecialidadFechas", conexion);
                cmd.Parameters.AddWithValue("@prmIdEspecialidad", id_especialidad);
                cmd.Parameters.AddWithValue("@prmFechaInicio", fecha_inicio);
                cmd.Parameters.AddWithValue("@prmFechaFin", fecha_fin);
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    Medico objMedico = new Medico();
                    DateTime fechaNacimiento = Convert.ToDateTime(dr["fecha_nacimiento_medico"]);
                    int edad = CalcularEdad(fechaNacimiento);
                    objMedico.edad_medico = edad;
                    objMedico.id_medico = Convert.ToInt32(dr["id_medico"].ToString());
                    objMedico.nombre_medico = dr["nombre_medico"].ToString();
                    objMedico.apellido_medico = dr["apellido_medico"].ToString();
                    objMedico.cuil_medico = dr["cuil_medico"].ToString();
                    objMedico.fecha_nacimiento_medico = dr["fecha_nacimiento_medico"].ToString();
                    objMedico.descripcion_medico = dr["descripcion_medico"].ToString();
                    objMedico.dni_medico = dr["dni_medico"].ToString();
                    objMedico.telefono_medico = dr["telefono_medico"].ToString();
                    String sexo = dr["sexo_medico"].ToString();
                    if (sexo.Equals("M"))
                    {
                        objMedico.sexo_medico = "Masculino";
                    }
                    else
                    {
                        objMedico.sexo_medico = "Femenino";
                    }
                    objMedico.especialidad = new Especialidad();
                    objMedico.especialidad.id_especialidad = Convert.ToInt32(dr["id_especialidad"].ToString());
                    objMedico.especialidad.nombre_especialidad = dr["nombre_especialidad"].ToString();
                    byte[] imagenMedico = (byte[])(dr["foto_medico"]);
                    objMedico.foto_medico_url = "data:image/jpg;base64," + Convert.ToBase64String(imagenMedico);
                    ListaMedicos.Add(objMedico);
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
            return ListaMedicos;
        }

    }

}
