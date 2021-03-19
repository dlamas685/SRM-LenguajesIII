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
    public partial class Ver_Horarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<Horarios> ListarHorariosMedicoRangoFecha(String id_medico,String fecha_inicio, String fecha_fin)
        {
            Int32 id = Convert.ToInt32(id_medico);
            List<Horarios> ListaHorariosMedico = null;
            try
            {
                ListaHorariosMedico = new HorariosLN().ListarHorariosMedicoRangoFecha(id, fecha_inicio, fecha_fin);
            }
            catch (Exception ex)
            {
                ListaHorariosMedico = null;
                throw ex;
            }
            return ListaHorariosMedico;
        }

        [WebMethod]

        public static bool EliminarHorarioMedico(String id_medico, String id_horario)
        {
            int idMedico = Convert.ToInt32(id_medico.ToString());
            int idHorario = Convert.ToInt32(id_horario.ToString());
            bool respuesta = new HorariosLN().EliminarHorarioMedico(idMedico,idHorario);
            return respuesta;
        }

    }
}