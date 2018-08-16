using BALNDAL;
using BALNDAL.EFOperation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebKarachiNimco.Forms
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static List<HomeSlider> GetslideImages()
        {
            EFHomeSlider efHomeSlider = new EFHomeSlider();
            return efHomeSlider.getAllHomeSlider();

        }
    }
}