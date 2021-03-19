using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Paciente
    {
        public int id_paciente { get; set; }

        public byte[] foto_paciente { get; set; }

        public String nombre_paciente { get; set; }

        public String apellido_paciente { get; set; }

        public String dni_paciente { get; set; }

        public String fecha_nacimiento_paciente { get; set; }

        public String email_paciente { get; set; }

        public String contraseña_paciente { get; set; }

        public String telefono_paciente { get; set; }

        public String direccion_paciente { get; set; }

         public String sexo_paciente { get; set; }

        public Paciente()
        {

        }
    }
}
