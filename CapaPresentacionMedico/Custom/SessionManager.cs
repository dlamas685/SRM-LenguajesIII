using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.SessionState;
using CapaEntidades;

namespace CapaPresentacionInterna.Custom
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

        public Empleado UserSessionObjeto
        {
            set { CurrentSession["UserSessionObjeto"] = value; }
            get { return (Empleado)CurrentSession["UserSessionObjeto"]; }
        }
        #endregion
    }
}
