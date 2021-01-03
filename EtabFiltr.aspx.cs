using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Security.Cryptography.X509Certificates;

namespace WebApplication4
{
    public partial class EtabFiltr : System.Web.UI.Page
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
            if (!Page.IsPostBack)
            {
                cmbReg.Items.Add("Sélectionnez une région");
                cmbReg.Items.Add("BENI MELLAL-KHENIFRA");
                cmbReg.Items.Add("CASABLANCA-SETTAT");
                cmbReg.Items.Add("DRAA-TAFILALET");
                cmbReg.Items.Add("ED DAKHLA-OUED ED DAHAB");
                cmbReg.Items.Add("FES-MEKNES");
                cmbReg.Items.Add("GUELMIME-OUED NOUN");
                cmbReg.Items.Add("LAAYOUNE-SAGUIA AL HAMRA");
                cmbReg.Items.Add("MARRAKECH-SAFI");
                cmbReg.Items.Add("ORIENTAL ET RIF");
                cmbReg.Items.Add("RABAT-SALE-KENITRA");
                cmbReg.Items.Add("SOUSS-MASSA");
                cmbReg.Items.Add("TANGER-TETOUAN-AL HOCEIMA");
                cmbVille.Items.Insert(0,"Sélectionnez une ville");
            }
        }
        public static string r,v;
        protected void cmbReg_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbVille.Items.Clear();
            r = cmbReg.Text;
            string req = "select ID_ville,Nom_Ville from Ville where Reg in (select ID_R from Region where Nom_Reg='" + r + "')";
            c.cmd = new SqlCommand(req, con);
            con.Open();
            c.cmd.CommandType = CommandType.Text;
            cmbVille.DataSource = c.cmd.ExecuteReader();
            cmbVille.DataTextField = "Nom_Ville";
            cmbVille.DataValueField = "ID_ville";
            cmbVille.DataBind();
            cmbVille.Items.Insert(0, "Trouver une Ville");
            con.Close();
        }

        protected void cmbVille_SelectedIndexChanged(object sender, EventArgs e)
        {
            v = cmbVille.SelectedItem.Text;
            c.cmd = new SqlCommand("SELECT ID_Etab,img, Etablissement.Nom_Etb FROM Etablissement INNER JOIN Ville ON Etablissement.ID_Ville = Ville.ID_ville WHERE (Etablissement.ID_Ville = " + cmbVille.SelectedValue + ")", con);
            con.Open();
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dt = new DataTable();
            dtp.Fill(dt);
            GridEtab.DataSource = dt;
            GridEtab.DataBind();
            con.Close();
        }

        protected void Etb_Click(object sender, EventArgs e)
        {
            LinkButton Etbliss = sender as LinkButton;
            string Et = Etbliss.Text;
            con.Open();
            c.cmd = new SqlCommand("SELECT ID_Etab FROM Etablissement where Nom_Etb ='" + Et + "'", con);
            c.dr = c.cmd.ExecuteReader();
            if (c.dr.Read())
            {
                Session["ID_E"] = c.dr[0].ToString();
                Response.Redirect("Etablissementx.aspx");
            }
            c.dr.Close();
            con.Close();

                
        }
    }
}