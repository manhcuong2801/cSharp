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
    public partial class Overview : System.Web.UI.Page
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
            }
            else
            {
                dt = (DataTable)ViewState["DataTable"];
            }
            ViewState["DataTable"] = dt;
            addDataToTable();
            BindGrid();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public void makeDataTable()
        {

            dt.Columns.Add("DomName");
            dt.Columns.Add("TotalBed");
            dt.Columns.Add("UsedBed");
            dt.Columns.Add("FreeBed");
        }

        public void addDataToTable()
        {
            SqlConnection sqlConnection = new SqlConnection(conStr);
            String SQLQuery = @"SELECT Dom.domName,  COUNT(Bed.bedID) AS TotalBed
                            FROM (Bed INNER JOIN
                         Room ON Bed.roomID = Room.roomID INNER JOIN
                         Dom ON Dom.domID = Room.domID)
                            GROUP BY Dom.domName";
            SqlCommand command = new SqlCommand(SQLQuery, sqlConnection);
            SqlDataReader Reader;
            sqlConnection.Open();
            Reader = command.ExecuteReader();
            while (Reader.Read())
            {
                DataRow dr = dt.NewRow();
                dr["domName"] = Reader["domName"].ToString();
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
        }
        public void BindGrid()
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://localhost:58848/student/DetailsView.aspx");
        }
    }
}