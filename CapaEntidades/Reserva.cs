using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Reserva
    {
        public int id_reserva { get; set; }
        public Paciente paciente { get; set; }
        public Empleado empleado { get; set; }
        public Medico medico { get; set; }
        public String fecha_reserva { get; set; }
        public String hora_reserva { get; set; }
        public String consulta_reserva { get; set; }
        public String  motivo_observacion_reserva { get; set; }
        public String estado_reserva { get; set; }

        public Reserva()
        {

        }
    }
}
