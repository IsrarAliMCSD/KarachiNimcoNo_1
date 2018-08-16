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
    public partial class ucAboutUs : System.Web.UI.UserControl
    {
        public EFAboutUs aboutUs;
        string ErrorMessage = "";
        public About about;
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
        public List<About> GetAboutsDetail()
        {
            List<About> lstAbout = new EFAboutUs().getAllAboutUs();
            foreach (var item in lstAbout)
            {
                item.Image = AppConfigSetting.historyUrl.ToString() + item.AboutUsId.ToString() + item.Image;
            }
            return lstAbout;
        }
        public void fillRepeater()
        {
            rptrAboutUs.DataSource = GetAboutsDetail();
            rptrAboutUs.DataBind();

        }
        public About formToObject()
        {
            About about = new About();
            about.Title = txtTitle.Text;
            about.Description = txtDescription.Text;
            about.OrderNumber = Convert.ToInt32(txtOrderNo.Text);
            about.IsActive = true;
            if (lblAboutUsId.Text != "")
            {
                about.AboutUsId = Convert.ToInt32(lblAboutUsId.Text);
            }
            if (fuplAbout.HasFile)
            {
                about.Image = Path.GetExtension(fuplAbout.FileName);
            }
            return about;
        }
        public void saveImage(int id)
        {
            if (fuplAbout.HasFile)
            {
                try
                {
                    string extension = Path.GetExtension(fuplAbout.FileName);
                    string filename = Path.GetFileName(fuplAbout.FileName);
                    // string fileFormat = Path.GetFileName(fuplAbout.FileName);
                    fuplAbout.SaveAs(Server.MapPath("" + AppConfigSetting.historyUrl) + id + extension);

                    // StatusLabel.Text = "Upload status: File uploaded!";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    /// StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }
        public void FormReset()
        {
            txtTitle.Text = "";
            txtDescription.Text = "";
            txtOrderNo.Text = "";
           // lblMessage.Text = "";
            lblAboutUsId.Text = "";
            lblMode.Text = "";
            imgFileUpload.ImageUrl = "";
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            FormReset();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            About about = formToObject();
            bool result = new EFAboutUs().saveAbboutUs(ref about, ref ErrorMessage, SessionHelper.getUserSession().userid);
            if (result)
            {
                lblMessage.Text = "";
                saveImage(about.AboutUsId);
              
               
                FormReset();
                FormLoad();
                MisOp.ShowMessage(this, "The Record has been saved", "AboutUs ", true);
                //return;
            }
            else
            {
                lblMessage.Text = ErrorMessage;
            }



        }
        protected void rptrAboutUs_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToUpper() == "ABOUTUSDELETE")
            {
                if (DeleteAboutUsId(Convert.ToInt32(e.CommandArgument.ToString())))
                {
                    FormReset();
                    FormLoad();
                }
            }
            else if (e.CommandName == "ABOUTUSEDIT")
            {
                about = GetAboutUsByAboutUsId(Convert.ToInt32(e.CommandArgument.ToString()));
                if (about != null)
                {
                    ObjectToForm(about);
                    // btnCancel.Visible = true;
                    //btnBack.Visible = false;
                }
            }
        }

        private void ObjectToForm(About about)
        {
            // About about = new About();
            txtTitle.Text = about.Title;
            txtDescription.Text = about.Description;
            txtOrderNo.Text = about.OrderNumber.ToString();
            lblAboutUsId.Text = about.AboutUsId.ToString();

            if (about.Image != null && about.Image != "")
            {
                imgFileUpload.ImageUrl = AppConfigSetting.historyUrl + about.AboutUsId + about.Image;
            }
        }
        public About GetAboutUsByAboutUsId(int aboutUsId)
        {
            return new EFAboutUs().getByIdAboutUs(aboutUsId);
        }
        public bool DeleteAboutUsId(int aboutUsId)
        {
            return new EFAboutUs().deleteAboutUs(aboutUsId, ref ErrorMessage, SessionHelper.getUserSession().userid);
        }


    }
}