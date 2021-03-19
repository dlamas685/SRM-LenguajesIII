using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;

namespace CapaPresentacionExterna
{
    public partial class MasterPage_Externa : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserSessionObjeto"] != null)
            {
                Paciente objPaciente = (Paciente)Session["UserSessionObjeto"];

                lblUsuario.Text = objPaciente.email_paciente;

                spanIdPaciente.InnerHtml = Convert.ToString(objPaciente.id_paciente);

                string imagenPerfil = "data:image/jpg;base64," + Convert.ToBase64String(objPaciente.foto_paciente);

                imgFotoPaciente.Src = imagenPerfil;

            }
        }


        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Redirect("Iniciar_Sesion.aspx");
        }
    }
}