using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALNDAL.EFOperation
{
    public class EFNewsEvent
    {
        public KarachiNPEntities KarachiNPcontext;
        bool result = false;
        public EFNewsEvent()
        {
            KarachiNPcontext = new KarachiNPEntities();
        }
        public List<NewsEvent> getNewsEventDetail()
        {
            return KarachiNPcontext.NewsEvents.Where(a => a.IsActive == true).OrderBy(a=>a.NewsEventId).ToList();
        }
        public List<NewsEvent> getNewsEventDetailDashBoard()
        {
            return KarachiNPcontext.NewsEvents.Where(a => a.IsActive == true && a.ShowOnDashBoard==true).ToList();
        }

        public bool saveContactPerson(ref NewsEvent newsEvent, ref string returnMessage, int userId)
        {
            result = false;
            using (KarachiNPcontext)
            {
                if (newsEvent != null && newsEvent.NewsEventId > 0)//Edit
                {
                    int newsEventId = newsEvent.NewsEventId;
                    NewsEvent objnewsEvent = KarachiNPcontext.NewsEvents.Where(a => a.NewsEventId == newsEventId).FirstOrDefault();
                    objnewsEvent.IsActive = true;
                    objnewsEvent.NewsEventDate = newsEvent.NewsEventDate;
                    objnewsEvent.NewsEventDetail = newsEvent.NewsEventDetail;
                    objnewsEvent.NewsEventTitle = newsEvent.NewsEventTitle;
                    objnewsEvent.ShowOnDashBoard = newsEvent.ShowOnDashBoard;
                    objnewsEvent.NewsEventCategory = newsEvent.NewsEventCategory;
                    objnewsEvent.ModifiedBy = userId;
                    objnewsEvent.ModifiedDate = DateTime.Now;
                    result = true;
                }
                else
                {
                    newsEvent.CreatedBy = userId;
                    newsEvent.CreatedDate = DateTime.Now;
                    KarachiNPcontext.NewsEvents.Add(newsEvent);
                    result = true;
                }
                KarachiNPcontext.SaveChanges();
                int id = newsEvent.NewsEventId;
                newsEvent = KarachiNPcontext.NewsEvents.Where(a => a.NewsEventId == id).FirstOrDefault();
                return result;
            }
        }

        public bool deleteNewsEvent(int newsEventId, ref string returnMessage, int userId)
        {
            using (KarachiNPcontext)
            {
                NewsEvent newsEvent = KarachiNPcontext.NewsEvents.Where(a => a.NewsEventId == newsEventId).FirstOrDefault();
                if (newsEvent != null)
                {
                    newsEvent.IsActive = false;
                    newsEvent.ModifiedBy = userId;
                    newsEvent.ModifiedDate = DateTime.Now;
                    KarachiNPcontext.SaveChanges();
                    return true;
                }
            }
            return false;
        }

        public NewsEvent getNewsEventByNewsEventId(int id)
        {
            return KarachiNPcontext.NewsEvents.Where(a => a.NewsEventId == id && a.IsActive == true).FirstOrDefault();
        }
        public List<NewsEvent> getNewsEventDetail(string category)
        {
            return KarachiNPcontext.NewsEvents.Where(a => a.IsActive == true 
            && a.NewsEventCategory.ToUpper() == category).OrderByDescending(a=>a.NewsEventId).ToList();
        }

    }
}
