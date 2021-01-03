using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication4
{
    public partial class Adminstration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                Master.conx.Visible = false;
                Master.insc.Visible = false;
                Master.imgP.Visible = true;
                Master.profil.Visible = true;
                Master.profil.Text = "" + Session["Admin"];
                Master.Decx.Visible = true;

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
                c.cmd = new SqlCommand("Select img from Admine where user_name='" + Session["Admin"] + "'", con);
                con.Open();
                c.dr = c.cmd.ExecuteReader();
                if (c.dr.Read())
                {

                    Master.imgP.ImageUrl = c.dr["img"].ToString();

                }
                else
                {
                    Master.imgP.ImageUrl = "~/imgProfil/ph.png";
                }

            }
        }
    }
}