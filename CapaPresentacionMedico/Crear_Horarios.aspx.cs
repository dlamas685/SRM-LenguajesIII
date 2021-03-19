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
    public partial class Crear_Horarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static Medico TraerDatosMedico(String id_medico)
        {
            Int32 id = Convert.ToInt32(id_medico);
            Medico objMedico = new MedicoLN().TraerDatosMedico(id);
            return objMedico;
        }

        [WebMethod]
        public static List<Horarios> ListarHorariosMedico(String id_medico)
        {
            Int32 id = Convert.ToInt32(id_medico);
            List < Horarios > ListaHorariosMedico = null;
            try
            {
                ListaHorariosMedico = new HorariosLN().ListarHorariosMedico(id);
            }
            catch (Exception ex)
            {
                ListaHorariosMedico = null;
                throw ex;
            }
            return ListaHorariosMedico;
        }

        [WebMethod]

        public static bool RegistrarHorariosAtencion(String idMedico, String [] horariosMedico)
        {
            int id_medico = Convert.ToInt32(idMedico.ToString());
            int id_empleado = 1;
            bool respuesta = new HorariosLN().RegistrarHorariosAtencion(id_medico,horariosMedico, id_empleado);
            return respuesta;
        }
    }
}