﻿using BALNDAL;
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
    public partial class ucProductDashBoard : System.Web.UI.UserControl
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
            fillListView();
        }
        public void fillListView()
        {
            lvProduct.DataSource = getAllDashBoardProducts();
            lvProduct.DataBind();
        }
        public List<Product> getAllDashBoardProducts()
        {
            List<Product> lstProduct = new EFProduct().getAllDashBoardProducts();
            foreach (var item in lstProduct)
            {
                item.ImageURL = AppConfigSetting.ProductUrl.ToString() + item.ProductId.ToString() + item.ImageURL;
            }
            return lstProduct;
        }
    }
}