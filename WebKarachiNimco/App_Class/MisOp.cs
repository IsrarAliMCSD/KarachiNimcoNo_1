using BALNDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace WebKarachiNimco.App_Class
{
    public static class AppConfigSetting
    {
        public const string historyUrl = "/Images/AboutUs/";
        public const string contactPerson = "/Images/ContactPerson/";
        public const string homeSliderUrl = "/Images/HomeSlider/";
        public const string CategoryUrl = "/Images/Category/";
        public const string ProductUrl = "/Images/Product/";

    }
    public class MisOp
    {
        public static void ShowMessage(ref UpdatePanel UpdatePanelForm, string message, bool IsError)
        {
            ScriptManager.RegisterStartupScript(UpdatePanelForm, UpdatePanelForm.GetType(), "JScript1",
                "ShowMessage('" + message.Replace("'", "\"") + "'," + ((IsError == true) ? "true" : "false") + ");", true);
        }
        public static void ShowMessage(Control ctrl, string message, string messageTitle, bool IsError)
        {
            ScriptManager.RegisterStartupScript(ctrl, ctrl.GetType(), "JScript1", "ShowMessage('" + message.Replace("'", "\"") + "', '" + messageTitle + "'," + ((IsError == true) ? "true" : "false") + ");", true);
        }
        public static void ClearMessage(ref UpdatePanel UpdatePanelForm)
        {
            ScriptManager.RegisterStartupScript(UpdatePanelForm, UpdatePanelForm.GetType(), "JScript1", "ClearMessage();", true);
        }
       
    }
    public class UserSession
    {
        public int userid { get; set; }
        public string userName { get; set; }
        //public string emailAddress { get; set; }
        //public string AccountTye { get; set; }
    }
    public enum SessionNames
    {
        S_User
    }
    public class SessionHelper
    {
        public static UserSession getUserSession()
        {
          ///  UserSession usersesion = new App_Class.UserSession();
            //usersesion.userid = 1;
            //usersesion.userName = "israr";
            //HttpContext.Current.Session[SessionNames.S_User.ToString()] = usersesion;
            return ((UserSession)HttpContext.Current.Session[SessionNames.S_User.ToString()]);
        }

    }
}