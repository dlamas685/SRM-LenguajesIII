using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaLogicaNegocio;
using CapaEntidades;
using System.IO;
using System.Drawing;

namespace CapaPresentacionInterna
{
    public partial class ABM_Medicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]

        public static List<Especialidad> ListarEspecialidades()
        {
            List<Especialidad> ListaEspecialidad = null;

            try
            {
                ListaEspecialidad = new MedicoLN().ListarEspecialidades();
            }
            catch (Exception ex)
            {
                ListaEspecialidad = null;
                throw ex;
            }

            return ListaEspecialidad;
        }

        protected void btnRegistrarMedico_Click(object sender, EventArgs e)
        {
            Medico objMedico = obtenerDatosMedico();
            bool respuesta = new MedicoLN().RegistrarMedico(objMedico);

            if (respuesta == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeMedicoCorrecto();", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeMedicoIncorrecto();", true);
            }

        }

        private Medico obtenerDatosMedico()
        {
            Medico objMedico = new Medico();

            objMedico.nombre_medico = txtNombreRegistrarMedico.Text;
            objMedico.apellido_medico = txtApellidoRegistrarMedico.Text;
            objMedico.cuil_medico = txtCuilRegistrarMedico.Text;
            objMedico.telefono_medico = txtTelefonoRegistrarMedico.Text;
            objMedico.descripcion_medico = txtDescripcionRegistrarMedico.Text;
            String fecha = txtFechaNacimientoRegistrarMedico.Text;
            var vector = fecha.Split('/');
            objMedico.fecha_nacimiento_medico = vector[2] + "-" + vector[1] + "-" + vector[0];
            String dni = txtCuilRegistrarMedico.Text;
            var v = dni.Split('-');
            objMedico.dni_medico = v[1];
            String sexo = selectSexoRegistrarMedico.Items[selectSexoRegistrarMedico.SelectedIndex].Text;
            if (sexo.Equals("Femenino"))
            {
                objMedico.sexo_medico = "F";
            }
            else
            {
                objMedico.sexo_medico = "M";
            }

            objMedico.especialidad = new Especialidad();
            objMedico.especialidad.id_especialidad = Convert.ToInt32(hfIdEspecialidad.Value);
            int tamaño = fuploadFotoMedico.PostedFile.ContentLength;
            string ruta;
            byte[] fotoMedico;
            if (tamaño == 0)
            {
                if (sexo.Equals("Masculino"))
                {
                    ruta = HttpContext.Current.Server.MapPath("~/Fotos/masculino.jpg");
                    fotoMedico = File.ReadAllBytes(ruta);
                    //fotoMedico = File.ReadAllBytes("C:/Users/gisel/Desktop/Lenguajes/CapaPresentacion/Fotos/masculino.jpg");
                    //fotoMedico = File.ReadAllBytes("D:/Usuario/Universidad/Proyectos/SRM/CapaPresentacionMedico/Fotos/masculino.jpg");
                }
                else
                {
                    ruta = HttpContext.Current.Server.MapPath("~/Fotos/femenino.jpg");
                    fotoMedico = File.ReadAllBytes(ruta);
                    //fotoMedico = File.ReadAllBytes("C:/Users/gisel/Desktop/Lenguajes/CapaPresentacion/Fotos/femenino.jpg");
                    //fotoMedico = File.ReadAllBytes("D:/Usuario/Universidad/Proyectos/SRM/CapaPresentacionMedico/Fotos/femenino.jpg");
                }
            }
            else
            {
                fotoMedico = new byte[tamaño];
                fuploadFotoMedico.PostedFile.InputStream.Read(fotoMedico, 0, tamaño);
            }

            objMedico.foto_medico = fotoMedico;
            objMedico.empleado = new Empleado();
            string nombreUsuario = Page.User.Identity.Name;
            objMedico.empleado.usuario_empleado = nombreUsuario;
            return objMedico;
        }


        [WebMethod]

        public static List<Medico> ListarMedicos()
        {
            List<Medico> ListaMedicos = null;

            try
            {
                ListaMedicos = new MedicoLN().ListarMedicos();
            }
            catch (Exception ex)
            {
                ListaMedicos = null;
                throw ex;
            }

            return ListaMedicos;
        }

        [WebMethod]

        public static bool EliminarMedico(String id)
        {
            int id_medico = Convert.ToInt32(id.ToString());
            bool respuesta = new MedicoLN().EliminarMedico(id_medico);
            return respuesta;
        }

        protected void btnModificarMedico_Click(object sender, EventArgs e)
        {
            Medico objMedico = obtenerDatosMedicoModificar();
            bool respuesta = new MedicoLN().ModificarMedico(objMedico);
            if (respuesta == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "click", "MensajeCorrectoModificarMedico();", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "click", " MensajeIncorrectoModificarMedico();", true);
            }
        }


        private Medico obtenerDatosMedicoModificar()
        {
            Medico objMedico = new Medico();
            objMedico.id_medico = Convert.ToInt32(hfIdMedico.Value);
            objMedico.nombre_medico = txtNombreMedicoModificar.Text;
            objMedico.apellido_medico = txtApellidoMedicoModificar.Text;
            objMedico.cuil_medico = txtCuilMedicoModificar.Text;
            objMedico.telefono_medico = txtTelefonoMedicoModificar.Text;
            objMedico.descripcion_medico = txtDescripcionMedicoModificar.Text;
            String fecha = txtFechaNacimientoMedicoModificar.Text;
            var vector = fecha.Split('/');
            objMedico.fecha_nacimiento_medico = vector[2] + "-" + vector[1] + "-" + vector[0];
            String dni = txtCuilMedicoModificar.Text;
            var v = dni.Split('-');
            objMedico.dni_medico = v[1];
            String sexo = selectSexoMedicoModificar.Items[selectSexoMedicoModificar.SelectedIndex].Text;
            if (sexo.Equals("Femenino"))
            {
                objMedico.sexo_medico = "F";
            }
            else
            {
                objMedico.sexo_medico = "M";
            }

            objMedico.especialidad = new Especialidad();
            objMedico.especialidad.id_especialidad = Convert.ToInt32(hfIdEspecialidadModificar.Value);
            int tamaño = fuploadMedicoModificar.PostedFile.ContentLength;
            string ruta;
            byte[] fotoMedico;
            if (txtImagenModificar.Value.Equals("")) {
                objMedico.foto_medico = null;
            }
            else
            {
                if (txtImagenModificar.Value.Equals("Sin foto")){
                    if (sexo.Equals("Masculino"))
                    {
                        ruta = HttpContext.Current.Server.MapPath("~/Fotos/masculino.jpg");
                        fotoMedico = File.ReadAllBytes(ruta);
                        //fotoMedico = File.ReadAllBytes("C:/Users/gisel/Desktop/Lenguajes/CapaPresentacion/Fotos/masculino.jpg");

                        //fotoMedico = File.ReadAllBytes("D:/Usuario/Universidad/Proyectos/SRM/CapaPresentacionMedico/Fotos/masculino.jpg");
                    }
                    else
                    {
                        ruta = HttpContext.Current.Server.MapPath("~/Fotos/femenino.jpg");
                        fotoMedico = File.ReadAllBytes(ruta);

                        //fotoMedico = File.ReadAllBytes("C:/Users/gisel/Desktop/Lenguajes/CapaPresentacion/Fotos/femenino.jpg");
                        //fotoMedico = File.ReadAllBytes("D:/Usuario/Universidad/Proyectos/SRM/CapaPresentacionMedico/Fotos/femenino.jpg");
                    }
                }
                else
                {                   
                    fotoMedico = new byte[tamaño];
                    fuploadMedicoModificar.PostedFile.InputStream.Read(fotoMedico, 0, tamaño);
                }
                objMedico.foto_medico = fotoMedico;
            }

            return objMedico;
        }
    }
}