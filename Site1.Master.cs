using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication4
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                //    conx.Visible = false;
                //    insc.Visible = false;
                //    imgP.Visible = true;
                //    profil.Visible = true;
                //    profil.Text = "" + Session["Username"];
                //    Decx.Visible = true;


                //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
                //    c.cmd = new SqlCommand("Select img from Etudiant where userName='" + Session["Username"] + "'", con);
                //    con.Open();
                //    c.dr = c.cmd.ExecuteReader();
                //    if (c.dr.Read())
                //    {
                //        Session.Clear();
                //        Session.RemoveAll();
                //        imgP.ImageUrl = c.dr["img"].ToString();

                //    }
                //    else
                //    {
                //        imgP.ImageUrl = "~/imgProfil/ph.png";
                //    }
                //
        //public Label labusername
        //{
        //    get { return this.U; }
        //}
        }

        //public Label lbprof
        //{
        //    get { return this.LbProf; }
        //}
        public LinkButton profil
        {
            get { return this.UserN; }
        }
        public LinkButton filire
        {
            get { return this.filir; }
        }
        public LinkButton pres
        {
            get { return this.prsOfppt; }
        }
        public LinkButton accue
        {
            get { return this.accu; }
        }
        public LinkButton etab
        {
            get { return this.etab; }
        }
        public LinkButton dropd
        {
            get { return this.dropdownMenuButton; }
        }
        public LinkButton insc
        {
            get { return this.Linscri; }
        }
        public LinkButton courss
        {
            get { return this.Cours_pub; }
        }
        public LinkButton Decx
        {
            get { return this.Dex; }
        }
        //public LinkButton DecxE
        //{
        //    get { return this.DexE; }
        //}
        //public LinkButton AJF
        //{
        //    get { return this.AjF; }
        //}
        public LinkButton prs
        {
            get { return this.prsOfppt; }
        }

        //public LinkButton DxAD
        //{
        //    get { return this.DexAD; }
        //}
        public LinkButton dropAdm
        {
            get { return this.DAdm; }
        }
        public LinkButton dropE
        {
            get { return this.DEtabl; }
        }

        public LinkButton ADD
        {
            get { return this.FE; }
        }
        public LinkButton cor
        {
            get { return this.Coure; }
        }
        public LinkButton conx
        {
            get { return this.Lconx; }
        }
        public Image imgP
        {
            get { return this.ImgProfil; }
        }
        protected void Application_BeginRequest()
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();
        }

        protected void Dex_Click(object sender, EventArgs e)
        {
           
                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();
                Application_BeginRequest();
                Response.Redirect("Accuei.aspx");
           
        }
        public void data()
        {

        }

        protected void UserN_Click(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {

            }
            else
            if (Session["Etablissement"] != null)
            {
                Response.Redirect("profilEtabliss.aspx");
            }
            else
            if (Session["CIN"] != null)
            {
                Response.Redirect("Profilx.aspx");
            }
            else
           if (Session["ID_Prof"] != null)
            {
                Response.Redirect("Profil_Formateur.aspx");
            }

        }
        
    }
}
