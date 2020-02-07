using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Project
{
    public class DataAccess
    {
        public static SqlConnection GetConnection()
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ToString();
            return new SqlConnection(ConnectionString);
        }

        public static DataTable GetDataBySql(string sql)
        {
            SqlCommand command = new SqlCommand(sql, GetConnection());
            SqlDataAdapter adapt = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            adapt.Fill(ds);
            return ds.Tables[0];
        }
        public static DataTable GetPrice()
        {
            string sql = "SELECT Distinct pricePerMonth FROM Room";
            return GetDataBySql(sql);
        }
        public static DataTable getGender(string username)
        {
            string sql = "SELECT gender FROM Student where username = '" + username + "'";
            return GetDataBySql(sql);

        }
        public static DataTable GetDom()
        {
            string sql = "SELECT domName FROM Dom";
            return GetDataBySql(sql);
        }

        public static DataTable getRoomByFloor(string domid, string floor, string price)
        {

            string sql = " SELECT roomName FROM Room where domID = '" + domid + "' and roomName like '" + floor + "%' and pricePerMonth ='" + price + "'";
            return GetDataBySql(sql);

        }
        public static DataTable getBedByRoom(string domid, string gender, string roomid)
        {
            string x = "0";
            if (gender.Equals("True"))
            {
                x = "1";
            }
            string sql = "SELECT Bed.bedName FROM Bed INNER JOIN Room ON Bed.roomID = Room.roomID CROSS JOIN Dom where Dom.domID = " + domid + " and Room.roomID = " + roomid + " and Bed.bedStatusID = 1 and Room.gender = " + x;
            //string sql = "SELECT bedName FROM Bed ";
            return GetDataBySql(sql);

        }
        public static DataTable getRoomID(string roomname, string domID)
        {
            string sql = " SELECT roomID FROM Room where roomName = " + roomname + " and domID = " + domID;
            return GetDataBySql(sql);
        }
        public static DataTable getBalance(string rollID)
        {
            string sql = "SELECT balance FROM Student where Student.username = '" + rollID + "'";
            return GetDataBySql(sql);
        }
        public static DataTable getBedID(string name)
        {
            string sql = "SELECT bedID FROM Bed where bedName = '" + name + "'";
            return GetDataBySql(sql);
        }
        public void setUsed(string moneyleft, string bedID)
        {



        }
    }
}