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
    public partial class ucNewsAndEvent : System.Web.UI.UserControl
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            NewsEvent newsEvent = formToObject();
            bool result = new EFNewsEvent().saveContactPerson(ref newsEvent, ref ErrorMessage, SessionHelper.getUserSession().userid);
            if (result)
            {
                lblMessage.Text = "";
                FormReset();
                FormLoad();
                MisOp.ShowMessage(this, "The Record has been saved", "News Event ", true);
                //return;
            }
            else
            {
                lblMessage.Text = ErrorMessage;
            }

        }
        public void FormReset()
        {
            txtDetail.Text = "";
            txtNewsEventDate.Text = "";
            txtTitle.Text = "";
            lblMessage.Text = "";
            lblNewsEventId.Text = "";
            lblMode.Text = "";
        }
        public NewsEvent formToObject()
        {
            NewsEvent newsEvent = new NewsEvent();
            newsEvent.IsActive = true;
            if (txtNewsEventDate.Text != "") { newsEvent.NewsEventDate = Convert.ToDateTime(txtNewsEventDate.Text); }
            newsEvent.NewsEventDetail = txtDetail.Text;
            if (lblNewsEventId.Text != "") { newsEvent.NewsEventId = Convert.ToInt32(lblNewsEventId.Text); }
            newsEvent.ShowOnDashBoard = rblst_showonDesktop.SelectedValue.ToUpper() == "YES" ? true : false;
            newsEvent.NewsEventTitle = txtTitle.Text;
            newsEvent.NewsEventCategory = ddlCategory.SelectedValue.ToString();


            return newsEvent;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            FormReset();
        }
        protected void rptrNewsEvent_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToUpper() == "NEWSEVENTDELETE")
            {
                if (deleteNewsEvent(Convert.ToInt32(e.CommandArgument.ToString())))
                {
                    FormReset();
                    FormLoad();
                }
            }
            else if (e.CommandName == "NEWSEVENTEDIT")
            {
                newsEvent = getNewsEventByNewsEventId(Convert.ToInt32(e.CommandArgument.ToString()));
                if (newsEvent != null)
                {
                    ObjectToForm(newsEvent);
                    // btnCancel.Visible = true;
                    //btnBack.Visible = false;
                }
            }
        }

        public bool deleteNewsEvent(int newsEventId)
        {
            return new EFNewsEvent().deleteNewsEvent(newsEventId, ref ErrorMessage, SessionHelper.getUserSession().userid);
        }
        public NewsEvent getNewsEventByNewsEventId(int contactPersonId)
        {
            return new EFNewsEvent().getNewsEventByNewsEventId(contactPersonId);
        }
        private void ObjectToForm(NewsEvent newsEvent)
        {
            ddlCategory.SelectedValue = newsEvent.NewsEventCategory;
            txtNewsEventDate.Text = newsEvent.NewsEventDate.ToString();
            txtDetail.Text = newsEvent.NewsEventDetail;
            txtTitle.Text = newsEvent.NewsEventTitle;
            rblst_showonDesktop.SelectedValue = newsEvent.ShowOnDashBoard.ToString();
            lblNewsEventId.Text = newsEvent.NewsEventId.ToString();
        }
    }
}