using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALNDAL.EFOperation
{
    public class EFUser
    {
        public KarachiNPEntities KarachiNPcontext;
        bool result = false;
        public EFUser()
        {
            KarachiNPcontext = new KarachiNPEntities();
        }
        public User GetUserByUserNamePassword(string userName, string password, ref string ErrorMessage)
        {
            using (KarachiNPcontext)
            {
                // KarachiNPcontext.Configuration.LazyLoadingEnabled = false;
                User objUser = KarachiNPcontext.Users.Where(a => a.UserName == userName && a.UserPassword == password).FirstOrDefault();
                if (objUser != null)
                {

                }
                else
                {
                    ErrorMessage = Messages.MessageContent(MessageCode.NoRecordFound);
                }
                return objUser;
            }
        }

        public User InsertUser(User userObj, ref string returnMessage)
        {
            try
            {
                using (KarachiNPcontext)
                {
                    User obj_User = KarachiNPcontext.Users.Where(a => a.UserName == userObj.UserName).FirstOrDefault();
                    if (obj_User == null)
                    {
                        User userNewObj = new User();
                        userNewObj.UserName = userObj.UserName;
                        userNewObj.UserPassword = userObj.UserPassword;
                        userNewObj.IsActive = userObj.IsActive;

                        KarachiNPcontext.Users.Add(userNewObj);
                        KarachiNPcontext.SaveChanges();
                        returnMessage = Messages.MessageContent(MessageCode.AccountCreated);
                        return userNewObj;
                    }
                    else
                    {
                        returnMessage = Messages.MessageContent(MessageCode.AlreadyExistsUser);
                    }
                }
            }
            catch (Exception ex) { }
            return null;
        }
        public User GetUserByUserName(string userName, ref string ErrorMessage)
        {
            using (KarachiNPcontext)
            {
                return KarachiNPcontext.Users.Where(a => a.UserName == userName).FirstOrDefault();
            }
        }
        public User getUserByUserId(int userId, ref string returnMessage)
        {
            return KarachiNPcontext.Users.Where(a => a.Userid == userId).FirstOrDefault();
        }

    }
}
