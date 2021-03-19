using CapaEntidades;
using CapaLogicaNegocio;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacionInterna
{
    public partial class Registro_Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<Empleado> ListarEmpleados()
        {
            List<Empleado> ListaEmpleados = null;

            try
            {
                ListaEmpleados = new EmpleadoLN().ListarEmpleados();
            }
            catch (Exception ex)
            {
                ListaEmpleados = new EmpleadoLN().ListarEmpleados();
                throw ex;
            }

            return ListaEmpleados;
        }

        [WebMethod]

        public static bool EliminarEmpleado(String id)
        {
            int id_empleado = Convert.ToInt32(id.ToString());
            bool respuesta = new EmpleadoLN().EliminarEmpleado(id_empleado);
            return respuesta;
        }

        protected void btnRegistrarUsuario_Click(object sender, EventArgs e)
        {
            Empleado objEmpleado = obtenerDatosEmpleado();
            bool respuesta = new EmpleadoLN().RegistrarEmpleado(objEmpleado);

            if (respuesta == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeEmpleadoCorrecto();", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeEmpleadoInorrecto();", true);
            }
        }

        private Empleado obtenerDatosEmpleado()
        {
            Empleado objEmpleado = new Empleado();
            objEmpleado.nombre_empleado = txtNombreRegistrarUsuario.Text;
            objEmpleado.apellido_empleado = txtApellidoRegistrarUsuario.Text;
            objEmpleado.contraseña_empleado = txtContraseñaRegistrarUsuario.Text;
            objEmpleado.usuario_empleado = txtUsuarioRegistrarUsuario.Text;
            int tamaño = fuploadFotoUsuario.PostedFile.ContentLength;
            string ruta;
            byte[] fotoEmpleado;
            String foto = txtImagenRegistrarUsuario.Value;
            if (foto.Equals(""))
            {
                ruta = HttpContext.Current.Server.MapPath("~/Fotos/user.jpg");
                fotoEmpleado = File.ReadAllBytes(ruta);
            }
            else
            {
                fotoEmpleado = new byte[tamaño];
                fuploadFotoUsuario.PostedFile.InputStream.Read(fotoEmpleado, 0, tamaño);
            }
            objEmpleado.foto_empleado = fotoEmpleado;
            return objEmpleado;
        }
    }
}