<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication4.login" %>

<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            /*background-image: url(im/mm3.jpg);*/
            background-size: cover;
        }

        .sing {
            position:relative;
            width: 450px;
            height: 580px;
            box-shadow: 10px 10px 10px 5px rgba(187, 187, 189, 0.87);
            background-image: url(css/img/bxx.jpg);
            background-size:cover;
            /*background: rgba(204, 204, 204, 0.719);*/
            padding: 50px 40px;
            margin: 3% auto 0;
            text-align: center;
        }

            .sing h1 {
                color: rgb(9, 87, 231);
                margin-bottom: 30px;
                border-bottom: 1px solid #e0e0e0;
            }

        .em {
            border-radius: 18px;
            padding: 14px 10px;
            margin: 20px auto;
            width: 300px;
            color: rgba(51, 51, 51, 0.829);
            transition: 0.25s;
            border: 2px solid #717475bb;
            outline: none;
        }

            .em:focus {
                width: 350px;
                border-color: #1ad37693;
            }

        .fb, .si {
            color: #fff;
            width: 100%;
            padding: 10px;
            border-radius: 20px;
            font-size: 15px;
            margin: 10px 0;
            border: none;
            outline: none;
            cursor: pointer;
        }

        hr {
            margin-top: 20px;
            width: 80%;
        }

        .or {
            background: #f8f9fa;
            margin: -28px auto 10px;
            width: 30px;
        }

        a {
            text-decoration: none;
            color: rgb(2, 2, 2);
        }

        .si {
            background-color: rgb(13, 75, 190);
        }

            .si:hover {
                background-color: #2ecc71;
            }

        .fb {
            background-color: rgba(59, 123, 241, 0.877);
        }

        .fb {
            color: #fff;
        }
    </style>
    <div>
        <div class="sing">
            <h1>Connexion</h1>

            <asp:TextBox ID="TextBox1" runat="server" class="em" placeholder="Votre email"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" type="password" class="em" placeholder="Votre mot de pass"></asp:TextBox>
             <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" votre email s'il vous plait !! " ControlToValidate="TextBox1" Display="Dynamic" ValidationGroup="gr"></asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="votre mot de pass s'il vous plait !!" ControlToValidate="TextBox2" Display="Dynamic" ValidationGroup="gr"></asp:RequiredFieldValidator>
            <asp:Label ID="Err" runat="server"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="Connexion" class="si"  ValidationGroup="gr" OnClick="Button1_Click" />
            <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="ss" OnClick="LinkButton1_Click" Font-Underline="False">mot de pass oublié ??</asp:LinkButton>
            <asp:Label ID="msg" runat="server" Text=""></asp:Label> 
            <hr>
            <p class="or">OU</p>
            <asp:Button ID="Button2" runat="server" Text="Inscreption" class="fb" OnClick="Button2_Click" />




        </div>
    </div>
</asp:Content>
