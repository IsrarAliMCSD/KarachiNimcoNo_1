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
    public partial class ucHomeSlider : System.Web.UI.UserControl
    {
        public EFHomeSlider efHomeSlider;
        string ErrorMessage = "";
        public HomeSlider about;
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
        public List<HomeSlider> GetHomeSliderDetail()
        {
            List<HomeSlider> lstHomeSlider = new EFHomeSlider().getAllHomeSlider();
            foreach (var item in lstHomeSlider)
            {
                item.ImageURL = AppConfigSetting.homeSliderUrl.ToString() + item.HomeSliderId.ToString() + item.ImageURL;
            }
            return lstHomeSlider;
        }
        public void fillRepeater()
        {
            rptrHomeSlider.DataSource = GetHomeSliderDetail();
            rptrHomeSlider.DataBind();

        }
        public HomeSlider formToObject()
        {
            HomeSlider homeSlider = new HomeSlider();
            homeSlider.HomeSliderTitle = txtTitle.Text;
            homeSlider.HomSliderSubTitle = txtSubtitle.Text;
            homeSlider.OrderNumber = Convert.ToInt32(txtOrderNo.Text);
            homeSlider.IsActive = true;
            if (lblHomeSliderId.Text != "")
            {
                homeSlider.HomeSliderId = Convert.ToInt32(lblHomeSliderId.Text);
            }
            if (fuplHomeSlider.HasFile)
            {
                homeSlider.ImageURL = Path.GetExtension(fuplHomeSlider.FileName);
            }
            return homeSlider;
        }
        public void saveImage(int id)
        {
            if (fuplHomeSlider.HasFile)
            {
                try
                {
                    string extension = Path.GetExtension(fuplHomeSlider.FileName);
                    string filename = Path.GetFileName(fuplHomeSlider.FileName);
                    // string fileFormat = Path.GetFileName(fuplAbout.FileName);
                    fuplHomeSlider.SaveAs(Server.MapPath("" + AppConfigSetting.homeSliderUrl) + id + extension);

                    // StatusLabel.Text = "Upload status: File uploaded!";
                }
                catch (Exception ex)
                {
                    /// StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }
        public void FormReset()
        {
            txtTitle.Text = "";
            txtSubtitle.Text = "";
            txtOrderNo.Text = "";
            lblMessage.Text = "";
            lblHomeSliderId.Text = "";
            lblMode.Text = "";
            imgFileUpload.ImageUrl = "";
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            FormReset();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            HomeSlider homeSlider = formToObject();
            bool result = new EFHomeSlider().saveHomeSlider(ref homeSlider, ref ErrorMessage, SessionHelper.getUserSession().userid);
            if (result)
            {
                saveImage(homeSlider.HomeSliderId);

                lblMessage.Text = "";
                FormReset();
                FormLoad();
                MisOp.ShowMessage(this, "The Record has been saved", "Home Slider ", true);
                //return;
            }
            else
            {
                lblMessage.Text = ErrorMessage;
            }



        }
       
        private void ObjectToForm(HomeSlider homeSlider)
        {
            // About about = new About();
            txtTitle.Text = homeSlider.HomeSliderTitle;
            txtSubtitle.Text = homeSlider.HomSliderSubTitle;
            txtOrderNo.Text = homeSlider.OrderNumber.ToString();
            lblHomeSliderId.Text = homeSlider.HomeSliderId.ToString();

            if (homeSlider.ImageURL != null && homeSlider.ImageURL != "")
            {
                imgFileUpload.ImageUrl = AppConfigSetting.homeSliderUrl + homeSlider.HomeSliderId + homeSlider.ImageURL;
            }
        }
        public HomeSlider GetHomeSliderByHomeSliderId(int homeSliderId)
        {
            return new EFHomeSlider().getByIdHomeSlider(homeSliderId);
        }
        public bool DeleteHomeSlider(int homeSliderId)
        {
            return new EFHomeSlider().deleteHomeSlider(homeSliderId, ref ErrorMessage, SessionHelper.getUserSession().userid);
        }

        protected void rptrHomeSlider_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToUpper() == "HOMESLIDERDELETE")
            {
                if (DeleteHomeSlider(Convert.ToInt32(e.CommandArgument.ToString())))
                {
                    FormReset();
                    FormLoad();
                }
            }
            else if (e.CommandName == "HOMESLIDEREDIT")
            {
                about = GetHomeSliderByHomeSliderId(Convert.ToInt32(e.CommandArgument.ToString()));
                if (about != null)
                {
                    ObjectToForm(about);
                    // btnCancel.Visible = true;
                    //btnBack.Visible = false;
                }
            }
        }
    }
}   
   