using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaLogicaNegocio;
using CapaEntidades;
using System.IO;
using System.Drawing;
using System.Net;

namespace CapaPresentacionExterna
{
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarPaciente_Click(object sender, EventArgs e)
        {
            Paciente objPaciente = obtenerEntidadPaciente();
            
            if (txtContraseñaConfirmarRegistrarPaciente.Text.Equals(txtContraseñaRegistrarPaciente.Text))
            {
                bool respuesta = new PacienteLN().registrarPaciente(objPaciente);
                if (respuesta == true)
                {
                    limpiarPaciente();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajePacienteCorrecto();", true);

                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajePacienteIncorrecto();", true);

                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeContraseñaIncorrecta();", true);
            }
            
        }

        //LIMPIAR CAMPOS DE ENTRADA DE REGISTRAR PACIENTE
        public void limpiarPaciente()
        {
            txtNombreRegistrarPaciente.Text = "";
            txtApellidoRegistrarPaciente.Text = "";
            txtContraseñaConfirmarRegistrarPaciente.Text = "";
            txtContraseñaRegistrarPaciente.Text = "";
            txtDniRegistrarPaciente.Text = "";
            txtEmailRegistrarPaciente.Text = "";
            txtFechaNacimientoRegistrarPaciente.Text = "";
            txtTelefonoRegistrarPaciente.Text = "";
            txtDireccionRegistrarPaciente.Text = "";
        }


        //OBTENER DATOS DE ENTRADA DEL FORMULARIO REGISTRAR PACIENTE
        private Paciente obtenerEntidadPaciente()
        {
            Paciente objPaciente = new Paciente();            
            objPaciente.id_paciente = 0;
            objPaciente.nombre_paciente = txtNombreRegistrarPaciente.Text;
            objPaciente.apellido_paciente = txtApellidoRegistrarPaciente.Text;
            objPaciente.dni_paciente = txtDniRegistrarPaciente.Text;
            objPaciente.email_paciente = txtEmailRegistrarPaciente.Text;
            objPaciente.telefono_paciente = txtTelefonoRegistrarPaciente.Text;
            string ruta;
            byte[] imageBytes;
            String sexo = selectSexoRegistrarPaciente.Items[selectSexoRegistrarPaciente.SelectedIndex].Text;
            if (sexo.Equals("Masculino"))
            {
                ruta = HttpContext.Current.Server.MapPath("~/Fotos/masculino.jpg");
                imageBytes = File.ReadAllBytes(ruta);
                //imageBytes = File.ReadAllBytes("C:/Users/gisel/Desktop/Lenguajes/CapaPresentacion/Fotos/masculino.jpg");
                //imageBytes = File.ReadAllBytes("D:/Usuario/Universidad/Proyectos/SRM/CapaPresentacion/Fotos/masculino.jpg");
                objPaciente.sexo_paciente = "M";
                
            }
            else
            {
                ruta = HttpContext.Current.Server.MapPath("~/Fotos/femenino.jpg");
                imageBytes = File.ReadAllBytes(ruta);
                //imageBytes = File.ReadAllBytes("C:/Users/gisel/Desktop/Lenguajes/CapaPresentacion/Fotos/femenino.jpg");
                //imageBytes = File.ReadAllBytes("D:/Usuario/Universidad/Proyectos/SRM/CapaPresentacion/Fotos/femenino.jpg");
                objPaciente.sexo_paciente = "F";
            }
            objPaciente.foto_paciente = imageBytes;
            objPaciente.direccion_paciente = txtDireccionRegistrarPaciente.Text;
            String fecha = txtFechaNacimientoRegistrarPaciente.Text;
            var cadena = fecha.Split('/');
            String fecha_base = cadena[2] + '-' + cadena[1] + '-' + cadena[0];
            objPaciente.fecha_nacimiento_paciente = fecha_base;
            objPaciente.contraseña_paciente = txtContraseñaRegistrarPaciente.Text;
            return objPaciente;
        }
     
    }
}