using Project.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.admin
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Account a = (Account)Session["currentAccount"];
            if (a == null)
            {
                Response.Redirect("http://localhost:58848/authentication/LogIn.aspx");
            }
            else
            {
                if (a != null && a.Roldid != 1)
                {
                    Response.Redirect("http://localhost:58848/authentication/AccessDenied.html");
                }
            }
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("http://localhost:58848/authentication/LogIn.aspx");
        }
    }
}