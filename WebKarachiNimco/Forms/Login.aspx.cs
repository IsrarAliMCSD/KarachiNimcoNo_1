using BALNDAL;
using BALNDAL.EFOperation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebKarachiNimco.App_Class;

namespace WebKarachiNimco.Forms
{
    public partial class Login : System.Web.UI.Page
    {
        public EFUser user;
        string ErrorMessage = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            user = new EFUser();
            User us=  user.InsertUser(FillUser(), ref ErrorMessage);
            //  User user = user.InsertUser(FillUser(), ref ErrorMessage);
            if (us != null && us.Userid > 0)
            {
                MisOp.ShowMessage(this, ErrorMessage, "Account creation", true);
            }
            else
            {
                MisOp.ShowMessage(this, ErrorMessage, "Account creation Failed", true);

            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            divforgotPassword.Visible = false;
            divSignUp.Visible = false;
            divLogin.Visible = true;
        }

        protected void btnfoorgotPassword_Click(object sender, EventArgs e)
        {
            //user = new EFUser();
            //User usr = user.GetUserByUserName(txtEmailForgotPassword.Text, ref ErrorMessage);
            //if (user != null)
            //{
            //    new EmailUtility().sendEmail(new string[] { txtEmailForgotPassword.Text }, null, "Password reset request",
            //          "<p>Dear " + user.FirstName + " " + user.LastName + "</p><br> your password is " + user.UserPassword.ToString());
            //    MisOp.ShowMessage(this, "An email has been sent to your email address. Please read your email", "Password Recover ", false);
            //}
            //else
            //{
            ErrorMessage = "Please contact your administrator";
                MisOp.ShowMessage(this, ErrorMessage, "Login", false);

            //}

        }

        protected void btnCancelforgotpassword_Click(object sender, EventArgs e)
        {
            divforgotPassword.Visible = false;
            divSignUp.Visible = false;
            divLogin.Visible = true;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            User user = UserLogin(txtEmailLogin.Text, txtPassword.Text, ref ErrorMessage);
            if (user != null)
            {
               
                if (chbRememberPassword.Checked)
                {
                    StoreUserCredentialCookie();
                }
                Session[SessionNames.S_User.ToString()] = FillUserForSession(user);
                FormRedirect();
            }
            else
            {
                MisOp.ShowMessage(this, ErrorMessage, "Login", false);

            }
        }
        protected void btnRegistration_Click(object sender, EventArgs e)
        {
            if (Request.QueryString.Count > 0 && Request.QueryString[0].ToUpper() == "EMPLOYEE")
            {
                Response.Redirect("employeeSignup.aspx?mode=EMPLOYEE");
            }
            else
            {
                divforgotPassword.Visible = false;
                divSignUp.Visible = true;
                divLogin.Visible = false;
            }
        }
        protected void lbtnforgotPassword_Click(object sender, EventArgs e)
        {
            divforgotPassword.Visible = true;
            divSignUp.Visible = false;
            divLogin.Visible = false;
        }
        public User FillUser()
        {
            User us = new User();
            us.UserName = txtEmailSignUp.Text;
            us.UserPassword = txtPasswordSignUp.Text;
            us.IsActive = true;
            return us;
        }
        public User UserLogin(string userName, string password, ref string ErrorMessage)
        {
            user = new EFUser();
            return user.GetUserByUserNamePassword(userName, password, ref ErrorMessage);
        }

        public void StoreUserCredentialCookie()
        {
            HttpCookie userInfo = new HttpCookie("userInfo");
            userInfo["Email"] = txtEmailLogin.Text;
            userInfo["Password"] = txtPassword.Text;
            userInfo.Expires.Add(new TimeSpan(168, 0, 0));
            Response.Cookies.Add(userInfo);
        }
        public UserSession FillUserForSession(User user)
        {
            UserSession usersession = new UserSession();
            //usersession.emailAddress = user.EmailAddress;
            usersession.userid = user.Userid;
            usersession.userName = user.UserName;
            return usersession;
        }
        public void FormRedirect()
        {
            Response.Redirect("~/Forms/Admin/Home.aspx", true);
        }
    }
}