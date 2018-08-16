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
    public partial class ucContactDetailView : System.Web.UI.UserControl
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
            GetAllControlDetail();
        }
        public void GetAllControlDetail()
        {
            rptrContactDetail.DataSource = GetAllContactDetails();
            rptrContactDetail.DataBind();
        }
        public List<ContactDetail> GetAllContactDetails()
        {
            List<ContactDetail> lstContactDetail = new EFContactDetail().GetAllContactDetails();
            return lstContactDetail;


        }
    }
}