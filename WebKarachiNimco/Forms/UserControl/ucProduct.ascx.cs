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
    public partial class ucProduct : System.Web.UI.UserControl
    {
        public EFProduct efProduct;
        string ErrorMessage = "";
        public Product product;
        public EFCategory efCategory;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FormLoad();
            }
        }
        public void FormLoad()
        {
            fillAllCategories();
            fillListView();
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
        public void fillAllCategories()
        {
            ddlCategory.DataSource = getAllCategories();
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataBind();
        }
        public void fillListView()
        {
            lvProduct.DataSource = getAllProducts();
            lvProduct.DataBind();
        }
        public List<Product> getAllProducts()
        {
            List<Product> lstProduct = new EFProduct().getAllProducts();
            foreach (var item in lstProduct)
            {
                item.ImageURL = AppConfigSetting.ProductUrl.ToString() + item.ProductId.ToString() + item.ImageURL;
            }
            return lstProduct;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Product product = formToObject();
            bool result = new EFProduct().saveProduct(ref product, ref ErrorMessage, SessionHelper.getUserSession().userid);
            if (result)
            {
                saveImage(product.ProductId);
                lblMessage.Text = "";
                FormReset();
                FormLoad();
                MisOp.ShowMessage(this, "The Record has been saved", "Contact Person ", true);
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
            txtProductDescription.Text = "";
            txtProductName.Text = "";
            lblMessage.Text = "";
            lblMode.Text = "";
            imgFileUpload.ImageUrl = "";
            lblProductId.Text = "";
        }

        
        public bool deleteProduct(int productId)
        {
            return new EFProduct().deleteProduct(productId, ref ErrorMessage, SessionHelper.getUserSession().userid);
        }
        public Product getProductByProductId(int productId)
        {
            return new EFProduct().getByIdProduct(productId);
        }
        private void ObjectToForm(Product product)
        {
            txtProductDescription.Text = product.ProductDescription;
            txtProductName.Text = product.ProductName;
            lblProductId.Text = product.ProductId.ToString();
            rblst_IsNewProduct.SelectedValue = product.IsNewProduct == true ? "1" : "0";
            rblst_ShowOnDesktop.SelectedValue = product.ShowOnDesktop == true ? "1" : "0";
            ddlCategory.SelectedValue = product.CategoryId.ToString();
            product.CategoryId = Convert.ToInt32(ddlCategory.SelectedValue);
            if (product.ImageURL != null && product.ImageURL != "")
            {
                imgFileUpload.ImageUrl = AppConfigSetting.ProductUrl + product.ProductId + product.ImageURL;
            }
        }
        public Product formToObject()
        {
            Product product = new Product();
            product.ProductDescription = txtProductDescription.Text;
            product.ProductName = txtProductName.Text;
            product.IsActive = true;
            product.IsNewProduct = rblst_IsNewProduct.SelectedValue.ToUpper() == "1" ? true : false;
            product.ShowOnDesktop = rblst_ShowOnDesktop.SelectedValue.ToUpper() == "1" ? true : false;
            product.CategoryId = Convert.ToInt32(ddlCategory.SelectedValue);
            if (lblProductId.Text != "")
            {
                product.ProductId = Convert.ToInt32(lblProductId.Text);
            }
            if (fuplProduct.HasFile)
            {
                product.ImageURL = Path.GetExtension(fuplProduct.FileName);
            }
            return product;
        }
        public void saveImage(int id)
        {
            if (fuplProduct.HasFile)
            {
                try
                {
                    string extension = Path.GetExtension(fuplProduct.FileName);
                    string filename = Path.GetFileName(fuplProduct.FileName);
                    fuplProduct.SaveAs(Server.MapPath("" + AppConfigSetting.ProductUrl) + id + extension);
                }
                catch (Exception ex)
                {
                }
            }
        }

        protected void lvProduct_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.ToUpper() == "PRODUCTDELETE")
            {
                if (deleteProduct(Convert.ToInt32(e.CommandArgument.ToString())))
                {
                    FormReset();
                    FormLoad();
                }
            }
            else if (e.CommandName == "PRODUCTEDIT")
            {
                product = getProductByProductId(Convert.ToInt32(e.CommandArgument.ToString()));
                if (product != null)
                {
                    ObjectToForm(product);
                    // btnCancel.Visible = true;
                    //btnBack.Visible = false;
                }
            }
        }
    }
}