using CapaEntidades;
using CapaLogicaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacionInterna
{
    public partial class Inicio_Pagina_Interna : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Cantidades objCantidades = new ReservaLN().TraerCantidades();
                lblCantReservas.Text = Convert.ToString(objCantidades.cantidad_reservas);
                lblCantPacientes.Text = Convert.ToString(objCantidades.cantidad_pacientes);
                lblCantMedicos.Text = Convert.ToString(objCantidades.cantidad_medicos);
                lblCantEmpleados.Text = Convert.ToString(objCantidades.cantidad_empleados);
            }
        }

        [WebMethod]
        public static List<Reserva> ListarReservasTop()
        {
            List<Reserva> ListaReservas = null;

            try
            {
                ListaReservas = new ReservaLN().ListarReservasTop();
            }
            catch (Exception ex)
            {
                ListaReservas = null;
                throw ex;
            }

            return ListaReservas;
        }
    }
}