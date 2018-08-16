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
    public partial class ucCategoryView : System.Web.UI.UserControl
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
    }
}