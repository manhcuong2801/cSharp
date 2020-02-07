using Project.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public string conStr = WebConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
                ViewState["LoginErrors"] = 0;
        }
        private Account CheckAccount(string UserName, string Password)
        {
            
            SqlConnection sqlConnection = new SqlConnection(conStr);
            String SQLQuery = "SELECT * FROM Account where username='" + UserName + "' and password ='" + Password + "' ";
            SqlCommand command = new SqlCommand(SQLQuery, sqlConnection);
            SqlDataReader Dr;
            sqlConnection.Open();
            Dr = command.ExecuteReader();
            if (Dr.Read())
            {
                if ((UserName == Dr["username"].ToString()) & (Password == Dr["password"].ToString()))
                {
                    Account a = new Account(UserName, Password, int.Parse(Dr["RoleID"].ToString()));
                    return a;
                }
            }
            Dr.Close();
            return null;
        }

        private String getStudentID(string UserName)
        {

            SqlConnection sqlConnection = new SqlConnection(conStr);
            String SQLQuery = "SELECT studentID FROM Student where username='" + UserName + "' ";
            SqlCommand command = new SqlCommand(SQLQuery, sqlConnection);
            SqlDataReader Dr;
            sqlConnection.Open();
            Dr = command.ExecuteReader();
            if (Dr.Read())
            {
                return Dr["studentID"].ToString();  
            }
            Dr.Close();
            return null;
        }

        protected void LogIn_Click(object sender, EventArgs e)
        {
            Account a = CheckAccount(username.Text, password.Text);
            if (a!=null)
            {
                Session["currentAccount"] = a;
                if (a.Roldid == 1) {
                    Response.Redirect("http://localhost:58848/admin/Home.aspx");
                }
                else
                {
                    Session["studentID"] = getStudentID(username.Text);
                    Response.Redirect("http://localhost:58848/student/StudentHome.aspx");
                }
            }
            else
            {
                Label1.Text="Wrong username or password! Re-enter";
            }
        }
    }
}