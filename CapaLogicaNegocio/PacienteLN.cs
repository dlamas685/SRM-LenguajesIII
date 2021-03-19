using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaAccesoDatos;

namespace CapaLogicaNegocio
{
    public class PacienteLN
    {

        //LOGICA DE NEGOCIO PARA REGISTRAR PACIENTES
        public bool registrarPaciente(Paciente objPaciente)
        {
            try
            {
                return new PacienteDAO().registrarPaciente(objPaciente);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


        //INICIAR SESION

        public Paciente iniciarSesionPaciente(String email, String contraseña)
        {
            try
            {

                return new PacienteDAO().iniciarSesionPaciente(email, contraseña);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public Paciente traerDatosPaciente(String email)
        {
            try
            {
                return new PacienteDAO().traerDatosPaciente(email);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool ModificarPaciente(Paciente objPaciente)
        {

            try
            {
                return new PacienteDAO().ModificarPaciente(objPaciente);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
