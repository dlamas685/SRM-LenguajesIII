using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using CapaEntidades;
using CapaLogicaNegocio;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;

namespace CapaPresentacionExterna
{
    public partial class Configuracion_Paciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                String email = Page.User.Identity.Name;
                Paciente objPaciente = new PacienteLN().traerDatosPaciente(email);
                if (objPaciente != null)
                {
                    txtNombreModificarPaciente.Text = objPaciente.nombre_paciente;
                    txtApellidoModificarPaciente.Text = objPaciente.apellido_paciente;
                    txtDireccionModificarPaciente.Text = objPaciente.direccion_paciente;
                    txtDniModificarPaciente.Text = objPaciente.dni_paciente;
                    txtEmailModificarPaciente.Text = objPaciente.email_paciente;
                    hfFechaNacimiento.Value = objPaciente.fecha_nacimiento_paciente;
                    string ruta1;
                    string ruta2;
                    ruta1 = HttpContext.Current.Server.MapPath("~/Fotos/masculino.jpg");
                    ruta2 = HttpContext.Current.Server.MapPath("~/Fotos/femenino.jpg");
                    byte[] fotoMasculina = File.ReadAllBytes(ruta1);
                    byte[] fotoFemenina = File.ReadAllBytes(ruta2);
                    //byte[] fotoMasculina = File.ReadAllBytes("D:/Usuario/Universidad/Proyectos/SRM/CapaPresentacionMedico/Fotos/masculino.jpg");
                    //byte[] fotoFemenina = File.ReadAllBytes("D:/Usuario/Universidad/Proyectos/SRM/CapaPresentacionMedico/Fotos/femenino.jpg");
                    if (Convert.ToBase64String(fotoMasculina).Equals(Convert.ToBase64String(objPaciente.foto_paciente)) || Convert.ToBase64String(fotoFemenina).Equals(Convert.ToBase64String(objPaciente.foto_paciente)))
                    {
                        txtImagenModificarPaciente.Value = "Sin foto";
                    }
                    txtTelefonoModificarPaciente.Text = objPaciente.telefono_paciente;
                    imagenModificarPaciente.Src = "data:image/jpg;base64," + Convert.ToBase64String(objPaciente.foto_paciente);
                    if (objPaciente.sexo_paciente.Equals("M"))
                    {
                        selectSexoModificarPaciente.SelectedIndex = 2;
                    }
                    else
                    {
                        selectSexoModificarPaciente.SelectedIndex = 1;
                    }
                }
                else
                {
                    //SU SESION A CADUCADO VUELVA A INICIAR SESION.
                }
            }
        }

        protected void btnGuardarCambios_Click(object sender, EventArgs e)
        {
            Paciente objPaciente = obtenerDatosPaciente();
            if (objPaciente.email_paciente.Equals(""))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeModificarUsuarioInorrecto();", true);
            }
            else
            {
                bool respuesta = new PacienteLN().ModificarPaciente(objPaciente);
                if (respuesta == true)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeModificarUsuarioCorrecto();", true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeModificarUsuarioInorrecto();", true);
                }
            }
            

        }

        private Paciente obtenerDatosPaciente()
        {
            Paciente objPaciente = new Paciente();
            objPaciente.email_paciente = Page.User.Identity.Name;
            objPaciente.nombre_paciente = txtNombreModificarPaciente.Text;
            objPaciente.apellido_paciente = txtApellidoModificarPaciente.Text;
            objPaciente.telefono_paciente = txtTelefonoModificarPaciente.Text;
            objPaciente.direccion_paciente = txtDireccionModificarPaciente.Text;
            String sexo = selectSexoModificarPaciente.Items[selectSexoModificarPaciente.SelectedIndex].Text;
            if (sexo.Equals("Femenino"))
            {
                objPaciente.sexo_paciente = "F";
            }
            else
            {
                objPaciente.sexo_paciente = "M";
            }
            String fecha = txtFechaNacimientoModificarPaciente.Text;
            var vector = fecha.Split('/');
            String fecha_nacimiento = vector[2] + "-" + vector[1] + "-" + vector[0];
            objPaciente.fecha_nacimiento_paciente = fecha_nacimiento;
            int tamaño = fuploadFotoPaciente.PostedFile.ContentLength; 
            string ruta;
            byte[] fotoPaciente;
            if (txtImagenModificarPaciente.Value.Equals(""))
            {
                objPaciente.foto_paciente = null;
            }
            else
            {
                if (txtImagenModificarPaciente.Value.Equals("Sin foto"))
                {
                    if (sexo.Equals("Masculino"))
                    {
                        ruta = HttpContext.Current.Server.MapPath("~/Fotos/masculino.jpg");
                        fotoPaciente = File.ReadAllBytes(ruta);
                        //fotoPaciente = File.ReadAllBytes("C:/Users/gisel/Desktop/Lenguajes/CapaPresentacion/Fotos/masculino.jpg");
                        //fotoPaciente = File.ReadAllBytes("D:/Usuario/Universidad/Proyectos/SRM/CapaPresentacionMedico/Fotos/masculino.jpg");
                    }
                    else
                    {
                        ruta = HttpContext.Current.Server.MapPath("~/Fotos/femenino.jpg");
                        fotoPaciente = File.ReadAllBytes(ruta);
                        //fotoPaciente = File.ReadAllBytes("C:/Users/gisel/Desktop/Lenguajes/CapaPresentacion/Fotos/femenino.jpg");
                        //fotoPaciente = File.ReadAllBytes("D:/Usuario/Universidad/Proyectos/SRM/CapaPresentacionMedico/Fotos/femenino.jpg");
                    }
                }
                else
                {
                    fotoPaciente = new byte[tamaño];
                    fuploadFotoPaciente.PostedFile.InputStream.Read(fotoPaciente, 0, tamaño);
                }
                objPaciente.foto_paciente = fotoPaciente;
            }
            return objPaciente;


        }
    }
}