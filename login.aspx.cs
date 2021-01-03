using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Data;

namespace WebApplication4
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.conx.Style["background-color"] = "rgb(211,211,211) !important";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
            con.Open();
            c.cmd = new SqlCommand("Select count(*) from Admine where user_name='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'", con);
            string res = c.cmd.ExecuteScalar().ToString();
            if (res == "1")
            {
                Session["Admin"] = TextBox1.Text;
                Response.Redirect("~/Accuei.aspx");
            }
            else
            {
                c.cmd.CommandText = "Select count(*) from formateur where Email='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'";
                string res1 = c.cmd.ExecuteScalar().ToString();
                if (res1 == "1")
                {
                    c.cmd.CommandText = "Select * from formateur where Email='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'";
                    c.dr = c.cmd.ExecuteReader();
                    if (c.dr.Read())
                    {
                        Session["NomProf"] = c.dr[1].ToString() + " " + c.dr[2].ToString();
                        Session["ID_Prof"] = c.dr[0].ToString();
                        Session["img_Prof"] = c.dr["img"].ToString();
                        Response.Redirect("Accuei.aspx");
                    }
                    

                }
                else
                {

                    c.cmd.CommandText = "Select count(*) from Etudiant where userName='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'";
                    string res2 = c.cmd.ExecuteScalar().ToString();
                    if (res2 == "1")
                    {
                        c.cmd.CommandText = "Select * from Etudiant where userName='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'";
                        c.dr = c.cmd.ExecuteReader();
                        if (c.dr.Read())
                        {
                            if (c.dr["Act"].ToString() == "1")
                            {
                                Session["NomEtd"] = c.dr[1].ToString() + " " + c.dr[2].ToString();
                                Session["CIN"] = c.dr[0].ToString();
                                Session["img_Etd"] = c.dr["img"].ToString();
                                Session["ID_Filir"] = c.dr["Filire"].ToString();
                                Response.Redirect("Accuei.aspx");
                            }
                        }

                    }
                    else
                    {
                        c.cmd.CommandText = "Select count(*) from Etablissement where Email='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'";
                        string res3 = c.cmd.ExecuteScalar().ToString();
                        if (res3 == "1")
                        {
                            Session["Etablissement"] = TextBox1.Text;
                            Response.Redirect("~/Accuei.aspx");
                        }
                        else
                        {
                            Err.Text = "User Name Or Password False";
                        }
                        con.Close();
                    }
                    con.Close();
                }
                con.Close();
            }
            //Err.Text = "User Name Or Password False";
            Err.ForeColor = System.Drawing.Color.Red;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/registerEtud.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                var result = recoverpsw(TextBox1.Text);
                LinkButton1.Visible = false;
                msg.Text= "- " + result +"!! ";
            }
        }
        public string recoverpsw(string userRequest)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
            con.Open();
            DataTable EmailUser = new DataTable();
            EmailUser.Columns.Add("userName");
            //EmailUser.Columns.Add("Password");
            //EmailUser.Columns.Add("NOM");
            string matricule = userRequest,  res1 ; 
            c.cmd =new SqlCommand( "Select count(*) from Etudiant where userName='"+ matricule + "'",con);
            res1 = c.cmd.ExecuteScalar().ToString();
            if (res1 == "1")
            {
                c.cmd.CommandText = "Select * from Etudiant where userName='" + matricule + "'";
                c.dr = c.cmd.ExecuteReader();
                if (c.dr.Read())
                {
                    EmailUser.Rows.Add(  c.dr["userName"].ToString());
                    EmailUser.Rows.Add(c.dr["Password"].ToString());
                    EmailUser.Rows.Add( c.dr[1].ToString() + " " + c.dr[2].ToString());
                }
            }
            try
            {
            if (EmailUser.Rows[0][0].ToString() != "")
            {
                   
                var mailServer = new sysMail();
                mailServer.sendMail(
                    subject: "SYSTEM : Projet E Learning GBM Demande de récupération de mot de passe  ",
                    body: "salut," + EmailUser.Rows[2][0].ToString() + "\nVous avez demandé à récupérer votre mot de passe.\n" +
                    "votre mot de passe actuel est : " + EmailUser.Rows[1][0].ToString() +
                    "\nCependant, nous vous demandons de changer votre mot de passe dès que vous entrez dans le système. Projet E Learning GBM",
                    recipientMail: new List<string> { EmailUser.Rows[0][0].ToString() }
                    );
                return "Salut, " + EmailUser.Rows[2][0].ToString() + "\nVous avez demandé à récupérer votre mot de passe.\n" +
                    "Merci de consulter vos email : " + EmailUser.Rows[0][0].ToString() +
                    "\nCependant, nous vous demandons de changer votre mot de passe dès que vous entrez dans le système.";
            }
            else
            {
                return "Désolé, vous n'avez pas de profil avec Email, vous devez être en contact avec le service Admin ";
                
            }
            }
            catch { 
                msg.Text = "L'e-mail n'existe pas ou n'est pas enregistré";
                return "L'e-mail n'existe pas ou n'est pas enregistré ";
             }

        }
    }
}