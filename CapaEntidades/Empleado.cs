using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
   public class Empleado
    {
        public int id_empleado { get; set; }

        public String nombre_empleado { get; set; }

        public String apellido_empleado { get; set; }

        public byte[] foto_empleado { get; set; }
        public String usuario_empleado { get; set; }
        public String contraseña_empleado { get; set; }

        public String fecha_creacion_empleado { get; set; }

        public String foto_empleado_url { get; set; }

        public Empleado()
        {

        }
    }
}
