using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebKarachiNimco.App_Class;

namespace WebKarachiNimco.Forms.Admin
{
    public partial class Admin_Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session[SessionNames.S_User.ToString()] == null)
            {
                Response.Redirect("~/Forms/Login.aspx", true);
            }
            if (!IsPostBack)
            {
                lblLoginUserName.Text = "Welcome " + SessionHelper.getUserSession().userName;
            }
        }

        protected void btnSignout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Forms/Home.aspx");
 
        }
    }
}