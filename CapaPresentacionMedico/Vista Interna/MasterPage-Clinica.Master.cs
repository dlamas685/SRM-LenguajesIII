
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;

namespace CapaPresentacion.Vista_Interna
{
    public partial class MasterPage_Clinica : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserSessionObjeto"] != null)
            {
                Empleado objEmpleado = (Empleado)Session["UserSessionObjeto"];

               
                string imagenPerfil = "data:image/jpg;base64," + Convert.ToBase64String(objEmpleado.foto_empleado);

               
            }
        }
    }
}