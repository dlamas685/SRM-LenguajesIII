using CapaEntidades;
using CapaLogicaNegocio;
using CapaPresentacionInterna.Custom;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacionInterna
{
    public partial class Login_Interno : BasePage
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
                Empleado objEmpleado = new EmpleadoLN().iniciarSesionEmpleado(LoginUser.UserName, LoginUser.Password);

                if (objEmpleado != null)
                {
                    SessionManager = new SessionManager(Session);
                    SessionManager.UserSessionObjeto = objEmpleado;
                    FormsAuthentication.RedirectFromLoginPage(LoginUser.UserName, false);
                }

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeEmpleadoIncorrecto();", true);
            }
        }
    }
}