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
    public partial class ucContactDetail : System.Web.UI.UserControl
    {
        public EFContactDetail efContactDetail;
        string ErrorMessage = "";
        public ContactDetail contactDetail;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            contactDetail = formToObject();
            bool result = new EFContactDetail().saveContactDetail(contactDetail, ref ErrorMessage, SessionHelper.getUserSession().userid);
            if (result)
            {
                lblMessage.Text = "";
                FormReset();
                FormLoad();
                MisOp.ShowMessage(this, "The Record has been saved", "Contact Detail ", true);
            }
            else
            {
                lblMessage.Text = ErrorMessage;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            FormReset();

        }
        public void FormReset()
        {
            txtContactDetailAddress.Text = "";
            txtContactNumber.Text = "";
            lblMessage.Text = "";
            lblContactDetailId.Text = "";
            lblMode.Text = "";
        }

        protected void rptrContactDetail_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToUpper() == "CONTROLDETAILDELETE")
            {
                if (deleteContactDetailById(Convert.ToInt32(e.CommandArgument.ToString())))
                {
                    FormReset();
                    FormLoad();
                }
            }
            else if (e.CommandName == "CONTROLDETAILEDIT")
            {
                contactDetail = getContactDetailById(Convert.ToInt32(e.CommandArgument.ToString()));
                if (contactDetail != null)
                {
                    ObjectToForm(contactDetail);
                    // btnCancel.Visible = true;
                    //btnBack.Visible = false;
                }
            }
        }
        private void ObjectToForm(ContactDetail contactDetail)
        {
            txtContactDetailAddress.Text = contactDetail.ContactDetailAddress;
            txtContactNumber.Text = contactDetail.ContactNumber;
            lblContactDetailId.Text = contactDetail.CntactDetailId.ToString();           
        }
        public bool deleteContactDetailById(int contactDetailId)
        {
            return new EFContactDetail().deleteContactDetailById(contactDetailId, ref ErrorMessage, SessionHelper.getUserSession().userid);
        }
        public ContactDetail getContactDetailById(int contactDetailId)
        {
            return new EFContactDetail().getContactDetailById(contactDetailId);
        }
        public ContactDetail formToObject()
        {
            ContactDetail contactDetail = new ContactDetail();
            contactDetail.ContactDetailAddress = txtContactDetailAddress.Text;
            contactDetail.ContactNumber = txtContactNumber.Text;
            contactDetail.IsActive = true;
            if (lblContactDetailId.Text != "")
            {
                contactDetail.CntactDetailId = Convert.ToInt32(lblContactDetailId.Text);
            }
            return contactDetail;
        }
    }
}