using BALNDAL;
using BALNDAL.EFOperation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebKarachiNimco.App_Class;

namespace WebKarachiNimco.Forms.UserControl
{
    public partial class usAboutUsView : System.Web.UI.UserControl
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
            rptrAboutUs.DataSource = GetAboutsDetail();
            rptrAboutUs.DataBind();
        }
        public List<About> GetAboutsDetail()
        {
            List<About> lstAbout = new EFAboutUs().getAllAboutUs();
            foreach (var item in lstAbout)
            {
                item.Image = AppConfigSetting.historyUrl.ToString() + item.AboutUsId.ToString() + item.Image;
            }
            return lstAbout;
        }
    }
}