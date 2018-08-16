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
    public partial class ucNewsAndEventDashBoard : System.Web.UI.UserControl
    {
        public EFNewsEvent efNewsEvent;
        string ErrorMessage = "";
        public NewsEvent newsEvent;
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
            rptrNewsEvent.DataSource = getNewsEventDetail();
            rptrNewsEvent.DataBind();
        }
        public List<NewsEvent> getNewsEventDetail()
        {
            List<NewsEvent> lstNewsEvent = new EFNewsEvent().getNewsEventDetail();
            return lstNewsEvent;
        }
    }
}