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
    public partial class Reservas_Rechazadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static List<Reserva> ListarReservasRechazadas()
        {
            List<Reserva> ListaReservas = null;

            try
            {
                ListaReservas = new ReservaLN().ListarReservasRechazadas();
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