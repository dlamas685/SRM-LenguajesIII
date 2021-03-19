using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.SessionState;
using CapaEntidades;

namespace CapaPresentacionExterna.Custom
{
    public class SessionManager
    {
        #region variables
        private HttpSessionState _currentSession;
        #endregion

        public SessionManager(HttpSessionState session)
        {
            this._currentSession = session;
        }

        #region metodos
        private HttpSessionState CurrentSession
        {
            get { return this._currentSession; }
        }

        public string UserSession
        {
            set { CurrentSession["UserSession"] = value; }
            get { return (string)CurrentSession["UserSession"]; }
        }

        public Paciente UserSessionObjeto
        {
            set { CurrentSession["UserSessionObjeto"] = value; }
            get { return (Paciente)CurrentSession["UserSessionObjeto"]; }
        }
        #endregion
    }
}
