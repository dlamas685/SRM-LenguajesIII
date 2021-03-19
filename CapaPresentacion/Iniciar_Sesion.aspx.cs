using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using CapaEntidades;
using CapaLogicaNegocio;
using CapaPresentacionExterna.Custom;

namespace CapaPresentacionExterna
{
    public partial class Login : BasePage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session["UserSession"] = null;
            }

        }

        protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
        {

            bool auth = Membership.ValidateUser(LoginUser.UserName, LoginUser.Password);

            if (auth)
            {
                Paciente objPaciente = new PacienteLN().iniciarSesionPaciente(LoginUser.UserName, LoginUser.Password);

                if (objPaciente != null)
                {
                    SessionManager = new SessionManager(Session);
                    SessionManager.UserSessionObjeto = objPaciente;

                    FormsAuthentication.RedirectFromLoginPage(LoginUser.UserName, false);
                }

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajePacienteIncorrecto();", true);
            }
        }
    }
}