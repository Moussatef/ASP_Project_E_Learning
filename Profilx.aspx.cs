using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace WebApplication4
{
    public partial class Profilx : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());

        string path;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CIN"] != null)
            {
                Master.conx.Visible = false;
                Master.insc.Visible = false;
                Master.imgP.Visible = true;
                Master.profil.Visible = true;
                Master.Decx.Visible = true;
                Master.profil.Text = ""+ Session["NomEtd"];

                c.cmd = new SqlCommand(" Select E.*,Et.Nom_Etb,F.Nom_Filire,N.niveau_formation,G.Nom from Group_Et G ,Etudiant E , Etablissement Et,Filire F , NvFormation N  where E.Filire=F.ID_Fil and E.niveau_formation=N.ID_NF and E.ID_GP=G.ID_Group and E.Etablissement=Et.ID_Etab and CIN='" + Session["CIN"] + "'", con);
                con.Open();
                c.dr = c.cmd.ExecuteReader();
                if (c.dr.Read())
                {
                    DateTime dat = Convert.ToDateTime(c.dr["DDN"].ToString());
                    Session["Nom"] = c.dr["Nom"].ToString();
                    Master.imgP.ImageUrl = c.dr["img"].ToString();
                    imgPr.ImageUrl = c.dr["img"].ToString();
                    path= c.dr["img"].ToString();
                    lbNom.Text = c.dr["Nom"].ToString();
                    lbSex.Text = c.dr["sex"].ToString();
                    lbNvFr.Text = c.dr[16].ToString();
                    lbfile.Text = c.dr["Nom_Filire"].ToString();
                    lbEtab.Text = c.dr["Nom_Etb"].ToString();
                    lbEmail.Text = c.dr["userName"].ToString();
                    Label1.Text= c.dr["userName"].ToString();
                    int dd = Convert.ToInt32(dat.Month.ToString());
                    string ddx = dat.Month.ToString();
                    if (dd < 10)
                    {
                        ddx = "0" + ddx;
                    }
                    lbDDN.Text = dat.Year.ToString() + "/" + ddx + "/" + dat.Day.ToString();
                    lbCin.Text = c.dr["CIN"].ToString();
                    lbNomPrenom.Text = c.dr["Nom"].ToString() + " " + c.dr["Prenom"].ToString();
                    lbPrenom.Text = c.dr["Prenom"].ToString();
                    lGroup.Text = c.dr[18].ToString();
                    pass = c.dr["Password"].ToString();
                    pose.Text = "Etudiant";
                }
                else
                {
                    Master.imgP.ImageUrl = "~/imgProfil/ph.png";
                }
                con.Close();
            }
            else
            {
                if (Session["Admin"] != null)
                {
                   
                }
                else
                    Response.Redirect("Accuei.aspx");
            }
        }
        string pass;
        protected void btnMod_Click(object sender, EventArgs e)
        {
            zontxtA();
            LbD();
            Btn();
        }

        protected void btnMPss_Click(object sender, EventArgs e)
        {
            PSw();
        }
        public void PSw()
        {

            lbNmt.Visible = true;
            lbCmt.Visible = true;
            txtPass.Visible = true;
            txtPassconf.Visible = true;

            btnAnulPass.Visible = true;
            btnEMt.Visible = true;
            btnMPss.Visible = false;


        }
        public void PSwD()
        {

            lbNmt.Visible = false;
            lbCmt.Visible = false;
            txtPass.Visible = false;
            txtPassconf.Visible = false;

            btnAnulPass.Visible = false;
            btnEMt.Visible = false;
            btnMPss.Visible = true;

        }
        protected void btnEMt_Click(object sender, EventArgs e)
        {
            c.cmd = new SqlCommand("Update Etudiant set Password='" + txtPassconf.Text + "' where CIN='" + lbCin.Text + "'", con);
            con.Open();
            int i = c.cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                PSw();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           string strpath = Path.GetExtension(UpModifP.PostedFile.FileName),img=path, fileimg;
            if (strpath != "") { 
            if (strpath != ".jpg" && strpath != ".JPJ" && strpath != ".png" && strpath != ".PNG" && strpath != ".gif"  && strpath != ".GIF" && strpath != ".JPGE" && strpath != ".jpeg" )
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
                imgPr.ImageUrl = img;
            }
            }
            c.cmd = new SqlCommand("Update Etudiant set Nom='" + txtNom.Text + "',Prenom='" + txtPrenom.Text +"',img='"+img+ "',DDN='" + txtDDN.Text + "' where CIN='" + lbCin.Text + "'", con);
            con.Open();
            int i = c.cmd.ExecuteNonQuery();
            con.Close();
            if (i > 0)
            {
                PSwD();
                zontxtD();
                LbF();
                BtnD();

                Label3.Text = "Modifié avec succès";
                Label3.ForeColor = System.Drawing.Color.Green;
                
                
            }
            else
            {
                Label3.Text = "La modification n'a pas réussi";
                Label3.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnAnull_Click(object sender, EventArgs e)
        {
            PSwD();
            zontxtD();
            LbF();
            BtnD();
        }

        protected void btnAnulPass_Click(object sender, EventArgs e)
        {
            PSwD();
        }
        public void zontxtA()
        {
            txtNom.Visible = true;
            txtPrenom.Visible = true;
            txtDDN.Visible = true;
            UpModifP.Visible = true;

            txtNom.Text = lbNom.Text;
            txtPrenom.Text = lbPrenom.Text;
            txtDDN.Text = lbDDN.Text;
        }
        void zontxtD()
        {
            txtNom.Visible = false;
            txtPrenom.Visible = false;
            txtDDN.Visible = false;
            UpModifP.Visible = false;

            lbNom.Text = txtNom.Text;
            lbPrenom.Text = txtPrenom.Text;
            lbDDN.Text = txtDDN.Text;
        }
        public void Btn()
        {
            btnMPss.Visible = true;
            btnAnull.Visible = true;
            Button1.Visible = true;

            btnMod.Visible = false;
        }
        void BtnD()
        {
            btnMPss.Visible = false;
            btnAnull.Visible = false;
            Button1.Visible = false;

            btnMod.Visible = true;
        }
        public void LbD()
        {
            Label2.Visible = false;
            lbNom.Visible = false;
            lbPrenom.Visible = false;
            lbDDN.Visible = false;
        }
        void LbF()
        {
            Label2.Visible = true;
            lbNom.Visible = true;
            lbPrenom.Visible = true;
            lbDDN.Visible = true;
        }

        protected void lbEtab_Click(object sender, EventArgs e)
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

        protected void lbfile_Click(object sender, EventArgs e)
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
    }
}