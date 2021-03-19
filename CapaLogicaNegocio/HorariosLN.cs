using CapaAccesoDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaLogicaNegocio
{
    public class HorariosLN
    {
        public List<Horarios> ListarHorariosMedico(int id_medico)
        {
            try
            {
                return new HorariosDAO().ListarHorariosMedico(id_medico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool RegistrarHorariosAtencion(int id_medico, String[] horariosMedico, int id_empleado)
        {
            try
            {
                return new HorariosDAO().RegistrarHorariosAtencion(id_medico,horariosMedico, id_empleado);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Horarios> ListarHorariosMedicoRangoFecha(int id_medico, String fecha_inicio, String fecha_fin)
        {

            try
            {
                return new HorariosDAO().ListarHorariosMedicoRangoFecha(id_medico, fecha_inicio, fecha_fin);

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public bool EliminarHorarioMedico(int id_medico, int id_horario)
        {
            try
            {
                return new HorariosDAO().EliminarHorarioMedico(id_medico, id_horario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Horarios> TraerFechasMedico(int id_medico)
        {
            try
            {
                return new HorariosDAO().TraerFechasMedico(id_medico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Horarios TraerHorariosEntradaSalida(int id_horario)
        {
            try
            {
                return new HorariosDAO().TraerHorariosEntradaSalida(id_horario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<DetalleHorarios> ListarHorasFecha(int id_horario)
        {

            try
            {
                return new HorariosDAO().ListarHorasFecha(id_horario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool DeshabilitarHorarioFecha(int id_horario_hora, int id_horario)
        {

            try
            {
                return new HorariosDAO().DeshabilitarHorarioFecha(id_horario_hora,id_horario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool HabilitarHorarioFecha(int id_horario_hora, int id_horario)
        {

            try
            {
                return new HorariosDAO().HabilitarHorarioFecha(id_horario_hora, id_horario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Horarios> TraerFechasMedicoRango(int id_medico, String fecha_inicio, String fecha_fin)
        {
            try
            {
                return new HorariosDAO().TraerFechasMedicoRango(id_medico, fecha_inicio, fecha_fin);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<DetalleHorarios> ListarHorasFechaHabilitadas(int id_horario)
        {

            try
            {
                return new HorariosDAO().ListarHorasFechaHabilitadas(id_horario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
