using BALNDAL;
using BALNDAL.EFOperation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebKarachiNimco.App_Class;


namespace WebKarachiNimco.Forms.UserControl
{
    public partial class ucContactPerson : System.Web.UI.UserControl
    {
        public EFContactPerson efcontactPerson;
        string ErrorMessage = "";
        public ContactPerson ContactPerson;
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
        protected void btnSave_Click(object sender, EventArgs e)
        {
            ContactPerson contactPerson = formToObject();
            bool result = new EFContactPerson().saveContactPerson(ref contactPerson, ref ErrorMessage, SessionHelper.getUserSession().userid);
            if (result)
            {
                saveImage(contactPerson.ContactPersonId);

                lblMessage.Text = "";
                FormReset();
                FormLoad();
                MisOp.ShowMessage(this, "The Record has been saved", "Contact Person ", true);
                //return;
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
            txtContactEmail.Text = "";
            txtContactName.Text = "";
            txtContactNumber.Text = "";
            txtContactPersonDepartment.Text = "";
            lblMessage.Text = "";
            lblContactPersonId.Text = "";
            lblMode.Text = "";
            imgFileUpload.ImageUrl = "";
        }

        protected void rptrContactPerson_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToUpper() == "CONTACTPERSONDELETE")
            {
                if (deleteContactPerson(Convert.ToInt32(e.CommandArgument.ToString())))
                {
                    FormReset();
                    FormLoad();
                }
            }
            else if (e.CommandName == "CONTACTPERSONEDIT")
            {
                ContactPerson = getContactPersonByContactPersonId(Convert.ToInt32(e.CommandArgument.ToString()));
                if (ContactPerson != null)
                {
                    ObjectToForm(ContactPerson);
                    // btnCancel.Visible = true;
                    //btnBack.Visible = false;
                }
            }
        }
        public bool deleteContactPerson(int contactPersonId)
        {
            return new EFContactPerson().deleteContactPerson(contactPersonId, ref ErrorMessage, SessionHelper.getUserSession().userid);
        }
        public ContactPerson getContactPersonByContactPersonId(int contactPersonId)
        {
            return new EFContactPerson().getContactPersonByContactPersonId(contactPersonId);
        }
        private void ObjectToForm(ContactPerson contactPerson)
        {
            txtContactEmail.Text = contactPerson.ContactEmail;
            txtContactName.Text = contactPerson.ContactName;
            txtContactNumber.Text = contactPerson.contactNumber;
            txtContactPersonDepartment.Text = contactPerson.ContactPersonDepartment;
            txtOrderNo.Text = contactPerson.OrderNumber.ToString();
            lblContactPersonId.Text = contactPerson.ContactPersonId.ToString();

            if (contactPerson.ImageUrl != null && contactPerson.ImageUrl != "")
            {
                imgFileUpload.ImageUrl = AppConfigSetting.contactPerson + contactPerson.ContactPersonId + contactPerson.ImageUrl;
            }
        }
        public ContactPerson formToObject()
        {
            ContactPerson contactPerson = new ContactPerson();
            contactPerson.ContactEmail = txtContactEmail.Text;
            contactPerson.ContactName = txtContactName.Text;
            contactPerson.contactNumber = txtContactNumber.Text;
            contactPerson.ContactPersonDepartment = txtContactPersonDepartment.Text;
            contactPerson.OrderNumber = Convert.ToInt32(txtOrderNo.Text);
            contactPerson.IsActive = true;
            if (lblContactPersonId.Text != "")
            {
                contactPerson.ContactPersonId = Convert.ToInt32(lblContactPersonId.Text);
            }
            if (fuplContactPerson.HasFile)
            {
                contactPerson.ImageUrl = Path.GetExtension(fuplContactPerson.FileName);
            }
            return contactPerson;
        }
        public void saveImage(int id)
        {
            if (fuplContactPerson.HasFile)
            {
                try
                {
                    string extension = Path.GetExtension(fuplContactPerson.FileName);
                    string filename = Path.GetFileName(fuplContactPerson.FileName);
                    fuplContactPerson.SaveAs(Server.MapPath("" + AppConfigSetting.contactPerson) + id + extension);
                }
                catch (Exception ex)
                {
                }
            }
        }
    }
}