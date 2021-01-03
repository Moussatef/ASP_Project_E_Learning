using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace WebApplication4
{
    public class c
    {
        public static  SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-PMOICB7\SQLEXPRESS;Initial Catalog=aspPreject;Integrated Security=True");
        public static SqlCommand cmd;
        public static SqlDataReader dr;
    
    }
 
}