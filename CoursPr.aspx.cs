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
    public partial class CoursPr : System.Web.UI.Page
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
            rempl();
        }

        void rempl()
        {
            con.Open();
            c.cmd.CommandText = " SELECT cours.Description ,cours.Document,cours.La_Date, cours.ID_Cour, cours.Nom , Filire.Nom_Filire as Filiere , Module.Nome_Module As Module,formateur.Nom,formateur.Prenom, cours.Vedio FROM  cours  INNER JOIN Filire ON cours.ID_Filiere = Filire.ID_Fil INNER JOIN Module on Module.ID_M=cours.ID_Module INNER JOIN formateur on cours.ID_Prof=formateur.ID_For where ID_Cour =" + Session["ID_Cours"];
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            lbNom.Text = dataTable.Rows[0][4].ToString();
            lbDesc.Text = dataTable.Rows[0][0].ToString();
            lbFil.Text = dataTable.Rows[0][5].ToString();
            lbMod.Text = dataTable.Rows[0][6].ToString();
            lbDate.Text = dataTable.Rows[0][2].ToString();
            lbprof.Text = dataTable.Rows[0][7].ToString()+" "+ dataTable.Rows[0][8].ToString(); 
            lnFile.CommandArgument= dataTable.Rows[0][1].ToString();
            this.pdfP.InnerHtml= "<iframe src='" + dataTable.Rows[0][1].ToString() + "'  width='100%' height='800px' ></iframe> ";
            this.pvds.InnerHtml = "<h3>Video player : </h3> <video runat='server' src='" + dataTable.Rows[0][9].ToString() + "' controls max-width='100%' height='500px'  ID='vdPlyr' ></video> ";


            con.Close();
        
        }

        protected void lnFile_Click(object sender, EventArgs e)
        {
            Response.Redirect(lnFile.CommandArgument.ToString());
        }
    }
}