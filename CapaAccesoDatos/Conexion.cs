using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CapaAccesoDatos
{
    public class Conexion
    {
        public SqlConnection ConexionBD()
        {
            SqlConnection conexion = new SqlConnection();
            conexion.ConnectionString = GetConnectionString();
            return conexion;
        }
        public String GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["SRM-LENGUAJESIII-PRESENTAR"].ConnectionString;
            //return ConfigurationManager.ConnectionStrings["SRM-LENGUAJESIII-PRESENTAR"].ConnectionString;

        }
    }
}
