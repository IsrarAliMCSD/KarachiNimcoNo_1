using BALNDAL;
using BALNDAL.EFOperation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebKarachiNimco.Forms.UserControl
{
    public partial class ucNewsAndEventView : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FormLoad();
            }
        }
        public void FormLoad()
        {
            fillRepeater();
        }
        public void fillRepeater()
        {
            rptrEvent.DataSource = new EFNewsEvent().getNewsEventDetail("EVENT"); 
            rptrEvent.DataBind();

            rptrNews.DataSource = new EFNewsEvent().getNewsEventDetail("NEWS"); 
            rptrNews.DataBind();
        }
      
    }
}