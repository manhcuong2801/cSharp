using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using Project.Entity;

namespace Project.student
{
    public partial class Cost : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["MyConnection"].ToString();
        Account a;
        protected void Page_Load(object sender, EventArgs e)
        {
            a = (Account)Session["currentAccount"];
            if (a == null)
            {
                Response.Redirect("http://localhost:58848/authentication/LogIn.aspx");
            }
            else
            {
                if (a != null && a.Roldid != 2)
                {
                    Response.Redirect("http://localhost:58848/authentication/AccessDenied.aspx");
                }
                
            }
            load_data();
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;

        }
        private void load_data()
        {
            SqlConnection con = new SqlConnection(connStr);
            string sql = @"SELECT Dom.domName, Room.roomName, Cost.studentID, Cost.Details, Cost.Pending, Cost.dateCreated, Cost.totalBill, Cost.paidBill
                           FROM Cost INNER JOIN History ON Cost.studentID = History.studentID
	                       INNER JOIN Student ON Cost.studentID = Student.studentID 
	                       LEFT JOIN Dom ON Student.domID = Dom.domID 
	                       LEFT JOIN Room ON Student.roomID = room.roomID
                           WHERE username = '" + a.Username + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
        }

        private void load_data_2()
        {
            SqlConnection con = new SqlConnection(connStr);
            string sql = @"SELECT Dom.domName, Room.roomName, Cost.studentID, Cost.Details, Cost.Pending, Cost.dateCreated, Cost.totalBill, Cost.paidBill
                           FROM Cost INNER JOIN History ON Cost.studentID = History.studentID
	                       INNER JOIN Student ON Cost.studentID = Student.studentID 
	                       LEFT JOIN Dom ON Student.domID = Dom.domID 
	                       LEFT JOIN Room ON Student.roomID = room.roomID
                           WHERE History.semester = '" + DropDownList1.SelectedItem.Text + "' and History.yearOfSemester = '" + DropDownList2.SelectedItem.Text + "' and username = '" + a.Username + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable tb = new DataTable();
            da.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            load_data_2();
        }
    }

}