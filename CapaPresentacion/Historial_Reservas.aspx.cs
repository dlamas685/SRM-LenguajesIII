using CapaEntidades;
using CapaLogicaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacionExterna
{
    public partial class Historial_Reservas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static List<Reserva> ListarReservasPaciente(String id_paciente)
        {
            List<Reserva> ListaReservas = null;
            int id = Convert.ToInt32(id_paciente.ToString());
            try
            {
                ListaReservas = new ReservaLN().ListarReservasPaciente(id);
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