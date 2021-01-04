<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profilx.aspx.cs" Inherits="WebApplication4.Profilx" %>

<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="css/prof.css">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Raleway&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Raleway', sans-serif;
            background: #f3f3f3;
        }

        p {
            padding-left: 8px;
        }

        .weapper {
            margin: 1% auto 0;
            width: 80%;
            height: 100%;
            display: block;
            box-shadow: 10px 10px 10px 10px rgba(69, 90, 100, 0.08);
            overflow: hidden;
        }

            .weapper .left {
                width: 100%;
                height: 370px;
                background:repeating-linear-gradient(120deg,#4f5050e0 0px,white 450px,hsl(0deg 0% 20%)250px,hsl(0deg 0% 81%));
                /*background: linear-gradient(to left,#0c0c0cd3,#5a5a5a,#a8a8a8);*/
                border-top-left-radius: 5px;
                border-bottom-left-radius: 5px;
                text-align: left;
                color: #fff;
                display: flex;
            }

                .weapper .left h4 {
                    margin-bottom: 10px;
                }

                .weapper .left p {
                    font-size: 16px;
                }

            .weapper .right {
                width: 100%;
                height: 80%;
                background: #fff;
                border-top-right-radius: 5px;
                border-bottom-right-radius: 5px;
                padding: 30px 25px;
            }

                .weapper .right h3 {
                    border-bottom: 1px solid #e0e0e0;
                    color: #353c4e;
                    text-transform: uppercase;
                    letter-spacing: 6px;
                    margin-bottom: 20px;
                }

                .weapper .right .info-data,
                .weapper .right .Etud-data {
                    padding-left: 30px;
                    display: flex;
                    justify-content: space-between;
                }

                    .weapper .right .info-data .data,
                    .weapper .right .Etud-data .Etud {
                        max-width: 45%;
                    }

                        .weapper .right .info-data .data h4,
                        .weapper .right .Etud-data .data h4 {
                            color: #353c4e;
                            margin-bottom: 5px;
                        }

                        .weapper .right .info-data .data p,
                        .weapper .right .Etud-data .data p {
                            font-size: 15px;
                            margin-bottom: 10px;
                            color: #919aa3;
                            padding-left: 5px;
                        }

        .si {
            background-color: rgb(13, 75, 190);
            color: #fff;
            width: 100%;
            padding: 10px;
            border-radius: 20px;
            font-size: 15px;
            border: none;
            cursor: pointer;
        }

            .si:hover {
                background-color: #2ecc71;
            }

        .em {
            border-radius: 18px;
            padding: 8px 10px;
            margin: 20px auto;
            width: 300px;
            color: rgb(19, 19, 19);
            transition: 0.25s;
            border: 2px solid #3498db;
            outline: none;
        }

            .em:focus {
                width: 350px;
                border-color: #2ecc71;
            }
        imgD {
            height: 300px;
            width: 300px;
            border-radius: 50%;
            border: 15px solid white;
            top: 10%;
            margin-left: 200px;
            background: white;
            position: relative;
            text-align: center;
        }
        .profimage {
            /*border-radius: 50%;*/
            /*width: 180px;
            height: 195px;
            margin-left: 50px;
            min-height: 160px;*/
            /*position:absolute;*/
            max-width:200px;
            top:0;
            right:100px;
            bottom:0;
            left:100px;
            display:block;
            margin:auto;
        }
      
        .filebtn {
            border-radius: 18px;
            padding: 8px 10px;
            max-width: 250px;
            color: rgb(19, 19, 19);
            transition: 0.25s;
            border: 2px solid #3498db;
            outline: none;
        }

        .topname {
            font-size: 40px;
            border-bottom: 1px solid #e0e0e0;
            color: #e0e0e0;
            text-transform: uppercase;
            letter-spacing: 8px;
            margin-bottom: 20px;
            margin-left:120px;
        }

        .topgmail {
            margin-left: 8px;
            font-size: 100%;
            color: #e0e0e0;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 20px;
            margin-left:120px;
        }

        .mrlt {
            margin-top: 30px;
        }
    </style>
    <div class="weapper">
        <div class="left">
            <div class="container">
                <div class="row">
                    <div class=" col-lg-3 col-md-12 col-sm-12">
                       <div class="imgD">
                        <asp:Image ID="imgPr" runat="server" CssClass="profimage" ImageUrl="~/imgProfil/OTH.jpg" />
                        </div>
                           <asp:FileUpload ID="UpModifP" Visible="false" CssClass="filebtn" runat="server" />
                        <asp:Label ID="FilMess" runat="server" Text=""></asp:Label>

                    </div>

                    <div class="col-lg-9 col-md-12 col-sm-12">
                        <asp:Label ID="lbNomPrenom" CssClass="topname" Text="Jebrane hamza" runat="server"></asp:Label>
                        <br />
                        <h4>
                            <asp:Label ID="Label1" CssClass="topgmail" Text="hamza.jebrane94@gmail.com" runat="server"></asp:Label></h4>
                        <p>
                            <asp:Label ID="pose" CssClass="topgmail" Text="Etudiant" runat="server"></asp:Label>
                        </p>
                    </div>
                </div>
            </div>

            <%-- <h4>
                <asp:Label ID="lbNomPrenom" runat="server"></asp:Label></h4>
            <p>
                <asp:Label ID="pose" runat="server"></asp:Label>
            </p>--%>
        </div>
        <div class="right">
            <div class="container" style="margin-left: 0">
                <div class="row">
                    <h3 class="col-lg-12 col-md-12 col-sm-12">Information Personel</h3>
                     
                    <div class="col-lg-6 col-md-6 col-sm-12 mrlt">
                        <h4>Nom</h4>
                        <p>
                            <asp:Label ID="lbNom" Text="Jebrane" runat="server"></asp:Label>
                            <asp:TextBox ID="txtNom" CssClass="em" runat="server" Visible="false"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNom" Display="Dynamic" ErrorMessage="votre nom s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="grp"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="grp" ControlToValidate="txtNom" Display="Dynamic" ErrorMessage="Char" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                        </p>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 mrlt">
                        <h4>Prenom</h4>
                        <p>
                            <asp:Label ID="lbPrenom" Text="Hamza" runat="server"></asp:Label>
                            <asp:TextBox ID="txtPrenom" Visible="false" CssClass="em" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrenom" Display="Dynamic" ErrorMessage="votre Prenom s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="grp"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="grp" ControlToValidate="txtPrenom" Display="Dynamic" ErrorMessage="Char" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                        </p>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12" style="margin-top: 20px">
                        <h4>CIN</h4>
                        <p>
                            <asp:Label ID="lbCin" Text="H12339" runat="server"></asp:Label>
                        </p>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 mrlt">
                        <h4>Email</h4>
                        <p>
                            <asp:Label ID="lbEmail" Text="hamza.jebrane93@gmail.com" runat="server"></asp:Label>
                        </p>
                    </div>
                    <br />
                    <div class="col-lg-6 col-md-6 col-sm-12" style="margin-top: 20px">
                        <h4>La date de naissance</h4>

                        <p>
                            <asp:Label ID="lbDDN" Text="14/03/1999" runat="server"></asp:Label>

                            <asp:TextBox ID="txtDDN" Visible="false" CssClass="em" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtDDN" ValidationGroup="grp"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" Display="Dynamic" ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$" ControlToValidate="txtDDN" ValidationGroup="grp"></asp:RegularExpressionValidator>

                        </p>
                    </div>
                     <div class="col-lg-6 col-md-6 col-sm-12 mrlt">
                        <h4>Sexe</h4>
                        <p>
                            <asp:Label ID="lbSex" runat="server">Male</asp:Label>

                        </p>

                    </div>
                   
                    <div class="col-lg-6 col-md-6 col-sm-12 mrlt">
                        <h4>Mot de pass </h4>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 mrlt">
                        <asp:Label ID="Label2" Text="***********" runat="server"></asp:Label>

                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 ">
                        <asp:Label ID="lbNmt" Visible="false" Text="Novule mot de pass : " runat="server" Style="margin-right: 50px; padding-right: 65px"></asp:Label>
                        <asp:TextBox ID="txtPass" CssClass="em" runat="server" Visible="false" placeholder="Novule mot de pass"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="MP" runat="server" ErrorMessage="*" ControlToValidate="txtPass" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 ">
                        <asp:Label ID="lbCmt" Visible="false" Text="Confirmie la novule mot de pass :" Style="margin-right: 30px" runat="server"></asp:Label>
                        <asp:TextBox ID="txtPassconf" Visible="false" CssClass="em" runat="server" placeholder="Confirmie la novule mot de pass"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="MP" runat="server" ErrorMessage="*" ControlToValidate="txtPassconf" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" ValidationGroup="MP" runat="server" ErrorMessage="!" ControlToCompare="txtPass" ControlToValidate="txtPassconf" Display="Dynamic"></asp:CompareValidator>
                    </div>
                    
                    <div class="col-lg-4 col-md-12 col-sm-12 mrlt">
                        <asp:Button CssClass="btn  btn-primary btn-block" ID="btnEMt" Visible="false" runat="server" ValidationGroup="MP" Text="Enregistrer mot de pass" OnClick="btnEMt_Click" />

                    </div>
                    <div class="col-lg-3 col-md-12 col-sm-12 mrlt">
                         <asp:Button CssClass="btn  btn-danger btn-block" ID="btnAnulPass" Visible="false" runat="server"  Text="Annuler"  OnClick="btnAnulPass_Click" />
                    </div>
                    <div class="col-lg-8 col-md-12 col-sm-12 ">
                        <asp:Button CssClass="btn  btn-secondary btn-block" ID="btnMPss" runat="server" Visible="false" Text="Modifier mot de pass" OnClick="btnMPss_Click" />

                    </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 mrlt">
                        <asp:Button CssClass="btn btn-secondary btn-block" ID="btnMod" runat="server"  Text="Modifier les informations" OnClick="btnMod_Click" />

                         </div>
                    <div class="col-lg-8 col-md-12 col-sm-12 mrlt">
                        <asp:Button CssClass="btn  btn-success btn-block" ID="Button1" runat="server" Visible="false" ValidationGroup="grp" Text="Enregistrer Information"  OnClick="Button1_Click" />
                    </div>
                    <div class="col-lg-3 col-md-12 col-sm-12 mrlt">
                        <asp:Button CssClass=" btn  btn-light btn-block" ID="btnAnull" runat="server" Visible="false"  Text="Annuler"  OnClick="btnAnull_Click" />
                    </div>
                    <asp:Label ID="Label3" runat="server" Visible="false"> </asp:Label>
                    <div class="col-lg-12 col-md-12 col-sm-12">

                        <h3 class="col-sm-12" style="margin-top: 29px">information étudiant</h3>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 mrlt">

                        <h4>Établissement</h4>
                        <p>
                            <asp:LinkButton  OnClick="lbEtab_Click" ID="lbEtab" runat="server" ></asp:LinkButton>
                        </p>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 mrlt">

                        <h4>Niveau De formation</h4>
                        <p>
                            <asp:Label ID="lbNvFr"  runat="server" Text="Technicien Spécialisé"></asp:Label>
                        </p>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 mrlt">

                        <h4>Filière</h4>
                        <p>
                            <asp:LinkButton ID="lbfile" OnClick="lbfile_Click" runat="server" Text="Techniques de Développement Informatique"></asp:LinkButton>
                        </p>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 mrlt">

                        <h4>Group </h4>
                        <p>
                            <asp:LinkButton ID="lGroup" runat="server">TDI201</asp:LinkButton>
                        </p>
                    </div>
                 
                </div>
            </div>
        </div>
    </div>

</asp:Content>
