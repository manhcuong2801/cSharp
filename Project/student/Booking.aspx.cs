using Project.Entity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.student
{
    public partial class Booking : System.Web.UI.Page
    {
        double money = 0;
        string connStr = ConfigurationManager.ConnectionStrings["MyConnection"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            Account a = (Account)Session["currentAccount"];
            if (a == null)
            {
                Response.Redirect("http://localhost:58848/authentication/LogIn.aspx");
            }
            else
            {
                string rollid = a.Username.ToString();
                money = getBalance(rollid);

                load_data();
            }


        }

        private string getGender(string username)
        {
            string name;
            DataTable dt = DataAccess.getGender(username);
            foreach (DataRow dr in dt.Rows)
            {

                name = dr["gender"].ToString();
                return name;
            }
            return null;

        }
        void load_data()
        {
            if (IsPostBack != true)
            {

                DropDownList1.DataSource = getPrice();
                DropDownList1.DataBind();
                DropDownList1.SelectedIndex = 0;
                DropDownList2.DataSource = getDom();
                DropDownList2.DataBind();
                DropDownList2.SelectedIndex = 0;
                refreshGridView1();
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            refreshGridView1();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            refreshGridView1();
            //  refreshGridView2();
        }
        private List<string> getPrice()
        {
            DataTable dt = DataAccess.GetPrice();
            List<string> DepList = new List<string>();
            foreach (DataRow dr in dt.Rows)
            {

                string name = dr["pricePerMonth"].ToString();

                DepList.Add(name);

            }
            return DepList;
        }
        private List<string> getDom()
        {
            DataTable dt = DataAccess.GetDom();
            List<string> DepList = new List<string>();
            foreach (DataRow dr in dt.Rows)
            {

                string name = dr["domName"].ToString();

                DepList.Add(name);

            }
            return DepList;
        }
        private string getRoomID(string roomname, string domID)
        {

            DataTable dt = DataAccess.getRoomID(roomname, domID);

            foreach (DataRow dr in dt.Rows)
            {

                string name = dr["roomID"].ToString();
                return name;


            }
            return null;
        }
        private void refreshGridView1()
        {
            DropDownList4.DataSource = getRoom();
            DropDownList4.DataBind();
        }
        private void refreshGridView2()
        {
            DropDownList5.DataSource = getBed();
            DropDownList5.DataBind();
        }
        private List<string> getBed()
        {
            Account a = (Account)Session["currentAccount"];
            string domid = Convert.ToString(DropDownList2.SelectedIndex + 1);
            String floor = DropDownList3.SelectedValue.ToString();
            String price = DropDownList1.SelectedValue.ToString();
            string username = a.Roldid.ToString();
            string gender = getGender(a.Username.ToString());
            string roomname = DropDownList4.SelectedValue.ToString();
            string roomid = getRoomID(roomname, domid);

            DataTable dt = DataAccess.getBedByRoom(domid, gender, roomid);
            List<string> DepList = new List<string>();

            foreach (DataRow dr in dt.Rows)
            {

                string name = dr["bedName"].ToString();

                DepList.Add(name);

            }

            return DepList;

        }
        private List<string> getRoom()
        {
            string domid = Convert.ToString(DropDownList2.SelectedIndex + 1);
            String floor = DropDownList3.SelectedValue.ToString();
            String price = DropDownList1.SelectedValue.ToString();

            DataTable dt = DataAccess.getRoomByFloor(domid, floor, price);
            List<string> DepList = new List<string>();
            foreach (DataRow dr in dt.Rows)
            {

                string name = dr["roomName"].ToString();

                DepList.Add(name);

            }
            return DepList;
        }
        private Double getBalance(string rollID)
        {
            DataTable dt = DataAccess.getBalance(rollID);
            List<string> DepList = new List<string>();
            foreach (DataRow dr in dt.Rows)
            {
                string name = dr["balance"].ToString();
                double balance = Convert.ToDouble(name);
                return balance;
            }
            return 0;
        }
        private string getBedID(string sophong)
        {
            DataTable dt = DataAccess.getBedID(sophong);
            List<string> DepList = new List<string>();
            foreach (DataRow dr in dt.Rows)
            {
                string name = dr["bedID"].ToString();
                return name;
            }
            return null;
        }
        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            refreshGridView1();
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            refreshGridView2();
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Convert.ToDouble(DropDownList1.SelectedValue.ToString()) * 4 > money)
            {
                Account a = (Account)Session["currentAccount"];
                string bedID = getBedID(DropDownList5.SelectedValue.ToString());
                double moneyleft = money - Convert.ToDouble(DropDownList1.SelectedValue.ToString()) * 4;
                string domid = Convert.ToString(DropDownList2.SelectedIndex + 1);
                string roomname = DropDownList4.SelectedValue.ToString();
                string roomid = getRoomID(roomname, domid);
                SqlConnection con = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("UPDATE Bed SET bedStatusID = 2 WHERE bedID = '" + bedID + "'", con);
                SqlCommand cmd2 = new SqlCommand("UPDATE Student SET balance = '" + moneyleft + "', bookStatusID = 2 , domID = '" + domid + "'  , roomID = '" + roomid + "'  , bedID = '" + bedID + "' WHERE username = '" + a.Username.ToString() + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Convert.ToDouble(DropDownList1.SelectedValue.ToString()) * 4 > money)
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Convert.ToDouble(DropDownList1.SelectedValue.ToString()) * 4 < money)
            {
                args.IsValid = false;
            }
        }
    }
}