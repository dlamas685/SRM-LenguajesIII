using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacionInterna
{
    public partial class MasterPage_Interna : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserSessionObjeto"] != null)
            {
                Empleado objEmpleado = (Empleado)Session["UserSessionObjeto"];

                lblEmpleado.Text = objEmpleado.apellido_empleado + " " + objEmpleado.nombre_empleado;

                lblIdEmpleado.Text = Convert.ToString(objEmpleado.id_empleado);

                string imagenPerfil = "data:image/jpg;base64," + Convert.ToBase64String(objEmpleado.foto_empleado);

                imgFotoEmpleado.Src = imagenPerfil;

            }
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Redirect("Login_Interno.aspx");
        }
    }
}