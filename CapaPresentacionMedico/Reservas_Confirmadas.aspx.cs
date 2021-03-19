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
    public partial class Reservas_Confirmadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        [WebMethod]
        public static List<Reserva> ListarReservasConfirmadas()
        {
            List<Reserva> ListaReservas = null;

            try
            {
                ListaReservas = new ReservaLN().ListarReservasConfirmadas();
            }
            catch (Exception ex)
            {
                ListaReservas = null;
                throw ex;
            }

            return ListaReservas;
        }

        protected void btnCancelarReserva_Click(object sender, EventArgs e)
        {
            String email_paciente = txtEmailPacienteCancelarReserva.Text;
            Reserva objReserva = obtenerDatosReservaCancelar();
            bool respuesta = new ReservaLN().CancelarReserva(objReserva);
            if (respuesta == true)
            {
                CCorreo objCorreo = new CCorreo(email_paciente, "CANCELACION - SOLICITUD DE RESERVA", "Su reserva se ha cancelado. \r\nMotivo: " + txtMotivoCancelarReserva.Text + ". \r\nGracias por confiar en nosotros!!!");
                if (objCorreo.Estado)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeReservaCanceladaCorrecta();", true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeReservaCanceladaCorrectaSinCorreo();", true);
                }

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeReservaCanceladaIncorrecta();", true);
            }
        }



        private Reserva obtenerDatosReservaCancelar()
        {
            Reserva objReserva = new Reserva();
            objReserva.empleado = new Empleado();
            objReserva.empleado.usuario_empleado = Page.User.Identity.Name;
            objReserva.id_reserva = Convert.ToInt32(hfIdReserva.Value.ToString());
            objReserva.motivo_observacion_reserva = txtMotivoCancelarReserva.Text;
            return objReserva;
        }
    }
}