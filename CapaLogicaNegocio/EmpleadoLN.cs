using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaAccesoDatos;
using CapaEntidades;

namespace CapaLogicaNegocio
{
    public class EmpleadoLN
    {
        public Empleado iniciarSesionEmpleado(String usuario, String contraseña)
        {
            try
            {
                return new EmpleadoDAO().iniciarSesionEmpleado(usuario, contraseña);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public List<Empleado> ListarEmpleados()
        {
            try
            {
                return new EmpleadoDAO().ListarEmpleados();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool RegistrarEmpleado(Empleado objEmpleado)
        {
            try
            {
                return new EmpleadoDAO().RegistrarEmpleado(objEmpleado);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool EliminarEmpleado(int id_empleado)
        {
            try
            {
                return new EmpleadoDAO().EliminarEmpleado(id_empleado);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

     

    }
}
