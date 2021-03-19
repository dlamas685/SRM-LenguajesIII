using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Horarios
    {
        public int id_horario { get; set; }

        public Medico medico { get; set; }
        public String fecha_atencion { get; set; }
        public String hora_inicio { get; set; }
        public String hora_fin { get; set; }
        public Empleado empleado { get; set; }

        public Horarios()
        {

        }
    }
}
