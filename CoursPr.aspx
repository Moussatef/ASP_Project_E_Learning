<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CoursPr.aspx.cs" Inherits="WebApplication4.CoursPr" %>

<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Raleway&display=swap');

        h1 {
            border-bottom: 1px solid #e0e0e0;
            color: #353c4e;
            text-transform: uppercase;
            letter-spacing: 6px;
            margin-bottom: 20px;
        }

        h3 {
            text-transform: uppercase;
            color: #353c4e;
            margin-bottom: 5px;
        }

        p {
            font-size: 20px;
            margin-bottom: 10px;
            color: #919aa3;
            padding-left: 5px;
        }
    </style>

    <div class="container" style="background-color: white; max-width: 90%; margin-top: 5%; padding: 5%; margin-bottom: 5%;">
        <h1 style="text-align: center;">Page Cour
        </h1>
        <br />
        <div class="row" style="text-align: center;">
            <div class="form-group col-lg-12 col-sm-12">
                <asp:Image ID="Image1" runat="server" Width="250px" Height="200px" ImageUrl="~/imgProfil/doc.jpg" />
            </div>
            <div class="form-group col-lg-12 col-sm-12">
                <asp:LinkButton runat="server" OnClientClick="aspnetForm.target ='_blank';" ID="lnFile" OnClick="lnFile_Click" CssClass="btn btn-dark">Afficher le fichere</asp:LinkButton>
            </div>
            <div class="form-group col-lg-12 col-sm-12">
                <h3>Titre de Cour  </h3>
                <p>
                    <asp:Label runat="server" ID="lbNom"></asp:Label>
                </p>
            </div>
            <div class="form-group col-lg-12 col-sm-12">
                <h3>Description  </h3>
                <p>
                    <asp:Label runat="server" ID="lbDesc"></asp:Label></p>
            </div>
            <div class="form-group col-lg-6 col-sm-12">
                <h3>Filiere : </h3>
                <p>
                    <asp:Label runat="server" ID="lbFil"></asp:Label>
                </p>
            </div>
            <div class="form-group col-lg-6 col-sm-12">
                <h3>Module : </h3>
                <p>
                    <asp:Label runat="server" ID="lbMod"></asp:Label>
                </p>
            </div>
            <div class="form-group col-lg-6 col-sm-12">
                <h3>La date de lancement  : </h3>
                <p>
                    <asp:Label runat="server" ID="lbDate"></asp:Label>
                </p>
            </div>
            <div class="form-group col-lg-6 col-sm-12">
                <h3>Réalisé par professeur : </h3>
                <p>
                    <asp:Label runat="server" ID="lbprof"></asp:Label>
                </p>
            </div>
            <div class="form-group col-lg-12 col-sm-12" runat="server">
                <hr />
            </div>
            <div class="card col-lg-12 col-sm-12" style="text-align: center">
                <div class="card-header" id="">
                    <h3>
                        <asp:LinkButton runat="server" data-toggle="collapse" ID="LinkButton1" data-target="#PDF" aria-expanded="false" aria-controls="PDF">
                                 Cour 
                        </asp:LinkButton>
                    </h3>
                </div>
            </div>
            <div class="collapse  col-lg-12 col-sm-12" id="PDF">
                <div class="form-group col-lg-12 col-sm-12 collapse show" runat="server" id="pdfP">
                </div>
                <div class="form-group col-lg-12 col-md-12 col-sm-12" runat="server" id="pvds">
                    <h3>Video player : </h3>

                </div>
            </div>

        </div>
    </div>

</asp:Content>
