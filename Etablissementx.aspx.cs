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
    public partial class Etablissementx : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

            Master.dropd.Style["background-color"] = "rgb(211,211,211) !important";
            Master.filire.Style["background-color"] = "rgb(211,211,211) !important";

            if (Session["CIN"] != null)
            {

                Master.conx.Visible = false;
                Master.insc.Visible = false;
                Master.imgP.Visible = true;
                Master.profil.Visible = true;
                Master.profil.Text = "Bienvenue " + Session["NomEtd"];
                Master.Decx.Visible = true;
                //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
                //c.cmd = new SqlCommand("Select img from Etudiant where CIN='" + Session["CIN"] + "'", con);
                //con.Open();
                //c.dr = c.cmd.ExecuteReader();

                if (Session["img_Etd"] != null)
                {
                    Master.imgP.ImageUrl = "" + Session["img_Etd"];
                }
                else
                {
                    Master.imgP.ImageUrl = "~/imgProfil/ph.png";
                }
            }
            else
            {
                if (Session["Admin"] != null)
                {
                    Master.conx.Visible = false;
                    Master.insc.Visible = false;
                    Master.imgP.Visible = true;
                    Master.profil.Visible = true;
                    Master.profil.Text = "Bienvenue " + Session["Admin"];
                    Master.Decx.Visible = true;

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
                    c.cmd = new SqlCommand("Select img from Admine where Email='" + Session["Admin"] + "'", con);
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
                else
                    if (Session["Etablissement"] != null)
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

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
                    c.cmd = new SqlCommand("Select img from Etablissement where Email= '" + Session["Etablissement"] + "'", con);
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
                else
                {
                    if (Session["ID_Prof"] != null)
                    {
                        Master.cor.Visible = true;
                        Master.Decx.Visible = true;
                        Master.conx.Visible = false;
                        Master.insc.Visible = false;
                        Master.imgP.Visible = true;
                        Master.profil.Visible = true;
                        Master.profil.Text = "Bienvenue " + Session["NomProf"];
                        Master.dropE.Visible = true;
                        Master.dropAdm.Visible = false;

                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
                        c.cmd = new SqlCommand("Select img from formateur where ID_For= '" + Session["ID_Prof"] + "'", con);
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
            if (Session["ID_E"]!=null)
            {
                string email = "";
                c.cmd = new SqlCommand("SELECT  * FROM Etablissement where ID_Etab = '" + Session["ID_E"] + "'", con);
                con.Open();
                c.dr = c.cmd.ExecuteReader();
                if (c.dr.Read())
                {
                    email = c.dr["Email"].ToString();
                    lbNEtb.Text = c.dr["Nom_Etb"].ToString();
                    
                    lbNom.Text = c.dr["Nom_Etb"].ToString();
                    
                    lbAdrr.Text = c.dr["Adresse"].ToString();
                    lbphone.Text = c.dr["Tele"].ToString();
                    imgPr.ImageUrl = c.dr["img"].ToString();
                }
                c.dr.Close();
                c.cmd.CommandText = "SELECT  Ville.Nom_Ville, Region.Nom_Reg FROM   Etablissement INNER JOIN  Ville ON Etablissement.ID_Ville = Ville.ID_ville INNER JOIN  Region ON Ville.Reg = Region.ID_R where ID_Etab=" + Session["ID_E"];
                c.dr = c.cmd.ExecuteReader();
                if (c.dr.Read())
                {
                    Reg.Text =c.dr[1].ToString() ;
                    lbVille.Text = c.dr[0].ToString() ; 
                }
                con.Close();
            }
            else
            {
                Response.Redirect("EtabFiltr.aspx");
            }
        }

        protected void GridFil_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void Fil_Click(object sender, EventArgs e)
        {
            LinkButton File1 = sender as LinkButton;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
            c.cmd = new SqlCommand("SELECT ID_Fil  FROM Filire where Nom_Filire = '" + File1.Text + "'", con);
            con.Open();
            c.dr = c.cmd.ExecuteReader();
            if (c.dr.Read())
            {
                Session["ID_M"] = c.dr[0].ToString();
                Response.Redirect("Module.aspx");
            }
        }

        protected void btnMod_Click(object sender, EventArgs e)
        {
            txtAdrr.Visible = true;
            txtNE.Visible = true;
            txtPhone.Visible = true;
            txtvill.Visible = true;

            txtvill.Text = lbVille.Text;
            txtPhone.Text = lbphone.Text;
            txtNE.Text = lbNom.Text;
            txtAdrr.Text = lbAdrr.Text;

            lbAdrr.Visible = false;
            lbNom.Visible = false;
            lbphone.Visible = false;
            lbVille.Visible = false;
        }
    }
}