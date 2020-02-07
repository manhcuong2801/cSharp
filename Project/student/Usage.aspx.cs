using Project.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.student
{
    public partial class Usage : System.Web.UI.Page
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
                load_data();
            }
            DropDownListTerm.SelectedIndex = 0;
            DropDownList1.SelectedIndex = 0;
        }

        private void load_data()
        {
            SqlConnection con = new SqlConnection(connStr);
            String sql = @"SELECT DISTINCT Dom.domName, Room.roomName, Usage.time, UsageType.typeName, Usage.numOfMeter
                      FROM UsageType INNER JOIN
                      Usage ON UsageType.typeID = Usage.typeID INNER JOIN
                      Dom ON Usage.domID = Dom.domID INNER JOIN
                      Room ON Usage.roomID = Room.roomID CROSS JOIN
                      History INNER JOIN Student ON Usage.studentID = Student.studentID
                      WHERE username = '" + a.Username + "'";
            SqlCommand command = new SqlCommand(sql, con);
            DataTable table = new DataTable();
            SqlDataReader Dr;
            con.Open();
            Dr = command.ExecuteReader();
            table.Columns.Add("Dom Name", typeof(string));
            table.Columns.Add("Room Name", typeof(string));
            table.Columns.Add("Usage time", typeof(string));
            table.Columns.Add("Type", typeof(string));
            table.Columns.Add("Block Actual Usage", typeof(float));
            table.Columns.Add("Block Over Usage", typeof(float));
            table.Columns.Add("Your Actual Usage", typeof(float));
            table.Columns.Add("Your Over Usage", typeof(float));
            while (Dr.Read())
            {
                float bActual = float.Parse(Dr["numOfMeter"].ToString());
                float bOver = bActual - 36 * 12;
                float yActual = bActual / 12;
                float yOver = bActual - 36;
                table.Rows.Add(
                    Dr["domName"].ToString(),
                    Dr["roomName"].ToString(),
                    Dr["time"].ToString(),
                    Dr["typeName"].ToString(),
                    bActual,
                    bOver,
                    yActual,
                    yOver
                    );
            }
            GridView1.DataSource = table;
            GridView1.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            load_data_2();
        }

        private void load_data_2()
        {
            SqlConnection con = new SqlConnection(connStr);
            String sql = @"SELECT DISTINCT Dom.domName, Room.roomName, Usage.time, UsageType.typeName, Usage.numOfMeter
                      FROM Dom INNER JOIN
                      Room ON Dom.domID = Room.domID INNER JOIN
                      Usage ON Dom.domID = Usage.domID AND Room.roomID = Usage.roomID INNER JOIN
                      UsageType ON Usage.typeID = UsageType.typeID CROSS JOIN
                      History INNER JOIN Student ON Usage.studentID = Student.studentID
                      WHERE History.semester = " + DropDownListTerm.SelectedItem.Text + " and " + " History.yearOfSemester = '" + DropDownList1.SelectedItem.Text + "' and " + "username = '" + a.Username + "'";
            
            SqlCommand command = new SqlCommand(sql, con);
            DataTable table = new DataTable();
            SqlDataReader Dr;
            con.Open();
            Dr = command.ExecuteReader();
            table.Columns.Add("Dom Name", typeof(string));
            table.Columns.Add("Room Name", typeof(string));
            table.Columns.Add("Usage time", typeof(string));
            table.Columns.Add("Type", typeof(string));
            table.Columns.Add("Block Actual Usage", typeof(float));
            table.Columns.Add("Block Over Usage", typeof(float));
            table.Columns.Add("Your Actual Usage", typeof(float));
            table.Columns.Add("Your Over Usage", typeof(float));
            while (Dr.Read())
            {
                float bActual = float.Parse(Dr["numOfMeter"].ToString());
                float bOver = bActual - 36 * 12;
                float yActual = bActual / 12;
                float yOver = bActual - 36;
                table.Rows.Add(
                    Dr["domName"].ToString(),
                    Dr["roomName"].ToString(),
                    Dr["time"].ToString(),
                    Dr["typeName"].ToString(),
                    bActual,
                    bOver,
                    yActual,
                    yOver
                    );
            }
            GridView1.DataSource = table;
            GridView1.DataBind();
        }
    }
}