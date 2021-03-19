using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class DetalleHorarios
    {
        public int id_horario_hora { get; set; }

        public Horarios horario { get; set; }

        public String hora { get; set; }

        public String estado_hora { get; set; }

        public String situacion_hora { get; set; }

        public DetalleHorarios()
        {

        }

    }
}
