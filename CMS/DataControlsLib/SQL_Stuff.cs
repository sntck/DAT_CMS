﻿using System.Data.SqlClient;

namespace DataControlsLib
{
    /// <summary>
    /// Static class that contains variables that can be accessed throughout the solution. Contains a static variable 
    /// to store login credentials (SQL_Stuff.credential, captured from frm_login) and another to store connection 
    /// string (SQL_Stuff.conString, populated from member method called from frm_login).
    /// </summary>
    public static class SQL_Stuff
    {
        /// <summary>
        /// Static variable to store login credentials for CMS database. Used to populate Credential  
        /// property of a new SqlConnection. Using it directly risks garbage collection clearing it after SQL operation.
        /// </summary>
        public static SqlCredential credential { get; set; }

        /// <summary>
        /// Static variable to store connection string for CMS database. Used to populate ConnectionString 
        /// property of a new SqlConnection. Using it directly risks garbage collection clearing it after SQL operation.
        /// </summary>
        public static string conString { get; set; }
        
        /// <summary>
        /// Uses a SqlConnectionStringBuilder to construct the connection string and place it into a 
        /// static variable within this static class. 
        /// </summary>
        public static void setString()
        {
            //Azure!
            SqlConnectionStringBuilder conStringBuilder = new SqlConnectionStringBuilder
            {
                ["Data Source"] = "lida-dat-cms.database.windows.net",
                ["Initial Catalog"] = "lida_dat_cms",
                ["Integrated Security"] = "False",
                ["Persist Security Info"] = "False",
                ["Encrypt"] = "True",
            };
            conString = conStringBuilder.ConnectionString;
            
            ////Adam's LIDA desktop
            //conString = "Data Source=IRC-PC010;Initial Catalog=DAT_CMS;Integrated Security=True";

            ////Adam's laptop
            //conString = "Data Source=LIDA-LT-040704\\SQLEXPRESS;Initial Catalog=DAT_CMS;Integrated Security=True";

            //// Sean's laptop
            //conString = "Data Source=SEAN-LAPTOP\\SQLEXPRESS;Initial Catalog=DAT_CMS;Integrated Security=True";
        }
    }
}

