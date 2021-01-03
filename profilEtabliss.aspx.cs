using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication4
{
    public partial class profilEtabliss : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID_E"] != null)
            {
                string Nom = "Bienvenue " + Session["Etablissement"];
                string[] Ns = Nom.Split('@');
                Master.ADD.Visible = true;
                Master.conx.Visible = false;
                Master.insc.Visible = false;
                Master.imgP.Visible = true;
                Master.profil.Visible = true;
                Master.profil.Text = Ns[0];
                Master.dropE.Visible = true;
                Master.dropAdm.Visible = false;
                Master.Decx.Visible = true;

                c.cmd = new SqlCommand("Select Etablissement.*, Ville.Nom_Ville from Etablissement INNER JOIN Ville ON Etablissement.ID_Ville = Ville.ID_ville  where ID_Etab = '" + Session["ID_E"] + "'", con);
                con.Open();
                c.dr = c.cmd.ExecuteReader();
                if (c.dr.Read())
                {
                    Master.imgP.ImageUrl = c.dr["img"].ToString();
                    imgP.ImageUrl = c.dr["img"].ToString();
                    lbnom.Text = c.dr["Nom_Etb"].ToString();
                    lbemail.Text = c.dr["Email"].ToString();
                    lbville.Text = c.dr["Nom_Ville"].ToString();
                    lbAdrs.Text = c.dr["Adresse"].ToString();
                    lbtele.Text = c.dr["Tele"].ToString();

                }
                else
                {
                    Master.imgP.ImageUrl = "~/imgProfil/ph.png";
                }
                c.dr.Close();
                con.Close();
            }
        }

        protected void Fil_Click(object sender, EventArgs e)
        {
            LinkButton File1 = sender as LinkButton;
            c.cmd = new SqlCommand("SELECT ID_Fil  FROM Filire where Nom_Filire = '" + File1.Text + "'", con);
            con.Open();
            c.dr = c.cmd.ExecuteReader();
            if (c.dr.Read())
            {
                Session["ID_Filire"] = c.dr[0].ToString();
            }
            c.dr.Close();
            con.Close();
        }

        protected void GridFil_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}