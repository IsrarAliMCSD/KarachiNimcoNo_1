using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALNDAL.EFOperation
{
    public class EFContactDetail
    {
        public KarachiNPEntities KarachiNPcontext;
        bool result = false;
        public EFContactDetail()
        {
            KarachiNPcontext = new KarachiNPEntities();
        }
        public List<ContactDetail> GetAllContactDetails()
        {
            using (KarachiNPcontext)
            {
                return KarachiNPcontext.ContactDetails.Where(a => a.IsActive == true).ToList();
            }
        }
        public bool deleteContactDetailById(int contactDetailId, ref string returnMessage, int userId)
        {
            using (KarachiNPcontext)
            {
                ContactDetail contactDetail = KarachiNPcontext.ContactDetails.Where(a => a.CntactDetailId == contactDetailId).FirstOrDefault();
                if (contactDetail != null)
                {
                    contactDetail.IsActive = false;
                    contactDetail.ModifiedBy = userId;
                    contactDetail.ModifiedDate = DateTime.Now;
                    KarachiNPcontext.SaveChanges();
                    return true;
                }
            }
            return false;
        }
        public ContactDetail getContactDetailById(int id)
        {
            return KarachiNPcontext.ContactDetails.Where(a => a.CntactDetailId == id && a.IsActive == true).FirstOrDefault();
        }
        public bool saveContactDetail(ContactDetail contactDetail, ref string returnMessage, int userId)
        {

            result = false;
            using (KarachiNPcontext)
            {
                if (contactDetail != null && contactDetail.CntactDetailId > 0)//Edit
                {
                    int cntactDetailId = contactDetail.CntactDetailId;
                    ContactDetail objcontactDetail = KarachiNPcontext.ContactDetails.Where(a => a.CntactDetailId == cntactDetailId).FirstOrDefault();
                    objcontactDetail.ContactDetailAddress = contactDetail.ContactDetailAddress;
                    objcontactDetail.ContactNumber = contactDetail.ContactNumber;
                    objcontactDetail.ModifiedBy = userId;
                    objcontactDetail.ModifiedDate = DateTime.Now;
                    objcontactDetail.IsActive = contactDetail.IsActive;
                    result = true;
                }
                else
                {
                    contactDetail.CreatedBy = userId;
                    contactDetail.CreatedDate = DateTime.Now;
                    KarachiNPcontext.ContactDetails.Add(contactDetail);
                    result = true;
                }
                KarachiNPcontext.SaveChanges();
                return result;
            }
        }
    }
}
