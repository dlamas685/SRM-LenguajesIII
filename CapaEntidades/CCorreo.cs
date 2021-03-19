using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class CCorreo
    {
        Boolean estado = true;
        String merror;
        public CCorreo(String destinatario, String asunto, String mensaje)
        {
            MailMessage correo = new MailMessage();
            SmtpClient protocolo = new SmtpClient();
            correo.To.Add(destinatario);
            correo.From = new MailAddress("dn.lamas1298@gmail.com", "FIMA", System.Text.Encoding.UTF8);
            correo.Subject = asunto;
            correo.SubjectEncoding = System.Text.Encoding.UTF8;
            correo.Body = mensaje;
            correo.BodyEncoding = System.Text.Encoding.UTF8;
            correo.IsBodyHtml = false;

            protocolo.Credentials = new System.Net.NetworkCredential("dn.lamas1298@gmail.com", "Da41053249");
            protocolo.Port = 587;
            protocolo.Host = "smtp.gmail.com";
            protocolo.EnableSsl = true;

            try
            {
                protocolo.Send(correo);
            }
            catch (SmtpException error)
            {
                estado = false;
                merror = error.Message.ToString();
            }
        }

        public Boolean Estado
        {
            get { return estado; }
        }
        public String mensaje_error
        {
            get { return merror; }
        }
    }
}
