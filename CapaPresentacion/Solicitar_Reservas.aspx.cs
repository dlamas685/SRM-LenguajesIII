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
    public partial class Listar_Medicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]

        public static List<Especialidad> ListarEspecialidades()
        {
            List<Especialidad> ListaEspecialidad = null;

            try
            {
                ListaEspecialidad = new MedicoLN().ListarEspecialidades();
            }
            catch (Exception ex)
            {
                ListaEspecialidad = null;
                throw ex;
            }

            return ListaEspecialidad;
        }


        [WebMethod]
        public static List<Medico> ListarMedicosEspecialidadFechas(String IdEspecialidad, String fecha_inicio, String fecha_fin)
        {
            List<Medico> ListaMedicos = null;
            int id_especialidad = Convert.ToInt32(IdEspecialidad.ToString());
            try
            {
                ListaMedicos = new MedicoLN().ListarMedicosEspecialidadFechas(id_especialidad, fecha_inicio, fecha_fin);
            }
            catch (Exception ex)
            {
                ListaMedicos = null;
                throw ex;
            }

            return ListaMedicos;
        }

        [WebMethod]
        public static List<Horarios> TraerFechasMedicoRango(String id_medico, String fecha_inicio, String fecha_fin)
        {
            Int32 id = Convert.ToInt32(id_medico);
            List<Horarios> ListaFechas = null;
            try
            {
                ListaFechas = new HorariosLN().TraerFechasMedicoRango(id, fecha_inicio, fecha_fin);
            }
            catch (Exception ex)
            {
                ListaFechas = null;
                throw ex;
            }
            return ListaFechas;
        }

        [WebMethod]
        public static List<DetalleHorarios> ListarHorasFechaHabilitadas(String id_horario)
        {
            int id = Convert.ToInt32(id_horario.ToString());
            List<DetalleHorarios> DetallesHorario = null;
            try
            {
                DetallesHorario = new HorariosLN().ListarHorasFechaHabilitadas(id);
            }
            catch (Exception ex)
            {
                DetallesHorario = null;
                throw ex;
            }
            return DetallesHorario;
        }

        protected void btnRegistrarReserva_Click(object sender, EventArgs e)
        {
            Reserva objReserva = obtenerDatosReserva();
            String horarioHora = hfIdHorarioHora.Value;
            var vector = horarioHora.Split(' ');
            int id_horario_hora = Convert.ToInt32(vector[0].ToString());
            bool respuesta = new ReservaLN().RegistrarReserva(objReserva, id_horario_hora);
            if (respuesta == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeReservaCorrecta();", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "MensajeReservaIncorrecta();", true);
            }
        }

        private Reserva obtenerDatosReserva()
        {
            Reserva objReserva = new Reserva();

            if (txtConsultaSolicitarReserva.Text.Equals(""))
            {
                objReserva.consulta_reserva = "-";
            }
            else
            {
                objReserva.consulta_reserva = txtConsultaSolicitarReserva.Text;
            }
            objReserva.paciente = new Paciente();
            objReserva.paciente.email_paciente = Page.User.Identity.Name;
            objReserva.medico = new Medico();
            objReserva.medico.id_medico = Convert.ToInt32(hfIdMedico.Value);
            String hora = hfIdHorarioHora.Value;
            var vector = hora.Split(' ');
            objReserva.hora_reserva = vector[1];
            String fecha = hfIdHorario.Value;
            var vector2 = fecha.Split(' ');
            String fecha_registrar = vector2[1];
            var vector3 = fecha_registrar.Split('/');
            fecha_registrar = vector3[2] + "-" + vector3[1] + "-" + vector3[0];
            objReserva.fecha_reserva = fecha_registrar;
            return objReserva;
        }
    }
}