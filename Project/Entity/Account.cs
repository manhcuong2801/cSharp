using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.Entity
{
    public class Account
    {
        private string username;
        private string password;
        private int roldid;

        public string Username
        {
            get
            {
                return username;
            }

            set
            {
                username = value;
            }
        }

        public string Password
        {
            get
            {
                return password;
            }

            set
            {
                password = value;
            }
        }

        public int Roldid
        {
            get
            {
                return roldid;
            }

            set
            {
                roldid = value;
            }
        }

        public Account()
        {

        }
        public Account(string username, string password, int roldid)
        {
            this.Username = username;
            this.Password = password;
            this.Roldid = roldid;
        }
    }
}