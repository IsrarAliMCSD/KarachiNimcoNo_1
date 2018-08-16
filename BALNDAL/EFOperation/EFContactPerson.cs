using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALNDAL.EFOperation
{
    public class EFContactPerson
    {
        public KarachiNPEntities KarachiNPcontext;
        bool result = false;
        public EFContactPerson()
        {
            KarachiNPcontext = new KarachiNPEntities();
        }

        public List<ContactPerson> getAllContactPerson()
        {
            return KarachiNPcontext.ContactPersons.Where(a => a.IsActive == true).OrderByDescending(a => a.OrderNumber).ToList();
        }
        public ContactPerson getContactPersonByContactPersonId(int id)
        {
            return KarachiNPcontext.ContactPersons.Where(a => a.ContactPersonId == id && a.IsActive == true).FirstOrDefault();
        }
        public bool saveContactPerson(ref ContactPerson contactPerson, ref string returnMessage, int userId)
        {
            result = false;
            using (KarachiNPcontext)
            {
                if (contactPerson != null && contactPerson.ContactPersonId > 0)//Edit
                {
                    int contactPersonId = contactPerson.ContactPersonId;
                    ContactPerson objContactPersont = KarachiNPcontext.ContactPersons.Where(a => a.ContactPersonId == contactPersonId).FirstOrDefault();
                    objContactPersont.ContactName = contactPerson.ContactName;
                    objContactPersont.ContactPersonDepartment = contactPerson.ContactPersonDepartment;
                    if (contactPerson.ImageUrl != null && contactPerson.ImageUrl != "")
                    {
                        objContactPersont.ImageUrl = contactPerson.ImageUrl;
                    }
                    objContactPersont.contactNumber = contactPerson.contactNumber;
                    objContactPersont.ContactEmail = contactPerson.ContactEmail;
                    objContactPersont.ModifiedBy = userId;
                    objContactPersont.ModifiedDate = DateTime.Now;
                    objContactPersont.IsActive = contactPerson.IsActive;
                    result = true;
                }
                else
                {
                    contactPerson.CreatedBy = userId;
                    contactPerson.CreatedDate = DateTime.Now;
                    KarachiNPcontext.ContactPersons.Add(contactPerson);
                    result = true;
                }
                KarachiNPcontext.SaveChanges();
                int id = contactPerson.ContactPersonId;
                contactPerson = KarachiNPcontext.ContactPersons.Where(a => a.ContactPersonId == id).FirstOrDefault();
                return result;
            }
        }

        public bool deleteContactPerson(int contactPersonId, ref string returnMessage, int userId)
        {
            using (KarachiNPcontext)
            {
                ContactPerson contactPerson = KarachiNPcontext.ContactPersons.Where(a => a.ContactPersonId == contactPersonId).FirstOrDefault();
                if (contactPerson != null)
                {
                    contactPerson.IsActive = false;
                    contactPerson.ModifiedBy = userId;
                    contactPerson.ModifiedDate = DateTime.Now;
                    KarachiNPcontext.SaveChanges();
                    return true;
                }
            }
            return false;
        }
    }
}
