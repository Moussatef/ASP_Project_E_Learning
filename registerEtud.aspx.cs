using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace WebApplication4
{
    public partial class registerEtud : System.Web.UI.Page
    {
        string img, sex, fileimg, strpath;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.insc.Style["background-color"] = "rgb(211,211,211) !important";
            if (!Page.IsPostBack)
            {
                region.Items.Add("Sélectionnez une région");
                region.Items.Add("BENI MELLAL-KHENIFRA");
                region.Items.Add("CASABLANCA-SETTAT");
                region.Items.Add("DRAA-TAFILALET");
                region.Items.Add("ED DAKHLA-OUED ED DAHAB");
                region.Items.Add("FES-MEKNES");
                region.Items.Add("GUELMIME-OUED NOUN");
                region.Items.Add("LAAYOUNE-SAGUIA AL HAMRA");
                region.Items.Add("MARRAKECH-SAFI");
                region.Items.Add("ORIENTAL ET RIF");
                region.Items.Add("RABAT-SALE-KENITRA");
                region.Items.Add("SOUSS-MASSA");
                region.Items.Add("TANGER-TETOUAN-AL HOCEIMA");

                villeEtd.Items.Add("Sélectionnez une ville");
                etabllis.Items.Add("Trouver un établissement");
                filire.Items.Add("Trouver un filire");
                groupEt.Items.Insert(0, "Trouver une Group");
                cmb.Items.Add("Trouver une formation");

                anne.Items.Insert(0, "Sélectionnez une Annee");
                anne.Items.Insert(1, "Première année");
                anne.Items.Insert(2, "Deuxième année");
            }


        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
        }

        protected void Unnamed8_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
       
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (anne.SelectedValue != "Sélectionnez une Annee" && villeEtd.SelectedValue != "Sélectionnez une ville" && etabllis.SelectedValue != "Trouver un établissement" && filire.SelectedValue != "Trouver un filire" && cmb.SelectedValue != "Trouver une formation")
            {
                strpath = Path.GetExtension(FilPhot.PostedFile.FileName);
                if (strpath != ".jpg" && strpath != ".png" && strpath != ".gif" && strpath != ".jpeg")
                {
                    FilMess.Text = "Only Image type .jpg || .jpeg || .gif || .png";
                    FilMess.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    string random = Guid.NewGuid().ToString();
                    fileimg = Path.GetFileName(FilPhot.PostedFile.FileName);
                    FilPhot.SaveAs(Server.MapPath("/imgProfil/") + random + fileimg);
                    img = "/imgProfil/"+ random + fileimg;
                    FilMess.Text = "Profil Image is saved";
                    FilMess.ForeColor = System.Drawing.Color.Green;
                }
                if (RdMale.Checked)
                    sex = "Male";
                else
                if (RdFemme.Checked)
                    sex = "Femme";
                else
                    FilRegist.Text = "sex !!! unvalide";

                string cmdt = "INSERT INTO Etudiant VALUES ('" +
                            txtCIN.Text + "', '" + txtNom.Text + "', '" + txtPrenom.Text + "', '" + sex + "', '" +
                            ddn.Text + "', '" + txtEmail.Text + "', '" +
                            txtPass.Text + "', '" + villeEtd.Text + "', "
                            + etabllis.SelectedIndex.ToString()
                            + ", " + filire.SelectedIndex.ToString()
                            + ",'" + img
                            + "'," + cmb.Text.ToString()
                            + "," + anne.SelectedIndex.ToString()
                            + "," + groupEt.SelectedValue.ToString() + ",'1')";
                con.Open();
                c.cmd = new SqlCommand(cmdt, con);
                int i = c.cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    FilRegist.Text = "Sccsus Registion";
                    FilRegist.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("login.aspx");
                }
                else
                {
                    FilRegist.Text = "Filde Registion";
                    FilMess.ForeColor = System.Drawing.Color.Red;
                }


            }
            else
            {
                FilRegist.Text = "les champs avec * ne peuvent pas être vides !!!";
                FilRegist.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void region_SelectedIndexChanged(object sender, EventArgs e)
        {
            villeEtd.Items.Clear();
            string r = region.Text;
            string req = "select Nom_Ville from Ville where Reg in (select ID_R from Region where Nom_Reg='" + r + "')";
            con.Open();
            c.cmd = new SqlCommand(req, con);
            c.dr = c.cmd.ExecuteReader();
            villeEtd.Items.Add("Sélectionnez une ville");
            while (c.dr.Read())
            {
                villeEtd.Items.Add(c.dr[0].ToString());
            }
            c.dr.Close();
            con.Close();

        }

        protected void villeEtd_SelectedIndexChanged(object sender, EventArgs e)
        {
            etabllis.Items.Clear();
            string r = villeEtd.Text;
            string req = "select ID_Etab,Nom_Etb from Etablissement where ID_Ville in (select ID_ville from Ville where Nom_Ville='" + r + "')";
            con.Open();
            c.cmd = new SqlCommand(req, con);
            c.dr = c.cmd.ExecuteReader();
            etabllis.Items.Insert(0, "Trouver un établissement");
            while (c.dr.Read())
            {
                etabllis.Items.Insert(Convert.ToInt32(c.dr[0].ToString()), c.dr[1].ToString());
            }
            c.dr.Close();
            con.Close();
        }

        protected void etabllis_SelectedIndexChanged(object sender, EventArgs e)
        {
            filire.Items.Clear();
            string r = etabllis.Text;
            string req = "select ID_Fil, Nom_Filire from Filire where ID_Fil in (select ID_Fil from Fill_Etable where ID_Etabli in (select ID_Etab from Etablissement where Nom_Etb='" + r + "'))";
            con.Open();
            c.cmd = new SqlCommand(req, con);
            c.dr = c.cmd.ExecuteReader();
            filire.Items.Insert(0, "Trouver un filire");
            while (c.dr.Read())
            {
                filire.Items.Insert(Convert.ToInt32(c.dr[0].ToString()), c.dr[1].ToString());
            }
            c.dr.Close();
            con.Close();
        }

        protected void cmb_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void filire_SelectedIndexChanged(object sender, EventArgs e)
        {


            string r = filire.Text;
            string req = "select ID_NF, niveau_formation  from  NvFormation  where  ID_NF in (select ID_NV from Filire where Nom_Filire ='" + r + "')";
            string req1 = "select  ID_Group,Nom  from Group_Et where  Filire=" + filire.SelectedIndex.ToString();

            SqlCommand cmd1, cmd2;
            cmd1 = new SqlCommand(req, con);
            cmd2 = new SqlCommand(req1, con);


            DataTable dt1, dt2;
            dt1 = new DataTable();
            dt2 = new DataTable();


            SqlDataAdapter dtp1, dtp2;
            dtp1 = new SqlDataAdapter(cmd1);
            dtp2 = new SqlDataAdapter(cmd2);



            con.Open();
            cmd1.CommandType = CommandType.Text;
            cmb.DataSource = cmd1.ExecuteReader();
            cmb.DataTextField = "niveau_formation";
            cmb.DataValueField = "ID_NF";
            cmb.DataBind();
            //cmb.Items.Insert(0, "Trouver une formation");
            con.Close();

            con.Open();
            cmd2.CommandType = CommandType.Text;
            groupEt.DataSource = cmd2.ExecuteReader();
            groupEt.DataTextField = "Nom";
            groupEt.DataValueField = "ID_Group";
            groupEt.DataBind();
            //groupEt.Items.Insert(0, "Trouver une Group");
            con.Close();
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        //protected void validPH_Click(object sender, EventArgs e)
        //{
            //if (System.IO.File.Exists(@"/css/im/" + fileimg))
            //{
                
            //    // Use a try block to catch IOExceptions, to
            //    // handle the case of the file already being
            //    // opened by another process.
            //    try
            //    {
            //        System.IO.File.Delete(@"/css/im/" + fileimg);
            //    }
            //    catch (System.IO.IOException ex)
            //    {
            //        FilMess.Text = ex.Message;
            //        return;
            //    }
            //}
            //else
            //{
            //    
            //    if (strpath != ".jpg" && strpath != ".png" && strpath != ".gif" && strpath != ".jpeg")
            //    {
            //        FilMess.Text = "Only Image type .jpg || .jpeg || .gif || .png";
            //        FilMess.ForeColor = System.Drawing.Color.Red;
            //    }
            //    else
            //    {
            //        fileimg = Path.GetFileName(FilPhot.PostedFile.FileName);
            //        FilPhot.SaveAs(Server.MapPath("/css/im/") + fileimg);
            //        img = "/css/im/" + fileimg;
            //        Image1.ImageUrl = img;
                   
            //    }
            //}
            
            
           
        //}
    }
}