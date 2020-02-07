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
    public partial class DetailsView : System.Web.UI.Page
    {
        public string conStr = WebConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        DataTable dt;
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
            if (!Page.IsPostBack)
            {
                dt = new DataTable();
                makeDataTable();
                addDataToTable(1);
            }
            else
            {
                dt = (DataTable)ViewState["DataTable"];

            }
            ViewState["DataTable"] = dt;


        }

        public void makeDataTable()
        {

            dt.Columns.Add("RoomName");
            dt.Columns.Add("TotalBed");
            dt.Columns.Add("UsedBed");
            dt.Columns.Add("FreeBed");

        }
        public void addDataToTable(int domid)
        {
            SqlConnection sqlConnection = new SqlConnection(conStr);
            String SQLQuery = @"SELECT Room.roomName,  COUNT(Bed.bedID) AS TotalBed
                FROM (Bed INNER JOIN
                         Room ON Bed.roomID = Room.roomID INNER JOIN
                         Dom ON Dom.domID = Room.domID)
                         WHERE Dom.domID = " + domid + " GROUP BY Room.roomName";
            SqlCommand command = new SqlCommand(SQLQuery, sqlConnection);
            SqlDataReader Reader;
            sqlConnection.Open();
            Reader = command.ExecuteReader();
            while (Reader.Read())
            {
                DataRow dr = dt.NewRow();
                dr["RoomName"] = Reader["roomName"].ToString();
                dr["TotalBed"] = Reader["TotalBed"].ToString();
                dt.Rows.Add(dr);

                SqlConnection conn = new SqlConnection(conStr);
                String sql = @"SELECT COUNT(bedStatusID) AS UsedBed FROM BedStatus WHERE bedStatusID =1";
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader Reader1;
                conn.Open();
                Reader1 = cmd.ExecuteReader();

                while (Reader1.Read())
                {
                    int freebed = Convert.ToInt32(Reader["TotalBed"]) - Convert.ToInt32(Reader1["UsedBed"]);
                    dr["UsedBed"] = Reader1["UsedBed"].ToString();
                    dr["FreeBed"] = freebed.ToString();

                }

            }


            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int domid = int.Parse(DropDownList1.SelectedValue);
            addDataToTable(domid);

        }
    }
}