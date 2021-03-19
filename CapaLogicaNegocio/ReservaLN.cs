using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaAccesoDatos;
using CapaEntidades;

namespace CapaLogicaNegocio
{
    public class ReservaLN
    {
        public bool RegistrarReserva(Reserva objReserva, int id_horario_hora)
        {

            try
            {
                return new ReservaDAO().RegistrarReserva(objReserva,id_horario_hora);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public List<Reserva> ListarReservasPendientes()
        {
            try
            {
                return new ReservaDAO().ListarReservasPendientes();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool ConfirmarReserva(Reserva objReserva)
        {

            try
            {
                return new ReservaDAO().ConfirmarReserva(objReserva);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


        public bool RechazarReserva(Reserva objReserva)
        {
            try
            {
                return new ReservaDAO().RechazarReserva(objReserva);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public List<Reserva> ListarReservasRechazadas()
        {

            try
            {
                return new ReservaDAO().ListarReservasRechazadas();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Reserva> ListarReservasConfirmadas()
        {

            try
            {
                return new ReservaDAO().ListarReservasConfirmadas();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Reserva> ListarReservasPaciente(int id_paciente)
        {
            try
            {
                return new ReservaDAO().ListarReservasPaciente(id_paciente);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public bool CancelarReserva(Reserva objReserva)
        {

            try
            {
                return new ReservaDAO().CancelarReserva(objReserva);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Reserva> ListarReservasTop()
        {

            try
            {
                return new ReservaDAO().ListarReservasTop();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Cantidades TraerCantidades()
        {
            try
            {
                return new ReservaDAO().TraerCantidades();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
