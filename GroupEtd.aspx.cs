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
    public partial class GroupEtd : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (Session["CIN"] != null)
                {

                    Master.conx.Visible = false;
                    Master.insc.Visible = false;
                    Master.imgP.Visible = true;
                    Master.profil.Visible = true;
                    Master.profil.Text = "Bienvenue " + Session["NomEtd"];
                    Master.Decx.Visible = true;
                    c.cmd = new SqlCommand("Select ID_GP from Etudiant where CIN='" + Session["CIN"] + "'", con);
                    con.Open();
                    c.dr = c.cmd.ExecuteReader();
                    if (c.dr.Read())
                    {
                        Session["ID_GP"] = c.dr["ID_GP"].ToString();
                    }
                    c.dr.Close();
                    con.Close();
                    c.cmd.CommandText = "SELECT DISTINCT Filire.Nom_Filire, cours.ID_Cour, cours.Nom AS Titre, cours.Description , cours.La_Date, Module.Nome_Module, formateur.Nom + ' ' + formateur.Prenom AS Nom_Prof, Group_Et.Nom FROM Filire INNER JOIN cours ON Filire.ID_Fil = cours.ID_Filiere INNER JOIN formateur ON cours.ID_Prof = formateur.ID_For INNER JOIN Module ON cours.ID_Module = Module.ID_M INNER JOIN Group_Cours ON cours.ID_Cour = Group_Cours.ID_Cours INNER JOIN Group_Et ON Filire.ID_Fil = Group_Et.Filire AND Group_Cours.ID_Group = Group_Et.ID_Group WHERE (Group_Cours.ID_Group = "+Session["ID_GP"]+")";
                    SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
                    DataTable dataTable = new DataTable();
                    dtp.Fill(dataTable);
                    LBGroup.Text = dataTable.Rows[0][7].ToString();
                    Repeater1.DataSource = dataTable;
                    Repeater1.DataBind();
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
                        c.dr.Close();
                        con.Close();
                    }
                }
        }

        protected void lnProf_Click(object sender, EventArgs e)
        {
            lbhader.Text = "Les Professeur de group " + LBGroup.Text;
            Repeater1.Visible = false;
            GridView1.Visible = false;
            GridEtab.Visible = true;
            c.cmd.CommandText = " SELECT formateur.ID_For, formateur.img, formateur.Nom + ' ' + formateur.Prenom AS NomP, formateur.Email, Departement.Nom_Departement FROM formateur INNER JOIN G_F ON formateur.ID_For = G_F.ID_Formateur INNER JOIN Departement ON formateur.ID_Depart = Departement.ID_Dep WHERE G_F.ID_G = " + Session["ID_GP"];
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            GridEtab.DataSource = dataTable;
            GridEtab.DataBind();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            lbhader.Text = "Les Stagaire de group " + LBGroup.Text;
            GridEtab.Visible = false;
            Repeater1.Visible = false;
            GridView1.Visible = true;
            c.cmd.CommandText= "SELECT Etudiant.Nom+' '+ Etudiant.Prenom as nom, Etudiant.sex, Etudiant.DDN, Etudiant.Ville, Etudiant.img, Group_Et.Nom AS Nom_G, Annee_S.Annee_scolaire FROM Etudiant INNER JOIN Group_Et ON Etudiant.ID_GP = Group_Et.ID_Group INNER JOIN Annee_S ON Etudiant.Annee_scolaire = Annee_S.ID_A AND Group_Et.Annee_scolaire = Annee_S.ID_A WHERE Group_Et.ID_Group = " + Session["ID_GP"];
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            GridView1.DataSource = dataTable;
            GridView1.DataBind();
        }

        protected void lnCour_Click(object sender, EventArgs e)
        {
            Repeater1.Visible = true;
            GridView1.Visible = false;
            GridEtab.Visible = false;
        }

        protected void btnAfich_Click(object sender, EventArgs e)
        {
            LinkButton lnn = sender as LinkButton;
            Session["ID_Cours"] = lnn.CommandArgument.ToString();

            Response.Redirect("CoursPr.aspx");
        }

        protected void Prifil_Prof_Click(object sender, EventArgs e)
        {
            LinkButton link = sender as LinkButton;
            Session["Prof_V"] = link.CommandArgument.ToString();
            Response.Redirect("Profil_Formateur.aspx");
        }
    }
}