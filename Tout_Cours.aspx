<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Tout_Cours.aspx.cs" Inherits="WebApplication4.Tout_Cours" %>
<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        h3 {
            border-bottom: 1px solid #e0e0e0;
            color: #353c4e;
            text-transform: uppercase;
            letter-spacing: 6px;
            margin-bottom: 20px;
        }
    </style>
    <div class="form-group data col-lg-12 col-md-12 col-sm-12">
        <div class="card" style="text-align: center">
            <div class="card-header" id="">
                <h3>
                    <asp:LinkButton runat="server" data-toggle="collapse" ID="LinkButton1" data-target="#collapseFilt" aria-expanded="false" aria-controls="collapseFilt">
                                 Filtrer Les cours par 
                    </asp:LinkButton>
                </h3>
            </div>
        </div>
        <div class="container collapse show" id="collapseFilt">
            <div class="row">
                
                <div class="col-lg-12 col-md-12 " style="text-align: center">
                    <hr />
                </div>
                <div class="col-lg-4 col-md-6 " style="text-align: center">
                    <h4>Par Filiere </h4>
                    <asp:DropDownList Class="form-control" ID="FFiliere" runat="server" DataTextField="Nom_Filire" DataValueField="ID_Fil" AutoPostBack="True" OnSelectedIndexChanged="FFiliere_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div class="col-lg-4 col-md-6 " style="text-align: center">
                    <h4>Par Module</h4>
                    <asp:DropDownList Class="form-control" ID="FModule" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Nome_Module" DataValueField="ID_M" OnSelectedIndexChanged="FModule_SelectedIndexChanged"></asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT DISTINCT Module.ID_M, Module.Nome_Module FROM cours INNER JOIN Module ON cours.ID_Module = Module.ID_M WHERE (cours.ID_Filiere = @Fil)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="FFiliere" DefaultValue="0" Name="Fil" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>

                <div class="col-lg-4 col-md-6 " style="text-align: center">
                    <h4>Par professeur </h4>
                    <asp:DropDownList  Class="form-control" ID="FProf" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Nom" DataValueField="ID_For" OnSelectedIndexChanged="FProf_SelectedIndexChanged"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT DISTINCT formateur.ID_For, formateur.Nom + ' ' + formateur.Prenom AS Nom FROM cours INNER JOIN formateur ON cours.ID_Prof = formateur.ID_For WHERE (cours.ID_Module = @Mod)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="FModule" DefaultValue="0" Name="Mod" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                
                <div class="col-lg-12 col-md-12 " style="text-align: center">
                    
                    <hr />
                    <asp:LinkButton ID="toutC" OnClick="toutC_Click" CssClass="btn btn-primary btn-block" runat="server">Tout Cours</asp:LinkButton>
                </div>
            </div>
        </div>
        </div>
    <div class="form-group data col-lg-12 col-md-12 col-sm-12">
        <div class="card">
            <div class="card-header" id="" style="text-align: center">
                <h3>
                    <asp:LinkButton runat="server" data-toggle="collapse" ID="filibtn" data-target="#collapseFil" aria-expanded="false" aria-controls="collapseFil">
                                 Les cours téléverser 
                    </asp:LinkButton>
                </h3>
            </div>
        </div>
        <div class="container collapse show" id="collapseFil">
            <div class="row">

                
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-5 card" style="text-align: center">
                            <br />
                            <div class="form-group">
                                <asp:Image ID="Image1" runat="server" Width="150px" Height="150px" ImageUrl="~/imgProfil/doc.jpg" />
                            </div>
                            <div class="form-group ">
                                <h4>
                                    <asp:Label ID="titer" runat="server" Text="Titer Cour"></asp:Label>
                                </h4>
                                <asp:LinkButton ID="lnNom" OnClick="lnNom_Click"  CommandArgument='<%# Eval("ID_Cour") %>' runat="server" Text='<%# Eval("Titre") %>'></asp:LinkButton>

                                <h4>
                                    <asp:Label ID="Label1" runat="server" Text="Filiere"></asp:Label>
                                </h4>
                                <asp:LinkButton ID="lnFiliere" runat="server" Text='<%# Eval("Nom_Filire") %>'></asp:LinkButton>
                                <h4>
                                    <asp:Label ID="Label2" runat="server" Text="Module"></asp:Label>
                                </h4>
                                <asp:LinkButton ID="lnModule" runat="server" Text='<%# Eval("Nome_Module") %>'></asp:LinkButton>
                                <h5>
                                    <asp:Label ID="Label3" runat="server" Text="La date de lancement"></asp:Label>
                                </h5>
                                <asp:Label ID="lbdate" runat="server"><%# Eval("La_Date") %></asp:Label>
                            </div>

                        </div>
                    </ItemTemplate>

                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
