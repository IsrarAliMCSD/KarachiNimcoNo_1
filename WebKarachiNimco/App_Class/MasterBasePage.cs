using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace WebKarachiNimco.App_Class
{
    public class MasterBasePage : System.Web.UI.Page
    {
        protected virtual void Page_Load(object sender, EventArgs e)
        {

            if (Session[SessionNames.S_User.ToString()] == null)
            {
                Response.Redirect("~/Forms/login.aspx", true);
            }
            else
            {

                if (Session[SessionNames.S_User.ToString()] == null)
                {

                }
            }
        }
    }
}