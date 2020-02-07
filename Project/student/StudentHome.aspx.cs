using Project.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.student
{
    public partial class StudentHome : System.Web.UI.Page
    {
        public string conStr = WebConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Account a = (Account)Session["currentAccount"];
            if (a == null)
            {
                Response.Redirect("http://localhost:58848/authentication/LogIn.aspx");
            }
            else
            {
                if (a != null && a.Roldid != 2)
                {
                    Response.Redirect("http://localhost:58848/authentication/AccessDenied.html");
                }
            }
            //Label2.Text = "Hello " + a.Username;
            getUsefulInfo(a.Username);
        }
        public void getUsefulInfo(string username)
        {
            SqlConnection sqlConnection = new SqlConnection(conStr);
            String SQLQuery = "SELECT gender, balance FROM Student where username='" + username + "' ";
            SqlCommand command = new SqlCommand(SQLQuery, sqlConnection);
            SqlDataReader Dr;
            sqlConnection.Open();
            Dr = command.ExecuteReader();
            if (Dr.Read())
            {
                string gender = (Dr["gender"].ToString() == "True") ? "Female" : "Male";
                Label1.Text = "Your FAP Balance: " + Dr["balance"].ToString() + "₫\n" +
                               "Your gender information at FAP system: "
                               + gender + ", if this information is not correct, please contact Academic staff.";
            }
            Dr.Close();
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