using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaAccesoDatos;

namespace CapaLogicaNegocio
{
    public class MedicoLN
    {
        public List<Especialidad> ListarEspecialidades()
        {
            try
            {
                return new MedicoDAO().ListarEspecialidades();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }


        public List<Medico> ListarMedicos()
        {
            try
            {

                return new MedicoDAO().ListarMedicos();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public bool RegistrarMedico(Medico objMedico)
        {

            try
            {
                return new MedicoDAO().RegistrarMedico(objMedico);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Medico TraerDatosMedico(int id_medico)
        {
            try
            {
                return new MedicoDAO().TraerDatosMedico(id_medico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool EliminarMedico(int id_medico)
        {
            try
            {
                return new MedicoDAO().EliminarMedico(id_medico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool ModificarMedico(Medico objMedico)
        {
            try
            {
                return new MedicoDAO().ModificarMedico(objMedico);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Medico> ListarMedicosConFechasDefinidas()
        {
            try
            {
                return new MedicoDAO().ListarMedicosConFechasDefinidas();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Medico> ListarMedicosEspecialidadFechas(int id_especialidad, String fecha_inicio, String fecha_fin)
        {
            try
            {
                return new MedicoDAO().ListarMedicosEspecialidadFechas(id_especialidad, fecha_inicio,fecha_fin);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
