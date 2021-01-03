<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="registerEtud.aspx.cs" Inherits="WebApplication4.registerEtud" %>

<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .input-sm {
        }

        .auto-style2 {
            width: 285px;
        }

        .auto-style3 {
            width: 374px;
        }

        .auto-style4 {
            width: 374px;
            height: 34px;
        }

        .auto-style8 {
            height: 98px;
        }

        .auto-style9 {
            height: 98px;
            width: 285px;
        }
        /*td input[type=text],[type=date],[type=password],[type=Email]{
            border-radius:15px;
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin:5px 0px;
            border:0;
            
        }*/
        input[type=submit] {
            border-radius: 6px;
            background-color: teal;
            border: none;
        }

        input[placeholder] {
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            font-size: 15px;
            padding-left: 7px;
        }

        input[type=submit]:hover {
            color: black;
            background: rgba(13, 228, 138, 0.932);
            border-radius: 20px;
        }

        input[type=submit] {
            color: white;
            background: rgb(13, 75, 190);
            border-radius: 20px;
        }

        .auto-style10 {
            width: 285px;
            height: 114px;
        }

        .auto-style12 {
            height: 98px;
            width: 351px;
        }

        .ac {
            margin-top: 5px;
            padding: 6px 10px;
            color: black;
            background: #9aa6a773;
            border-radius: 20px;
        }

        .acb {
            margin: 0px 0px;
            padding: 6px 10px;
            background-color: white;
        }

        .Tb {
            width: 500px;
            background: rgba(204, 204, 204, 0.719);
            text-align: center;
            padding: 50px;
            box-shadow: 6px 0 8px 0 rgba(187, 187, 189, 0.87);
            width: 1050px;
            margin: 3% auto 0;
        }

        #FilPhot {
            border-radius: 15px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .auto-style13 {
            height: 114px;
        }

        .drr {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 5px 0px;
        }

        .spnF {
            width: 200px;
            height: 26px;
            border: solid;
            padding: 5px;
            border-color: rgb(128, 128, 128);
        }

        .em {
            border-radius: 18px;
            padding-top: 5px;
            padding-bottom: 5px;
            padding-left: 5px;
            margin: 15px auto;
            width: 329px;
            transition: 0.25s;
            border: 2px solid #3498db;
            outline: none;
        }

            .em:focus {
                border-color: #2ecc71;
            }


        .auto-style14 {
            width: 285px;
            height: 34px;
        }

        .auto-style15 {
            width: 1086px;
        }

        .auto-style16 {
            height: 114px;
            width: 374px;
        }

        .auto-style17 {
            height: 98px;
            width: 374px;
        }

        h3 {
            border-bottom: 1px solid #e0e0e0;
            color: #353c4e;
            text-transform: uppercase;
            letter-spacing: 6px;
            margin-bottom: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-color: #edeeef;">
        <div style="text-align: center; margin: 0; padding0;">
            <asp:Label Style="position: center" runat="server" Font-Size="60px" ForeColor="#03ced1">Inscription de étudiant</asp:Label>
        </div>

        <div class="container" style="background-color: white;">

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h3 class="col-sm-12" style="margin-top: 29px">information Personel</h3>
                </div>
                <div class="form-group col-lg-4 col-md-6  col-sm-12">
                    <asp:Label runat="server" CssClass="ac" Font-Size="15px" Width="165px" Text="Nom"></asp:Label>
                    <asp:TextBox ID="txtNom" runat="server" CssClass="em" placeholder="Votre nom" Enabled="true" Width="329px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNom" Display="Dynamic" ErrorMessage="votre nom s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="Rgs"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="Rgs" ControlToValidate="txtNom" Display="Dynamic" ErrorMessage="Char" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>

                </div>
                <div class="form-group col-lg-4 col-md-6  col-sm-12">
                    <asp:Label runat="server" CssClass="ac" Font-Size="15px" Width="165px" TabIndex="1" Text="Prenom"></asp:Label>
                    <asp:TextBox ID="txtPrenom" runat="server" CssClass="em" placeholder="Prenom" Enabled="true" Width="329px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPrenom" Display="Dynamic" ErrorMessage="votre prenom s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="Rgs"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPrenom" Display="Dynamic" ErrorMessage="Char" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="Rgs"></asp:RegularExpressionValidator>

                </div>
                <div class="form-group col-lg-4 col-md-6  col-sm-12">
                    <asp:Label runat="server" CssClass="ac" Font-Size="15px" Width="165px" Text="Date de naissance"></asp:Label>
                    <asp:TextBox ID="ddn" runat="server" TextMode="Date" CssClass="em" Enabled="true" Width="330px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddn" ErrorMessage="votre  date de naissance nom s'il vous plait !!" ForeColor="#FF5050" ValidationGroup="Rgs"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group col-lg-4 col-md-6  col-sm-12">
                    <asp:Label runat="server" Font-Size="15px" CssClass="ac" Width="165px" Text=" ID National"></asp:Label>
                    <asp:TextBox ID="txtCIN" runat="server" CssClass="em" placeholder="CIN" Enabled="true" Width="328px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="VIDN" runat="server" ControlToValidate="txtCIN" Display="Dynamic" ErrorMessage="votre CIN s'il vous plait!!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="Rgs"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group col-lg-4 col-md-6  col-sm-12">
                    <asp:Label runat="server" Font-Size="15px" CssClass="ac" Width="165px" TabIndex="1" Text="Email"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="em" placeholder="Email" TextMode="Email" Enabled="true" Width="329px" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" ErrorMessage="votre Email s'il vous plait !!" ForeColor="#FF5050" ValidationGroup="Rgs"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group col-lg-4 col-md-6  col-sm-12">
                    <asp:Label runat="server" Font-Size="15px" CssClass="ac" Width="165px" TabIndex="1" Text="Password"></asp:Label>
                    <asp:TextBox ID="txtPass" runat="server" CssClass="em" TextMode="Password" placeholder="Password" Enabled="true" Width="329px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPass" Display="Dynamic" ErrorMessage="votre passowrd s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="Rgs"></asp:RequiredFieldValidator>

                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h3 class="col-sm-12" style="margin-top: 29px">information étudiant</h3>
                </div>
                <div class="form-group col-lg-3 col-md-6 col-sm-12 ">
                    <asp:Label runat="server" Font-Size="15px" CssClass="ac" Width="165px" Text="Région"></asp:Label>
                    <asp:DropDownList ID="region" CssClass="form-control em" runat="server" AutoPostBack="True" OnSelectedIndexChanged="region_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="form-group col-lg-3 col-md-6  col-sm-12">
                    <asp:Label runat="server" Font-Size="15px" CssClass="ac" Width="165px" Text="Ville Etude"></asp:Label>
                    <asp:DropDownList ID="villeEtd" CssClass="form-control em" runat="server" AutoPostBack="True" OnSelectedIndexChanged="villeEtd_SelectedIndexChanged"></asp:DropDownList>

                </div>
                <div class="form-group col-lg-6 col-md-6  col-sm-12">
                    <asp:Label runat="server" Font-Size="15px" CssClass="ac" Width="165px" Text="Etablissement"></asp:Label>
                    <asp:DropDownList ID="etabllis" CssClass="em form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="etabllis_SelectedIndexChanged"></asp:DropDownList>

                </div>

                <div class="form-group col-lg-3 col-md-6  col-sm-12">
                    <asp:Label runat="server" Font-Size="15px" CssClass="ac" Width="165px" TabIndex="1" Text="Fillier"></asp:Label>
                    <asp:DropDownList ID="filire" CssClass="em form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="filire_SelectedIndexChanged"></asp:DropDownList>

                </div>
                <div class="form-group col-lg-3 col-md-6  col-sm-12">
                    <asp:Label runat="server" Font-Size="15px" CssClass="ac" Width="165px" Text="Groupe Etude" ID="Label3"></asp:Label>
                    <asp:DropDownList ID="groupEt" CssClass="em form-control" runat="server" OnSelectedIndexChanged="filire_SelectedIndexChanged"></asp:DropDownList>

                </div>
                <div class="form-group col-lg-3 col-md-6  col-sm-12">
                    <asp:Label runat="server" Font-Size="15px" CssClass="ac" Width="165px" TabIndex="1" Text="Niveau de formation" ID="Label1"></asp:Label>
                    <asp:DropDownList ID="cmb" runat="server" CssClass="em form-control" AutoPostBack="false" OnSelectedIndexChanged="cmb_SelectedIndexChanged"></asp:DropDownList>

                </div>
                <div class="form-group col-lg-3 col-md-6  col-sm-12">
                    <asp:Label runat="server" Font-Size="15px" CssClass="ac" Width="165px" Text="Annee Scolaire" ID="Label2"></asp:Label>
                    <asp:DropDownList ID="anne" CssClass="em form-control" runat="server" OnSelectedIndexChanged="filire_SelectedIndexChanged"></asp:DropDownList>

                </div>

                <div class="form-group col-lg-4 col-md-6  col-sm-12">
                    <asp:Label runat="server" CssClass="ac" Font-Size="15px" Width="100px" TabIndex="1" Style="margin-bottom: 10px" Text="Sexe"></asp:Label>
                       <br />
                        <asp:RadioButton ID="RdMale" runat="server" Style="margin-left: 10px;" GroupName="gnd" />Male |
                        <asp:RadioButton ID="RdFemme" runat="server" GroupName="gnd" />Femme 
                </div>
                
                <div class="form-group col-lg-8 col-md-6 col-sm-12 ">
                    <asp:Label runat="server" CssClass="ac" Font-Size="15px" Width="165px" TabIndex="1" Style="margin-left: 50px;" Text="Photo de profil"></asp:Label>
                    <asp:FileUpload ID="FilPhot" CssClass="em" runat="server" Width="287px" />
                </div>

                <div class="form-group col-lg-4 col-md-6  col-sm-12">
                    <asp:Label ID="FilMess" runat="server" CssClass="acb"></asp:Label>
                </div>
                <div class="form-group col-lg-4 col-md-6  col-sm-12">
                    <asp:Label ID="FilRegist" runat="server" CssClass="acb"></asp:Label>
                </div>
                <div class="form-group col-lg-4 col-md-6  col-sm-12">
                    <asp:Button ID="Button1" runat="server" Text="Enregistrer" Width="350px" Font-Bold="True" Font-Strikeout="False" Font-Underline="False" Height="47px" OnClick="Button1_Click" ValidationGroup="Rgs" />
                </div>
            </div>
        </div>
    </div>
    <section id="main-content">
        <section id="table" style="text-align: center; margin: 0; padding:0;">

            <div class="Tb">
                <table style="text-align: left;" class="auto-style15">

                    <tr>
                        <td style="padding-bottom: 50px" class="auto-style14">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="padding-bottom: 50px" class="auto-style4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2"></td>
                        <td>&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>

                    </tr>



                </table>
            </div>
        </section>
    </section>

</asp:Content>
