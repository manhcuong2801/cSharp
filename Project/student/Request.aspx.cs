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
    public partial class Request : System.Web.UI.Page
    {
        public string conStr = WebConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Account a = (Account)Session["currentAccount"];
            if (a == null )
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
        }

        public string getStudentID()
        {
            string studentID="";
            SqlConnection sqlConnection = new SqlConnection(conStr);
            sqlConnection.Open();
            Account a = (Account)Session["currentAccount"];
            string sqlGetStudentID = @"SELECT Student.studentID 
                                    FROM Account INNER JOIN Student ON Account.username = Student.username
						            where Account.username = '" + a.Username + "'";
            SqlCommand comUsername = new SqlCommand(sqlGetStudentID, sqlConnection);
            SqlDataReader Dr;
            Dr = comUsername.ExecuteReader();
            if (Dr.Read())
            {
                studentID = Dr["studentID"].ToString();
            }
            return studentID;
        }

        public Boolean testCheckOut(String studentID)
        {
            SqlConnection sqlConnection = new SqlConnection(conStr);
            sqlConnection.Open();
            string sql = @"select bookStatusID from Student where studentID= '" + studentID + "'";
            SqlCommand comUsername = new SqlCommand(sql, sqlConnection);
            SqlDataReader Dr;
            Dr = comUsername.ExecuteReader();
            if (Dr.Read())
            {
                if (int.Parse(Dr["bookStatusID"].ToString())==2)
                {
                    return true;//đang ở ktx
                }
            }
            return false;
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            int typeID = int.Parse(RequestType.SelectedValue);
            if (!testCheckOut(getStudentID()) && typeID == 1)
            {
                lbStatus.Text = "You are not in dorm. Can't check out!";
            }
            else { 
            SqlConnection sqlConnection = new SqlConnection(conStr);
            
            string sql = @"insert into StudentRequest(typeID, tittle, request_content, dateCreated, studentID) 
                         values(" + typeID + ", '" + tbTittle.Text + "', '" + tbContent.Text + "', GETDATE(), '" + getStudentID() + "')";
            //Response.Write(sql);
            SqlCommand com = new SqlCommand(sql, sqlConnection);
            sqlConnection.Open();
            int rowAffected = com.ExecuteNonQuery();
            sqlConnection.Close();

            if (rowAffected>0)
                lbStatus.Text = "Create successfully";
            else lbStatus.Text = "Create failed";
        }
        }
    }
}