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
    public partial class ucContactPersonView : System.Web.UI.UserControl
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
            rptrContactPerson.DataSource = GetContactPersonDetail();
            rptrContactPerson.DataBind();
        }
        public List<ContactPerson> GetContactPersonDetail()
        {
            List<ContactPerson> lstContactPerson = new EFContactPerson().getAllContactPerson();
            foreach (var item in lstContactPerson)
            {
                item.ImageUrl = AppConfigSetting.contactPerson.ToString() + item.ContactPersonId.ToString() + item.ImageUrl;
            }
            return lstContactPerson;
        }
    }
}