using ClosedXML.Excel;
using Project.Entity;
using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.admin
{
    public partial class UploadBill : System.Web.UI.Page
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
                //if (a != null && a.Roldid !=1)
                //{
                //    Response.Redirect("http://localhost:58848/authentication/AccessDenied.html");
                //}
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!FileUpload1.HasFile)
            {
                lbStatus.Text = "Please import a file excel!";
            }
            else {
                string excelContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                try
                {
                    if (FileUpload1.PostedFile.ContentType != excelContentType)
                    {
                        lbStatus.Text = "Please choose a file excel";
                    }
                    else
                    {
                        using (XLWorkbook workbook = new XLWorkbook(FileUpload1.PostedFile.InputStream))
                        {
                            SqlConnection sqlConnection = new SqlConnection(conStr);
                            bool firstrow = true;
                            IXLWorksheet sheet = workbook.Worksheet(1);
                            foreach (IXLRow row in sheet.Rows())
                            {
                                if (firstrow)
                                {
                                    firstrow = false;
                                }
                                else
                                {
                                    string studentID = row.Cell(2).Value.ToString();
                                    string domName = row.Cell(3).Value.ToString();
                                    string roomName = row.Cell(4).Value.ToString();
                                    string typeName = row.Cell(5).Value.ToString();
                                    string time = row.Cell(6).Value.ToString();
                                    float numOfMeter = float.Parse(row.Cell(7).Value.ToString());
                                    //float numOfMeter = 10;
                                    string sql = "INSERT INTO Usage(studentID, domID, roomID, typeID, time, numOfMeter)"
                                                 + " select '" + studentID + "', Dom.domID, Room.roomID, UsageType.typeID, CONVERT(date, '" + time + "'), " + numOfMeter
                                                 + " FROM Dom INNER JOIN Room ON Dom.domID = Room.domID CROSS JOIN UsageType where Dom.domName ='" + domName + "' and Room.roomName = '" + roomName + "' and UsageType.typeName = '" + typeName + "'";
                                    //Response.Write(sql);
                                    SqlCommand com = new SqlCommand(sql, sqlConnection);
                                    sqlConnection.Open();
                                    com.ExecuteNonQuery();
                                    sqlConnection.Close();
                                    lbStatus.Text = "Import successfully";
                                }
                            }
                        }
                    }
                }
                catch
                {
                    lbStatus.Text = "Loi xay ra trong qua trinh Import";
                }
                }
                }
        }
    }

/*
 SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-TS6P5NU\SQLEXPRESS;Initial Catalog=PRN292_19_Spring;Integrated Security=True");

        private void btnAdd_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("insert into corporation ([corp_name],[street],[expr_dt]) values ('"
                + txtName.Text + "','"
                + txtStreet.Text + "','"
                + dateTimePicker1.Value.ToString("MM/dd/yyyy") + "')", con);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            this.Close();
        }
     */


//    string excelContentType = "application/vnd.ms-excel";
//    string excel2010ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
//    if (!FileUpload1.HasFile)
//    {
//        lbStatus.Text = "Please choose a file";
//    }
//    else
//    {
//        try
//        {
//            if (FileUpload1.PostedFile.ContentType != excelContentType && FileUpload1.PostedFile.ContentType != excel2010ContentType)
//            {
//                lbStatus.Text = "Please choose a file excel";
//            }
//            else
//            {
//                string path = string.Concat(Server.MapPath("~/Temp/" + FileUpload1.FileName));
//                FileUpload1.SaveAs(path);
//                string excelConnectionString = string.Format("Provide-Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);
//                OleDbConnection connection = new OleDbConnection();
//                connection.ConnectionString = excelConnectionString;
//                OleDbCommand command = new OleDbCommand("Select * from [Sheet1$]", connection);
//                connection.Open();
//                OleDbDataReader dr = command.ExecuteReader();
//                string sqlConnectionString = @"Data Source=DESKTOP-A384G81;Initial Catalog=PRO_PRN292;Integrated Security=True";
//                SqlBulkCopy bulkInsert = new SqlBulkCopy(sqlConnectionString);
//                bulkInsert.DestinationTableName = "ex";
//                bulkInsert.WriteToServer(dr);
//                lbStatus.Text = "Import to database successfully";
//            }
//        }
//        catch
//        {
//            lbStatus.Text = "Loi xay ra trong qua trinh Import";
//        }
//    }