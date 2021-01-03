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
using System.Net;
using System.Collections;

namespace WebApplication4
{
    public partial class Ajouter_Cours : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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
                    c.cmd = new SqlCommand(" SELECT formateur.* FROM formateur  where formateur.ID_For=" + Session["ID_Prof"], con);
                    con.Open();
                    c.dr = c.cmd.ExecuteReader();
                    if (c.dr.Read())
                    {
                        txtRealise.Text = c.dr[1].ToString()+" "+ c.dr[2].ToString();
                    }
                    c.dr.Close();
                    remplDFil();
                    rempl();
                    rempleGRP();



                }
        }
        void rempl()
        {
            c.cmd.CommandText = " SELECT   cours.ID_Prof,cours.Document,cours.La_Date, cours.ID_Cour, cours.Nom , Filire.Nom_Filire as Filiere , Module.Nome_Module As Module FROM  cours  INNER JOIN Filire ON cours.ID_Filiere = Filire.ID_Fil INNER JOIN Module on Module.ID_M=cours.ID_Module  where cours.ID_Prof=" + Session["ID_Prof"];
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            Repeater1.DataSource = dataTable;
            Repeater1.DataBind();
        }
        
        protected void save_Click(object sender, EventArgs e)
        {
            string dec=" ", strG2="", decVd =" ", fileimg, fileVD, vdpath, strpath, random = Guid.NewGuid().ToString();
           
            
            vdpath  = Path.GetExtension(upvd.PostedFile.FileName);
            if (vdpath==".mp4" || vdpath == ".m4a" || vdpath == ".m4v" || vdpath == ".f4v" || vdpath == ".f4a" || vdpath == ".m4b" || vdpath == ".m4r" || vdpath == ".mov" || vdpath == ".f4b" || vdpath == ".3gp"  || vdpath == ".wmv" || vdpath == ".wma" || vdpath == ".flv" )
            {
                fileVD = Path.GetFileName(DecumentUp.PostedFile.FileName);
                DecumentUp.SaveAs(Server.MapPath("/Cours/") + random + fileVD);
                decVd = "/Cours/" + random + fileVD;
            }
            strpath = Path.GetExtension(DecumentUp.PostedFile.FileName);
            if (strpath != ".jpg" && strpath != ".dec" && strpath != ".pdf" && strpath != ".pptx")
            {
                FilMess.Text = "Only Image type .jpg || .dec || .pdf || .pptx";
                FilMess.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                fileimg = Path.GetFileName(DecumentUp.PostedFile.FileName);
                DecumentUp.SaveAs(Server.MapPath("/Cours/") + random + fileimg);
                dec = "/Cours/" + random + fileimg;

                string cmdt = "INSERT INTO cours VALUES ('" + txtNom.Text + "','" + txtDesc.Text + "','" + dec + "'," + Session["ID_Prof"] + "," + Filire.SelectedValue.ToString() +
                    "," + Module.SelectedValue.ToString() +",'"+DateTime.Now.ToString() +"','"+ decVd + "')";
                
                c.cmd.CommandText = cmdt;
                c.cmd.ExecuteNonQuery();

                c.cmd.CommandText = "SELECT ID_Cour  FROM   cours" ;
                SqlDataAdapter adapter2 = new SqlDataAdapter(c.cmd);
                DataTable dataTable2 = new DataTable();
                adapter2.Fill(dataTable2);

                for (int i = 0; i < grdGr.Rows.Count; i++)
                {
                    CheckBox chk = grdGr.Rows[i].FindControl("chkG1") as CheckBox;
                    if (chk.Checked == true)
                    {
                        c.cmd.CommandText = "INSERT INTO Group_Cours VALUES (" + grdGr.DataKeys[i].Value.ToString() + ","
                                             +dataTable2.Rows[dataTable2.Rows.Count-1][0].ToString() +")";
                        c.cmd.ExecuteNonQuery();
                    }
                }
                FilMess.Text = "Cours Enregistré avec succès";
                FilMess.ForeColor = System.Drawing.Color.Green;
                rempl();
            }
        }
        void remplDFil()
        {
            c.cmd.CommandText = "SELECT Filire.ID_Fil, Filire.Nom_Filire FROM formateur  INNER JOIN Format_Filer ON formateur.ID_For = Format_Filer.ID_Form INNER JOIN Filire on Filire.ID_Fil=Format_Filer.ID_Filire  where formateur.ID_For="+Session["ID_Prof"];
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            Filire.DataSource = dataTable;
            Filire.DataBind();
        }
        void rempleGRP()
        {

            c.cmd.CommandText = "SELECT Group_Et.Nom, Group_Et.ID_Group FROM Filire INNER JOIN Group_Et ON Filire.ID_Fil = Group_Et.Filire INNER JOIN G_F ON Group_Et.ID_Group = G_F.ID_G WHERE (Filire.ID_Fil = "+Filire.SelectedValue.ToString()+") AND (G_F.ID_Formateur ="+Session["ID_Prof"]+")";
            SqlDataAdapter dtp = new SqlDataAdapter(c.cmd);
            DataTable dataTable = new DataTable();
            dtp.Fill(dataTable);
            grdGr.DataSource = dataTable;
            grdGr.DataBind();

        }
        protected void Filire_SelectedIndexChanged(object sender, EventArgs e)
        {

            rempleGRP();

        }

        protected void lnNom_Click(object sender, EventArgs e)
        {
            LinkButton lnn = sender as LinkButton;
            Session["ID_Cours"] =  lnn.CommandArgument.ToString();

            Response.Redirect("CoursPr.aspx");

            //string filePath = Server.MapPath(map);
            //WebClient user = new WebClient();
            //Byte[] File = user.DownloadData(filePath);
            //if (File != null)
            //{
            //    Response.ContentType = "application/pdf";
            //    Response.AppendHeader("contant length", File.Length.ToString());
            //    Response.BinaryWrite(File);
            //}
        }
    }
}