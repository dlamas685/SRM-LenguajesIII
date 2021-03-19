using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaLogicaNegocio;

namespace CapaPresentacionInterna
{
    public partial class Crear_agenda_diaria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<Horarios> TraerFechasMedico(String id_medico)
        {
            Int32 id = Convert.ToInt32(id_medico);
            List<Horarios> ListaFechas = null;
            try
            {
                ListaFechas = new HorariosLN().TraerFechasMedico(id);
            }
            catch (Exception ex)
            {
                ListaFechas = null;
                throw ex;
            }
            return ListaFechas;
        }

        [WebMethod]
        public static List<Medico> ListarMedicosConFechasDefinidas()
        {
            List<Medico> ListaMedicos = null;
            try
            {
                ListaMedicos = new MedicoLN().ListarMedicosConFechasDefinidas();
            }
            catch (Exception ex)
            {
                ListaMedicos = null;
                throw ex;
            }
            return ListaMedicos;
        }

        [WebMethod]
        public static Horarios TraerHorariosEntradaSalida(String id_horario)
        {
            int id = Convert.ToInt32(id_horario.ToString());
            Horarios objHorario = null;
            try
            {
                objHorario = new HorariosLN().TraerHorariosEntradaSalida(id);
            }
            catch (Exception ex)
            {
                objHorario = null;
                throw ex;
            }
            return objHorario;
        }

        [WebMethod]
        public static List<DetalleHorarios> ListarHorasFecha(String id_horario)
        {
            int id = Convert.ToInt32(id_horario.ToString());
            List<DetalleHorarios> DetallesHorario = null;
            try
            {
                DetallesHorario = new HorariosLN().ListarHorasFecha(id);
            }
            catch (Exception ex)
            {
                DetallesHorario = null;
                throw ex;
            }
            return DetallesHorario;
        }

        [WebMethod]
        public static bool DeshabilitarHorarioFecha(String id_horario, String id_horario_hora)
        {
            int idHorario = Convert.ToInt32(id_horario.ToString());
            int idHorarioHora = Convert.ToInt32(id_horario_hora.ToString());
            bool respuesta = new HorariosLN().DeshabilitarHorarioFecha(idHorarioHora, idHorario);
            return respuesta;
        }

        [WebMethod]
        public static bool HabilitarHorarioFecha(String id_horario, String id_horario_hora)
        {
            int idHorario = Convert.ToInt32(id_horario.ToString());
            int idHorarioHora = Convert.ToInt32(id_horario_hora.ToString());
            bool respuesta = new HorariosLN().HabilitarHorarioFecha(idHorarioHora, idHorario);
            return respuesta;
        }

    }
}