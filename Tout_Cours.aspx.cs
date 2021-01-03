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
    public partial class Tout_Cours : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

            Master.courss.Style["background-color"] = "rgb(211,211,211) !important";

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
                remplEtd();
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
                    c.dr.Close();
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
                    Master.Decx.Visible = true;

                    c.cmd = new SqlCommand("Select img,ID_Etab from Etablissement where Email= '" + Session["Etablissement"] + "'", con);
                    con.Open();
                    c.dr = c.cmd.ExecuteReader();
                    if (c.dr.Read())
                    {
                        Session["ID_E"] = c.dr["ID_Etab"].ToString();
                        Master.imgP.ImageUrl = c.dr["img"].ToString();
                    }
                    else
                    {
                        Master.imgP.ImageUrl = "~/imgProfil/ph.png";
                    }
                    c.dr.Close();
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
                    con.Close();
                }
                con.Close();
            }
            

            if (Session["CIN"] != null)
            {
                remplEtudFilier();
            }else
            if (Session["ID_Prof"] != null)
            {
                remplProfFilier();
            }else
            {
                remplToutFilier();
            }
            if (!IsPostBack)
                if (Session["CIN"] != null)
                {
                    remplEtd();
                }
                else
                {
                    rempl();
                }

        }

        protected void FFiliere_SelectedIndexChanged(object sender, EventArgs e)
        {
            c.cmd.CommandText = " SELECT DISTINCT Filire.Nom_Filire, cours.ID_Cour, cours.Nom AS Titre, cours.Description, cours.[Document], cours.La_Date, cours.Vedio, Module.Nome_Module, formateur.Nom + ' ' + formateur.Prenom AS NomProf FROM   Filire INNER JOIN  cours ON Filire.ID_Fil = cours.ID_Filiere INNER JOIN  formateur ON cours.ID_Prof = formateur.ID_For INNER JOIN Module ON cours.ID_Module = Module.ID_M  WHERE (cours.ID_Filiere =" + FFiliere.SelectedValue.ToString() +")";
            con.Open();
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            Repeater1.DataSource = dataTable;
            Repeater1.DataBind();
            con.Close();

        }
        void remplToutFilier()
        {
            c.cmd = new SqlCommand( "SELECT DISTINCT Filire.ID_Fil, Filire.Nom_Filire FROM Filire INNER JOIN cours ON Filire.ID_Fil = cours.ID_Filiere",con);
            con.Open();
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            FFiliere.DataSource = dataTable;
            FFiliere.DataBind();
            con.Close();
        }
        void remplEtudFilier()
        {
            c.cmd.CommandText = "SELECT DISTINCT Filire.ID_Fil, Filire.Nom_Filire FROM Filire INNER JOIN cours ON Filire.ID_Fil = cours.ID_Filiere where Filire.ID_Fil = " + Session["ID_Filir"] ;
            con.Open();
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            FFiliere.DataSource = dataTable;
            FFiliere.DataBind();
            con.Close();
        }
        void remplProfFilier()
        {
            string fil = "";
            c.cmd.CommandText = "select ID_Filire from Format_Filer where ID_Form = " + Session["ID_Prof"];
            con.Open();
            c.dr = c.cmd.ExecuteReader();
            while (c.dr.Read())
            {
                fil += c.dr[0].ToString() + ",";
            }
            fil = fil.Substring(0, fil.Length - 1);
            c.dr.Close();
            con.Close();
            c.cmd.CommandText = "SELECT DISTINCT Filire.ID_Fil, Filire.Nom_Filire FROM Filire INNER JOIN cours ON Filire.ID_Fil = cours.ID_Filiere where Filire.ID_Fil in (" + fil+")";
            con.Open();
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            FFiliere.DataSource = dataTable;
            FFiliere.DataBind();
            con.Close();
        }

        protected void FModule_SelectedIndexChanged(object sender, EventArgs e)
        {
            c.cmd.CommandText = " SELECT DISTINCT Filire.Nom_Filire, cours.ID_Cour, cours.Nom AS Titre, cours.Description, cours.[Document], cours.La_Date, cours.Vedio, Module.Nome_Module, formateur.Nom + ' ' + formateur.Prenom AS NomProf FROM   Filire INNER JOIN  cours ON Filire.ID_Fil = cours.ID_Filiere INNER JOIN  formateur ON cours.ID_Prof = formateur.ID_For INNER JOIN Module ON cours.ID_Module = Module.ID_M  WHERE (cours.ID_Module =" + FModule.SelectedValue.ToString() + ")";
            con.Open();
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            Repeater1.DataSource = dataTable;
            Repeater1.DataBind();
            con.Close();
        }

        protected void FProf_SelectedIndexChanged(object sender, EventArgs e)
        {
            c.cmd.CommandText = " SELECT DISTINCT Filire.Nom_Filire, cours.ID_Cour, cours.Nom AS Titre, cours.Description, cours.[Document], cours.La_Date, cours.Vedio, Module.Nome_Module, formateur.Nom + ' ' + formateur.Prenom AS NomProf FROM   Filire INNER JOIN  cours ON Filire.ID_Fil = cours.ID_Filiere INNER JOIN  formateur ON cours.ID_Prof = formateur.ID_For INNER JOIN Module ON cours.ID_Module = Module.ID_M  WHERE (cours.ID_Prof =" + FProf.SelectedValue.ToString() + ")";
            con.Open();
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            Repeater1.DataSource = dataTable;
            Repeater1.DataBind();
            con.Close();
        }
        void rempl()
        {
            con.Open();
            c.cmd = new SqlCommand(" SELECT DISTINCT cours.ID_Prof, Filire.Nom_Filire, cours.ID_Cour, cours.Nom AS Titre, cours.Description, cours.[Document], cours.La_Date, cours.Vedio, Module.Nome_Module, formateur.Nom + ' ' + formateur.Prenom AS NomProf FROM   Filire INNER JOIN  cours ON Filire.ID_Fil = cours.ID_Filiere INNER JOIN  formateur ON cours.ID_Prof = formateur.ID_For INNER JOIN Module ON cours.ID_Module = Module.ID_M  ", con);
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            Repeater1.DataSource = dataTable;
            Repeater1.DataBind();
            con.Close();
        }
       
        void remplEtd()
        {
            con.Open();
            c.cmd = new SqlCommand(" SELECT DISTINCT cours.ID_Prof, Filire.Nom_Filire, cours.ID_Cour, cours.Nom AS Titre, cours.Description, cours.[Document], cours.La_Date, cours.Vedio, Module.Nome_Module, formateur.Nom + ' ' + formateur.Prenom AS NomProf FROM   Filire INNER JOIN  cours ON Filire.ID_Fil = cours.ID_Filiere INNER JOIN  formateur ON cours.ID_Prof = formateur.ID_For INNER JOIN Module ON cours.ID_Module = Module.ID_M where cours.ID_Filiere = "+ Session["ID_Filir"], con);
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            Repeater1.DataSource = dataTable;
            Repeater1.DataBind();
            con.Close();

        }

        protected void toutC_Click(object sender, EventArgs e)
        {
            if (Session["CIN"] != null)
            {
                remplEtd();

            }
            else
            {
                rempl();
            }

            
        }

        protected void lnNom_Click(object sender, EventArgs e)
        {
            LinkButton lnn = sender as LinkButton;
            Session["ID_Cours"] = lnn.CommandArgument.ToString();
            Response.Redirect("CoursPr.aspx");
        }
    }
}