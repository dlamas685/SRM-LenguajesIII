using CapaEntidades;
using CapaLogicaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacionInterna
{
    public partial class Confirmar_Rechazar_Reservas : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod]
        public static List<Reserva> ListarReservasPendientes()
        {
            List<Reserva> ListaReservas = null;

            try
            {
                ListaReservas = new ReservaLN().ListarReservasPendientes();
            }
            catch (Exception ex)
            {
                ListaReservas = null;
                throw ex;
            }

            return ListaReservas;
        }

        protected void btnConfirmarReserva_Click(object sender, EventArgs e)
        {
            String email_paciente = txtEmailPacienteConfirmarReserva.Text;
            Reserva objReserva = obtenerDatosReserva();
            bool respuesta = new ReservaLN().ConfirmarReserva(objReserva);
            if (respuesta == true)
            {
                CCorreo objCorreo = new CCorreo(email_paciente, "CONFIRMACIÓN - SOLICITUD DE RESERVA", "Su reserva se ha confirmado l@ esperamos el " + txtFechaAtencionConfirmarReserva.Text + " a las " + txtHoraAtencionConfirmarReserva.Text + ". \r\nObservacion: " + txtDescripcionConfirmarReserva.Text + ". \r\nGracias por confiar en nosotros!!!");
                if (objCorreo.Estado)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeReservaConfirmada();", true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeReservaConfirmadaCorrectaCorreoFallido();", true);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeReservaConfirmadaIncorrecta();", true);
            }
        }

        private Reserva obtenerDatosReserva()
        {
            Reserva objReserva = new Reserva();
            objReserva.empleado = new Empleado();
            objReserva.empleado.usuario_empleado = Page.User.Identity.Name;
            objReserva.id_reserva = Convert.ToInt32(hfIdReserva.Value.ToString());
            objReserva.motivo_observacion_reserva = txtDescripcionConfirmarReserva.Text;

            return objReserva;
        }
        protected void btnRechazarReserva_Click(object sender, EventArgs e)
        {
            String email_paciente = txtEmailPacienteRechazoReserva.Text;
            Reserva objReserva = obtenerDatosReservaRechazar();
            bool respuesta = new ReservaLN().RechazarReserva(objReserva);
            if (respuesta == true)
            {
                CCorreo objCorreo = new CCorreo(email_paciente, "RECHAZO - SOLICITUD DE RESERVA", "Su reserva se ha rechazado. \r\nMotivo: " + txtMotivoRechazoReserva.Text + ". \r\nGracias por confiar en nosotros!!!");
                if (objCorreo.Estado)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeReservaRechazadaCorrecta();", true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeReservaRechazadaCorrectaSinCorreo();", true);
                }
               
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeReservaRechazadaIncorrecta();", true);
            }
        }


        private Reserva obtenerDatosReservaRechazar()
        {
            Reserva objReserva = new Reserva();
            objReserva.empleado = new Empleado();
            objReserva.empleado.usuario_empleado = Page.User.Identity.Name;
            objReserva.id_reserva = Convert.ToInt32(hfIdReserva.Value.ToString());
            objReserva.motivo_observacion_reserva = txtMotivoRechazoReserva.Text;         
            return objReserva;
        }


    }
}