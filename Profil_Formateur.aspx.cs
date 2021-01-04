using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;

namespace WebApplication4
{
    public partial class Profil_Formateur : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        protected void Page_Load(object sender, EventArgs e)
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
                Master.imgP.ImageUrl = "" + Session["img_Prof"];
                c.cmd = new SqlCommand(" SELECT formateur.*, Ville.Nom_Ville, Etablissement.Nom_Etb FROM formateur  INNER JOIN Etablissement ON formateur.ID_Etb = Etablissement.ID_Etab INNER JOIN Ville ON formateur.ID_Ville = Ville.ID_ville  where formateur.ID_For=" + Session["ID_Prof"], con);
                con.Open();
                c.dr = c.cmd.ExecuteReader();
                if (c.dr.Read())
                {
                    lbnom.Text = c.dr[1].ToString();
                    lbprenom.Text = c.dr[2].ToString();
                    lbemail.Text = c.dr[6].ToString();
                    lbDesc.Text = c.dr[7].ToString();
                    if (c.dr[8].ToString() != "")
                        imgP.ImageUrl = c.dr[8].ToString();
                    else
                        imgP.ImageUrl = "~/imgProfil/ph.png";
                    //lbetabless.Text = c.dr["Nom_Etb"].ToString();
                    lbville.Text = c.dr["Nom_Ville"].ToString();
                }
                c.dr.Close();
                con.Close();
            }
            else
            {
                if (Session["IDF_V"] != null)
                {
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

                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
                        c.cmd = new SqlCommand("Select * from Etablissement where Email= '" + Session["Etablissement"] + "'", con);
                        con.Open();
                        c.dr = c.cmd.ExecuteReader();
                        if (c.dr.Read())
                        {
                            Master.imgP.ImageUrl = c.dr["img"].ToString();
                        }
                        c.dr.Close();
                    }
                    btnMod.Visible = false;
                    LBmotpass.Visible = false;
                    Label2.Visible = false;

                    c.cmd = new SqlCommand(" SELECT formateur.*, Ville.Nom_Ville, Etablissement.Nom_Etb FROM formateur  INNER JOIN Etablissement ON formateur.ID_Etb = Etablissement.ID_Etab INNER JOIN Ville ON formateur.ID_Ville = Ville.ID_ville  where formateur.ID_For=" + Session["IDF_V"], con);
                    con.Open();
                    c.dr = c.cmd.ExecuteReader();
                    if (c.dr.Read())
                    {
                        lbnom.Text = c.dr[1].ToString();
                        lbprenom.Text = c.dr[2].ToString();
                        lbemail.Text = c.dr[6].ToString();
                        lbDesc.Text = c.dr[7].ToString();
                        if (c.dr[8].ToString() != "")
                            imgP.ImageUrl = c.dr[8].ToString();
                        else
                            imgP.ImageUrl = "~/imgProfil/ph.png";
                        //lbetabless.Text = c.dr["Nom_Etb"].ToString();
                        lbville.Text = c.dr["Nom_Ville"].ToString();
                    }
                    c.dr.Close();
                    con.Close();
                }else
                
                if (Session["Prof_V"] != null && Session["CIN"] != null)
                {
                    btnV();
                    Master.conx.Visible = false;
                    Master.insc.Visible = false;
                    Master.imgP.Visible = true;
                    Master.profil.Visible = true;
                    Master.profil.Text = " " + Session["NomEtd"];
                    Master.Decx.Visible = true;
                    LBmotpass.Visible = false;
                    Label2.Visible = false;

                    c.cmd = new SqlCommand(" SELECT formateur.*, Ville.Nom_Ville, Etablissement.Nom_Etb FROM formateur  INNER JOIN Etablissement ON formateur.ID_Etb = Etablissement.ID_Etab INNER JOIN Ville ON formateur.ID_Ville = Ville.ID_ville  where formateur.ID_For=" + Session["Prof_V"], con);
                    con.Open();
                    c.dr = c.cmd.ExecuteReader();
                    if (c.dr.Read())
                    {
                        lbnom.Text = c.dr[1].ToString();
                        lbprenom.Text = c.dr[2].ToString();
                        lbemail.Text = c.dr[6].ToString();
                        lbDesc.Text = c.dr[7].ToString();
                        if (c.dr[8].ToString() != "")
                            imgP.ImageUrl = c.dr[8].ToString();
                        else
                            imgP.ImageUrl = "~/imgProfil/ph.png";
                        //lbetabless.Text = c.dr["Nom_Etb"].ToString();
                        lbville.Text = c.dr["Nom_Ville"].ToString();
                    }
                    c.dr.Close();
                    con.Close();
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
                    Response.Redirect("Accuei.aspx");
                }
            }
            
        }
        public void PSw()
        {
            if (btnEMt.Visible != true)
            {
                lbNmt.Visible = true;
                lbCmt.Visible = true;
                txtPass.Visible = true;
                txtPassconf.Visible = true;

                btnAnulPass.Visible = true;
                btnEMt.Visible = true;
                btnMPss.Visible = false;
            }

        }
        public void btnV()
        {
            btnMod.Visible = false;

        }
        public void PSwD()
        {
                lbNmt.Visible = false;
                lbCmt.Visible = false;
                txtPass.Visible = false;
                txtPassconf.Visible = false;

                btnAnulPass.Visible = false;
                btnEMt.Visible = false;
                btnMPss.Visible = false;
            
        }
        public void zontxtA()
        {

            txtNom.Visible = true;
            txtPrenom.Visible = true;
            UpModifP.Visible = true;
            txtDesc.Visible = true;
            txtEmail.Visible = true;
            drville.Visible = true;

            txtNom.Text = lbnom.Text;
            txtPrenom.Text = lbprenom.Text;
            txtEmail.Text = lbemail.Text;
            txtDesc.Text = lbDesc.Text;
        }
        public void zontxtD()
        {
            lbnom.Text = txtNom.Text;
            lbprenom.Text = txtPrenom.Text;
            lbemail.Text = txtEmail.Text;
            lbDesc.Text = txtDesc.Text;

            txtNom.Visible = false;
            txtPrenom.Visible = false;
            UpModifP.Visible = false;
            txtDesc.Visible = false;
            txtEmail.Visible = false;
            drville.Visible = false;

        }
        public void Btn()
        {
                btnMPss.Visible = true;
                btnAnull.Visible = true;
                Button1.Visible = true;

                btnMod.Visible = false;
          
        }
        void btnD()
        {
            btnMPss.Visible = false;
            btnAnull.Visible = false;
            Button1.Visible = false;
            btnAnulPass.Visible = false;

            btnMod.Visible = true;
        }
        public void LbF()
        {
            Label2.Visible = false;
            lbnom.Visible = false;
            lbprenom.Visible = false;
            lbDesc.Visible = false;
            lbemail.Visible = false;
            lbville.Visible = false;
        }
        void lbD()
        {
            Label2.Visible = true;
            lbnom.Visible = true;
            lbprenom.Visible = true;
            lbDesc.Visible = true;
            lbemail.Visible = true;
            lbville.Visible = true;
        }

        protected void btnMPss_Click(object sender, EventArgs e)
        {
            PSw();
        }

        protected void btnEMt_Click(object sender, EventArgs e)
        {
            c.cmd = new SqlCommand("Update Etudiant set Password='" + txtPassconf.Text + "' where formateur=" +Session["ID_Prof"]  , con);
            con.Open();
            int i = c.cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                PSwD();
            }
        }

        protected void btnAnulPass_Click(object sender, EventArgs e)
        {
            PSwD();
            btnMPss.Visible = true;
        }

        protected void btnAnull_Click(object sender, EventArgs e)
        {
            PSwD();
            zontxtD();
            lbD();
            btnD();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strpath = Path.GetExtension(UpModifP.PostedFile.FileName), img = "" + Session["img_Prof"], fileimg;
            if (strpath != "")
            {
            if (strpath != ".jpg" && strpath != ".png" && strpath != ".gif" && strpath != ".jpeg" )
            {
                FilMess.Text = "Only Image type .jpg || .jpeg || .gif || .png";
                FilMess.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                string random = Guid.NewGuid().ToString();
                fileimg = Path.GetFileName(UpModifP.PostedFile.FileName);
                UpModifP.SaveAs(Server.MapPath("/imgProfil/") + random + fileimg);
                img = "/imgProfil/" + random + fileimg;
                FilMess.Text = "Profil Image is saved";
                FilMess.ForeColor = System.Drawing.Color.Green;
                imgP.ImageUrl = img;
            }
            }
            c.cmd = new SqlCommand("Update formateur set Nom='" + txtNom.Text + "',Prenom='" + txtPrenom.Text +"',ID_Ville="+drville.SelectedValue.ToString()+ ",img='" + img +"',Description='"+txtDesc.Text+ "' where ID_For=" +Session["ID_Prof"], con);
            con.Open();
            int i = c.cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                PSwD();
                zontxtD();
                lbD();
                btnD();
                Label3.Text = "Modifié avec succès";
                Label3.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label3.Text = "La modification n'a pas réussi";
                Label3.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnMod_Click(object sender, EventArgs e)
        {
            zontxtA();
            LbF();
            Btn();
        }

        protected void Grp_Click(object sender, EventArgs e)
        {

        }

        protected void Filir_Click(object sender, EventArgs e)
        {
            LinkButton File1 = sender as LinkButton;
            
            c.cmd = new SqlCommand("SELECT ID_Fil  FROM Filire where Nom_Filire = '" + File1.Text + "'", con);
            con.Open();
            c.dr = c.cmd.ExecuteReader();
            if (c.dr.Read())
            {
                Session["ID_M"] = c.dr[0].ToString();
                Response.Redirect("Module.aspx");
            }
            con.Close();
        }

        protected void Etab_Click(object sender, EventArgs e)
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

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}