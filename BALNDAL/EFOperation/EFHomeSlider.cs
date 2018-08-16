using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALNDAL.EFOperation
{
    public class EFHomeSlider
    {
        public KarachiNPEntities KarachiNPcontext;
        bool result = false;
        public EFHomeSlider()
        {
            KarachiNPcontext = new KarachiNPEntities();
        }

        public List<HomeSlider> getAllHomeSlider()
        {
            return KarachiNPcontext.HomeSliders.Where(a => a.IsActive == true).OrderBy(a => a.OrderNumber).ToList();
        }
        public HomeSlider getByIdHomeSlider(int id)
        {
            return KarachiNPcontext.HomeSliders.Where(a => a.HomeSliderId == id && a.IsActive == true).FirstOrDefault();
        }
        public bool saveHomeSlider(ref HomeSlider homeSlider, ref string returnMessage, int userId)
        {

            result = false;
            using (KarachiNPcontext)
            {
                if (homeSlider != null && homeSlider.HomeSliderId > 0)//Edit
                {
                    int homeSliderId = homeSlider.HomeSliderId;
                    HomeSlider objHomeSlider = KarachiNPcontext.HomeSliders.Where(a => a.HomeSliderId == homeSliderId).FirstOrDefault();
                    objHomeSlider.HomeSliderTitle = homeSlider.HomeSliderTitle;
                    objHomeSlider.HomSliderSubTitle = homeSlider.HomSliderSubTitle;
                    if (homeSlider.ImageURL != null && homeSlider.ImageURL != "")
                    {
                        objHomeSlider.ImageURL = homeSlider.ImageURL;
                    }
                    objHomeSlider.ModifiedBy = userId;
                    objHomeSlider.ModifiedDate = DateTime.Now;
                    objHomeSlider.IsActive = homeSlider.IsActive;
                    result = true;
                }
                else
                {
                    homeSlider.CreatedBy = userId;
                    homeSlider.CreatedDate = DateTime.Now;
                    KarachiNPcontext.HomeSliders.Add(homeSlider);
                    result = true;
                }
                KarachiNPcontext.SaveChanges();
                int id = homeSlider.HomeSliderId;
                homeSlider = KarachiNPcontext.HomeSliders.Where(a => a.HomeSliderId == id).FirstOrDefault();
                return result;
            }
        }

        public bool deleteHomeSlider(int homeSliderId, ref string returnMessage, int userId)
        {
            using (KarachiNPcontext)
            {
                HomeSlider objHomeSlider = KarachiNPcontext.HomeSliders.Where(a => a.HomeSliderId == homeSliderId).FirstOrDefault();
                if (objHomeSlider != null)
                {
                    objHomeSlider.IsActive = false;
                    objHomeSlider.ModifiedBy = userId;
                    objHomeSlider.ModifiedDate = DateTime.Now;
                    KarachiNPcontext.SaveChanges();
                    return true;
                }
            }
            return false;
        }
    }
}