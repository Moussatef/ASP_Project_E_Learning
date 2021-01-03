using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.Common;
using System.Collections;

namespace WebApplication4
{
    public partial class ADD_Prof : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
        SqlDataAdapter dtp, dtp1;
        DataTable dt = new DataTable();
        ArrayList myAL = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
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
                    ViewState["ID_EE"] = c.dr[0].ToString();
                    Master.imgP.ImageUrl = c.dr["img"].ToString();
                    etab.Text = c.dr["Nom_Etb"].ToString();

                }
                c.dr.Close();

                c.cmd.CommandText = "SELECT  Ville.Nom_Ville,Ville.ID_ville FROM   Etablissement INNER JOIN  Ville ON Etablissement.ID_Ville = Ville.ID_ville  where Email='" + Session["Etablissement"] + "'";
                c.dr = c.cmd.ExecuteReader();
                if (c.dr.Read())
                {
                    vill.Text = c.dr[0].ToString();
                    ViewState["ID_Ville"] = c.dr[1].ToString();
                }
                c.dr.Close();
                try
                {
                    if (!IsPostBack)
                    {
                        GridView2.DataSource = SqlDataSource2;
                        GridView2.DataBind();
                    }
                }
                catch
                {

                }
                //con.Close();
            }

        }

        string str = "", strp = "", strG2 = "";
        private void UpdateEmployeeInfo(string ID, string Nom, string Prenom, string Email)
        {
            try
            {
                c.cmd.CommandText = "UPDATE formateur SET Nom = @Nom, Prenom = @Prenom, Email = @Email WHERE ID_For = @ID";
                c.cmd.Parameters.AddWithValue("@Nom", Nom);
                c.cmd.Parameters.AddWithValue("@Prenom", Prenom);
                c.cmd.Parameters.AddWithValue("@Email", Email);
                c.cmd.Parameters.AddWithValue("@ID", ID);
                c.cmd.ExecuteNonQuery();
                GridView2.EditIndex = -1;
                SqlDataSource2.DataBind();
                GridView2.DataSource = SqlDataSource2;
                GridView2.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            GridView2.DataSource = SqlDataSource2;
            GridView2.DataBind();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvrow = GridView2.Rows[e.RowIndex];
            TextBox txtNomD = (TextBox)gvrow.FindControl("txtNomD");
            TextBox txtPrenomD = (TextBox)gvrow.FindControl("txtPrenomD");
            TextBox txtEmailD = (TextBox)gvrow.FindControl("txtEmailD");

            string ID = GridView2.DataKeys[e.RowIndex].Value.ToString();

            string Nom = txtNomD.Text;
            string Prenom = txtPrenomD.Text;
            string Email = txtEmailD.Text;

            UpdateEmployeeInfo(ID, Nom, Prenom, Email);
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ID = GridView2.DataKeys[e.RowIndex].Value.ToString();
            try
            {
                c.cmd.CommandText = "delete from formateur where ID_For=" + ID;
                c.cmd.ExecuteNonQuery();
                GridView2.EditIndex = -1;
                SqlDataSource2.DataBind();
                GridView2.DataSource = SqlDataSource2;
                GridView2.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void profilF_Click(object sender, EventArgs e)
        {
            LinkButton prf = (LinkButton)sender;


        }

        protected void GridView2_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

            //GridViewRow gvrow = GridView2.Rows[e.RowIndex];
            string ID = GridView2.DataKeys[e.NewSelectedIndex].Value.ToString();
            Session["IDF_V"] = ID;
            Response.Redirect("Profil_Formateur.aspx");
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            SqlDataSource2.DataBind();
            GridView2.DataSource = SqlDataSource2;
            GridView2.DataBind();
        }

        protected void btnEnrg_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < grdGr1.Rows.Count; i++)
                {
                    CheckBox chk = grdGr1.Rows[i].FindControl("chkG1") as CheckBox;
                    if (chk.Checked == true)
                    {
                        strp += ("'" + grdGr1.Rows[i].Cells[1].Text + "',");
                    }
                }

                for (int i = 0; i < grdGrp.Rows.Count; i++)
                {
                    CheckBox chk = grdGrp.Rows[i].FindControl("chkG2") as CheckBox;
                    if (chk.Checked == true)
                    {
                        strG2 += ("'" + grdGrp.Rows[i].Cells[2].Text + "',");
                    }
                }
                if (strp != "")
                    strp = strp.Substring(0, strp.Length - 1);
                else
                    strp = "''";

                if (strG2 != "")
                    strG2 = strG2.Substring(0, strG2.Length - 1);
                else
                    strG2 = "''";

               

                c.cmd.CommandText = "Insert into formateur (Nom,Prenom,Password,ID_Etb,ID_Ville,Email) values('" +
                                                           txtNom.Text + "','" + txtPrenom.Text + "','" + txtPassconf.Text + "'," + ViewState["ID_EE"] +
                                                           "," + ViewState["ID_Ville"] + ",'" + txtEmail.Text + "')";
                int s1 = c.cmd.ExecuteNonQuery();
                int s2 = 0, s3 = 0;
                c.cmd.CommandText = "SELECT Group_Et.ID_Group  FROM   Group_Et  WHERE   (Group_Et.Nom IN (" + strp + "," + strG2 + "))";
                SqlDataAdapter adapter = new SqlDataAdapter(c.cmd);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                c.cmd.CommandText = "SELECT ID_For  FROM   formateur  WHERE Nom='" +
                                   txtNom.Text + "' and Prenom = '" + txtPrenom.Text + "' and Email ='" + txtEmail.Text + "'";
                SqlDataAdapter adapter2 = new SqlDataAdapter(c.cmd);
                DataTable dataTable2 = new DataTable();
                adapter2.Fill(dataTable2);
                if (dataTable.Rows.Count > 0 && dataTable2.Rows.Count > 0)
                    for (int i = 0; i < dataTable.Rows.Count; i++)
                    {
                        c.cmd.CommandText = "Insert into G_F select " + dataTable.Rows[i][0].ToString() + "," + dataTable2.Rows[0][0].ToString();
                        s2 = c.cmd.ExecuteNonQuery();
                    }

                for (int i = 0; i < grdFilir.Rows.Count; i++)
                {
                    CheckBox chk = grdFilir.Rows[i].FindControl("chkF") as CheckBox;
                    if (chk.Checked == true)
                    {
                        str += (grdFilir.Rows[i].Cells[1].Text + ",");
                    }
                }
                if (str != "")
                    str = str.Substring(0, str.Length - 1);
                else
                    str = "''";

                c.cmd.CommandText = "SELECT ID_Fil  FROM   Filire  WHERE  ID_Fil IN (" + str + ")";
                SqlDataAdapter adapter3 = new SqlDataAdapter(c.cmd);
                DataTable dataTable3 = new DataTable();
                adapter.Fill(dataTable3);

                if (dataTable3.Rows.Count > 0 && dataTable2.Rows.Count > 0)
                    for (int i = 0; i < dataTable3.Rows.Count; i++)
                    {
                        c.cmd.CommandText = "Insert into Format_Filer select " + dataTable2.Rows[0][0].ToString() + "," + dataTable3.Rows[i][0].ToString();
                        s3 = c.cmd.ExecuteNonQuery();
                    }

                if (s1 > 0)
                    lb2.Text = "Seccus ajoute les formation personelle";
                if (s2 > 0)
                    lb2.Text += "<br/> Seccus ajoute les Filieres qui enseignent ";
                if (s3 > 0)
                    lb2.Text += "<br/> Seccus ajoute les groupes  qui enseignent";

            }
            catch (Exception es)
            {
                Response.Write("<script>alert('" + es.ToString() + "')</script>");
            }
        }
        protected void vd_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < grdFilir.Rows.Count; i++)
            {
                CheckBox chk = grdFilir.Rows[i].FindControl("chkF") as CheckBox;
                if (chk.Checked == true)
                {
                    str += (grdFilir.Rows[i].Cells[1].Text + ",");
                }
            }
            if (str != "")
                str = str.Substring(0, str.Length - 1);
            else
                str = "''";
            c.cmd.CommandText = "SELECT Group_Et.ID_Group , Group_Et.Nom FROM   Group_Et INNER JOIN Filire ON Group_Et.Filire = Filire.ID_Fil WHERE   (Group_Et.Filire IN (" + str + ")) AND (Group_Et.Annee_scolaire = 1)";

            dtp = new SqlDataAdapter(c.cmd);
            dtp.Fill(dt);
            grdGr1.DataSource = dt;
            grdGr1.DataBind();

            c.cmd.CommandText = "SELECT Group_Et.ID_Group , Group_Et.Nom FROM   Group_Et INNER JOIN Filire ON Group_Et.Filire = Filire.ID_Fil WHERE   (Group_Et.Filire IN (" + str + ")) AND (Group_Et.Annee_scolaire = 2)";
            DataTable dta = new DataTable();
            dtp1 = new SqlDataAdapter(c.cmd);
            dtp1.Fill(dta);
            grdGrp.DataSource = dta;
            grdGrp.DataBind();

        }
    }
}