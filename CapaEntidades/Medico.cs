using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Medico
    {
        public int id_medico { get; set; }
        public Especialidad especialidad { get; set; }
        public Empleado empleado { get; set; }
        public byte[] foto_medico { get; set; }
        public String foto_medico_url { get; set; }
        public String nombre_medico { get; set; }
        public String apellido_medico { get; set; }
        public String cuil_medico { get; set; }
        public String dni_medico { get; set; }
        public String telefono_medico { get; set; }
        public String sexo_medico { get; set; }
        public String fecha_nacimiento_medico { get; set; }
        public int edad_medico { get; set; }
        public String descripcion_medico { get; set; }

        public String estado_foto_medico { get; set; }
        public Medico()
        {

        }
    }
}
