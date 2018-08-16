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
    public partial class ucCategory : System.Web.UI.UserControl
    {
        public EFCategory efCategory;
        string ErrorMessage = "";
        public Category category;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FormLoad();
            }
        }
        public void FormLoad()
        {
            fillListView();
        }
        public void fillListView()
        {
            lvCategory.DataSource = getAllCategories();
            lvCategory.DataBind();
        }
        public List<Category> getAllCategories()
        {
            List<Category> lstCategory = new EFCategory().getAllCategories();
            foreach (var item in lstCategory)
            {
                item.ImageURL = AppConfigSetting.CategoryUrl.ToString() + item.CategoryId.ToString() + item.ImageURL;
            }
            return lstCategory;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Category category = formToObject();
            bool result = new EFCategory().saveCategory(ref category, ref ErrorMessage, SessionHelper.getUserSession().userid);
            if (result)
            {
                saveImage(category.CategoryId);

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
            txtCategoryDescription.Text = "";
            txtCategoryName.Text = "";
            lblMessage.Text = "";
            lblMode.Text = "";
            imgFileUpload.ImageUrl = "";
            lblCategoryId.Text = "";
            rblst_IsNewCategory.SelectedValue = "0";
        }

        protected void lvCategory_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.ToUpper() == "CATEGORYDELETE")
            {
                if (deleteCategory(Convert.ToInt32(e.CommandArgument.ToString())))
                {
                    FormReset();
                    FormLoad();
                }
            }
            else if (e.CommandName == "CATEGORYEDIT")
            {
                category = getCategoryByCategoryId(Convert.ToInt32(e.CommandArgument.ToString()));
                if (category != null)
                {
                    ObjectToForm(category);
                    // btnCancel.Visible = true;
                    //btnBack.Visible = false;
                }
            }
        }
        public bool deleteCategory(int categoryId)
        {
            return new EFCategory().deleteCategory(categoryId, ref ErrorMessage, SessionHelper.getUserSession().userid);
        }
        public Category getCategoryByCategoryId(int categoryId)
        {
            return new EFCategory().getByIdCategory(categoryId);
        }
        private void ObjectToForm(Category category)
        {
            txtCategoryDescription.Text = category.CategoryDescription;
            txtCategoryName.Text = category.CategoryName;
            lblCategoryId.Text = category.CategoryId.ToString();
            rblst_IsNewCategory.SelectedValue = category.IsNewCategory==true?"1":"0";
            if (category.ImageURL != null && category.ImageURL != "")
            {
                imgFileUpload.ImageUrl = AppConfigSetting.CategoryUrl + category.CategoryId + category.ImageURL;
            }
        }
        public Category formToObject()
        {
            Category category = new Category();
            category.CategoryDescription = txtCategoryDescription.Text;
            category.CategoryName = txtCategoryName.Text;
            category.IsActive = true;
            category.IsNewCategory = rblst_IsNewCategory.SelectedValue.ToUpper() == "1" ? true : false;
            if (lblCategoryId.Text != "")
            {
                category.CategoryId = Convert.ToInt32(lblCategoryId.Text);
            }
            if (fuplCategory.HasFile)
            {
                category.ImageURL = Path.GetExtension(fuplCategory.FileName);
            }
            return category;
        }
        public void saveImage(int id)
        {
            if (fuplCategory.HasFile)
            {
                try
                {
                    string extension = Path.GetExtension(fuplCategory.FileName);
                    string filename = Path.GetFileName(fuplCategory.FileName);
                    fuplCategory.SaveAs(Server.MapPath("" + AppConfigSetting.CategoryUrl) + id + extension);
                }
                catch (Exception ex)
                {
                }
            }
        }

       
    }
}