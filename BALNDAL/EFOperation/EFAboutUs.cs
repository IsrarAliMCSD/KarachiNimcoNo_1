using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALNDAL.EFOperation
{
    public class EFAboutUs
    {
        public KarachiNPEntities KarachiNPcontext;
        bool result = false;
        public EFAboutUs()
        {
            KarachiNPcontext = new KarachiNPEntities();
        }

        public List<About> getAllAboutUs()
        {
            return KarachiNPcontext.Abouts.Where(a => a.IsActive == true).OrderBy(a => a.OrderNumber).ToList();
        }
        public About getByIdAboutUs(int id)
        {
            return KarachiNPcontext.Abouts.Where(a => a.AboutUsId == id && a.IsActive == true).FirstOrDefault();
        }
        public bool saveAbboutUs(ref About about, ref string returnMessage, int userId)
        {

            result = false;
            using (KarachiNPcontext)
            {
                if (about != null && about.AboutUsId > 0)//Edit
                {
                    int aboutusid = about.AboutUsId;
                    About objabout = KarachiNPcontext.Abouts.Where(a => a.AboutUsId == aboutusid).FirstOrDefault();
                    objabout.Title = about.Title;
                    objabout.Description = about.Description;
                    if (about.Image != null && about.Image != "")
                    {
                        objabout.Image = about.Image;
                    }
                    objabout.ModifiedBy = userId;
                    objabout.ModifiedDate = DateTime.Now;
                    objabout.IsActive = about.IsActive;
                    objabout.OrderNumber = about.OrderNumber;
                    result = true;
                }
                else
                {
                    about.CreatedBy = userId;
                    about.CreatedDate = DateTime.Now;
                    KarachiNPcontext.Abouts.Add(about);
                    result = true;
                }
                KarachiNPcontext.SaveChanges();
                int id = about.AboutUsId;
                about = KarachiNPcontext.Abouts.Where(a => a.AboutUsId == id).FirstOrDefault();
                return result;
            }
        }

        public bool deleteAboutUs(int aboutUsid, ref string returnMessage, int userId)
        {
            using (KarachiNPcontext)
            {
                About objabout = KarachiNPcontext.Abouts.Where(a => a.AboutUsId == aboutUsid).FirstOrDefault();
                if (objabout != null)
                {
                    objabout.IsActive = false;
                    objabout.ModifiedBy = userId;
                    objabout.ModifiedDate = DateTime.Now;
                    KarachiNPcontext.SaveChanges();
                    return true;
                }
            }
            return false;
        }
    }
}