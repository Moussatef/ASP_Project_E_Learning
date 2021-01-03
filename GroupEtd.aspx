<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GroupEtd.aspx.cs" Inherits="WebApplication4.GroupEtd" %>

<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Raleway&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Raleway', sans-serif;
            background: #f3f3f3;
        }

        .weapper {
            padding: 20px;
            margin: 1% auto 0;
            width: 100%;
            height: 100%;
            display: flex;
            box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
        }

            .weapper .left {
                width: 15%;
                background: linear-gradient(to left,#0c0c0cd3,#5a5a5a);
                padding: 30px 25px;
                border-top-left-radius: 5px;
                border-bottom-left-radius: 5px;
                text-align: center;
                color: #fff;
            }

                .weapper .left img {
                    margin-bottom: 10px;
                    border-radius: 5px;
                }

                .weapper .left h4 {
                    margin-bottom: 10px;
                }

                .weapper .left p {
                    font-size: 20px;
                }

            .weapper .right {
                width: 65%;
                background: #fff;
                border-top-right-radius: 5px;
                border-bottom-right-radius: 5px;
                padding: 30px 25px;
            }

                .weapper .right .info, .weapper .right .Etud {
                    margin-bottom: 10%;
                }

                    .weapper .right .info h3, .weapper .right .Etud h3 {
                        margin-bottom: 5%;
                        padding-bottom: 5px;
                        border-bottom: 1px solid #e0e0e0;
                        color: #353c4e;
                        text-transform: uppercase;
                        letter-spacing: 3px;
                    }

                    .weapper .right .info .container .row h3 {
                        margin-bottom: 5%;
                        margin-top: 5%;
                        padding-bottom: 5px;
                        border-bottom: 1px solid #e0e0e0;
                        color: #353c4e;
                        text-transform: uppercase;
                        font-size: 20px;
                        letter-spacing: 1px;
                    }

                    .weapper .right .info .container p {
                        font-size: 18px;
                        color: #919aa3;
                        padding-left: 5px;
                        margin-bottom: 6%;
                        margin-top: 2%;
                    }

                .weapper .right .info-data,
                .weapper .right .Etud-data {
                    padding-left: 30px;
                    display: flex;
                    justify-content: space-between;
                }

                    .weapper .right .info-data .data,
                    .weapper .right .Etud-data .Etud {
                        width: 45%;
                    }

                        .weapper .right .info-data .data h4,
                        .weapper .right .Etud-data .data h4 {
                            color: #353c4e;
                            margin-bottom: 5px;
                        }

                        .weapper .right .info-data .data p,
                        .weapper .right .Etud-data .data p {
                            font-size: 15px;
                            color: #919aa3;
                            padding-left: 5px;
                        }
    </style>

    <div class="weapper">
        <div class="left ">
            <h2>Group</h2>
            <h3>
                <asp:Label runat="server" ID="LBGroup"></asp:Label></h3>
            <br />
            <h4>
                <asp:LinkButton Class="btn btn-secondary btn-block" ID="lnCour" OnClick="lnCour_Click" runat="server">Les cours</asp:LinkButton>
            </h4>
            <h4>
                <asp:LinkButton ID="lnProf" OnClick="lnProf_Click" Class="btn btn-secondary btn-block" runat="server">Les Profisseurs</asp:LinkButton>
            </h4>
            <h4>
                <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" Class="btn btn-secondary btn-block" runat="server">Les etudiant</asp:LinkButton>
            </h4>

        </div>
        <div class="right" style="width: 85%">
            <div class="info">
                <h3>
                    <asp:Label runat="server" ID="lbhader">Les cours de group </asp:Label></h3>
                <br />
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="container card " style="width: 100%; height: auto; margin-left: 50px;">
                            <div class="row">
                                <div class="col-lg-3 col-md-12 col-sm-12" >
                                    <asp:Image runat="server" Style="max-width:100%; height: 360px" ImageUrl="/imgProfil/cour.png" />
                                </div>
                                <div class="col-lg-9 col-md-12 col-sm-12" style="background-color: transparent">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-12 col-sm-12">
                                                <h3>
                                                    <asp:Label runat="server" ID="lbtitre">Titre de cour : </asp:Label></h3>

                                            </div>
                                            <div class="col-lg-7 col-md-12 col-sm-12">
                                                <p>
                                                    <asp:Label runat="server" ID="lbtitreBD" Text='<%# Eval("Titre") %>'>HTML CSS JS  </asp:Label>
                                                </p>

                                            </div>
                                            <div class="col-lg-4 col-md-12 col-sm-12">
                                                <h3>
                                                    <asp:Label runat="server" ID="lbDesc">Description : </asp:Label></h3>

                                            </div>
                                            <div class="col-lg-8 col-md-12 col-sm-12 " style="max-width: 100%; height: auto;">
                                                <p>
                                                    <asp:Label runat="server" ID="lbDescBD" Text='<%# Eval("Description") %>'>HTML CSS JS /HTML CSS JS/HTML CSS JS </asp:Label>
                                                </p>

                                            </div>
                                            <div class="col-lg-5 col-md-12 col-sm-12">
                                                <h3>
                                                    <asp:Label runat="server" ID="lbModule">Module : </asp:Label></h3>

                                            </div>
                                            <div class="col-lg-7 col-md-12 col-sm-12">
                                                <p>
                                                    <asp:Label runat="server" ID="Label3" Text='<%# Eval("Nome_Module") %>'>Base de donnee </asp:Label>
                                                </p>

                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12">
                                                <h3>
                                                    <asp:Label runat="server" ID="lbrelis">Réalisé par professeur  : </asp:Label></h3>

                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12">
                                                <p>
                                                    <asp:Label runat="server" ID="lbRelisBD" Text='<%# Eval("Nom_Prof") %>'>Widade Jakjoud</asp:Label>
                                                </p>

                                            </div>
                                            <div class="col-lg-7 col-md-12 col-sm-12">
                                                <h3>
                                                    <asp:Label runat="server" ID="lbdate">La date de lancement  : </asp:Label></h3>
                                            </div>
                                            <div class="col-lg-5 col-md-12 col-sm-12">
                                                <p>
                                                    <asp:Label runat="server" ID="ladateBD" Text='<%# Eval("La_Date") %>'>10/11/2020 </asp:Label>
                                                </p>

                                            </div>

                                            <div class="col-lg-5 col-md-12 col-sm-12">
                                                <asp:LinkButton ID="btnAfich"  OnClick="btnAfich_Click" CommandArgument='<%# Eval("ID_Cour") %>' runat="server" Text='<%# Eval("Titre") %>' CssClass="btn btn-primary btn-block" Style="margin: 10px;">Afficher le cour</asp:LinkButton>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <hr />
                    </ItemTemplate>
                </asp:Repeater>
                <div class="col-lg-12 md-12 col-sm-12">
                    <asp:GridView ID="GridEtab" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" Font-Bold="True" Font-Underline="False" AutoGenerateColumns="False" Height="100%">
                        <AlternatingRowStyle BackColor="transparent" />
                        <EmptyDataTemplate>
                            No data here
                        </EmptyDataTemplate>
                        <Columns>
                             <asp:TemplateField >
                            <ItemTemplate>
                                 <asp:LinkButton ID="Prifil_Prof"  OnClick="Prifil_Prof_Click" runat="server" CommandArgument='<%# Eval("ID_For") %>' CssClass="btn btn-primary btn-block" Style="margin: 10px;"  >Profil</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Photo de profil">
                                <EditItemTemplate>
                                    <asp:Image ID="Image2" Width="50px" Height="45px" runat="server" ImageUrl='<%# Eval("img") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" Width="50px" Height="45px" runat="server" ImageUrl='<%# Eval("img") %>' />
                                </ItemTemplate>
                                
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nome complet">
                                <EditItemTemplate>
                                    <asp:Label ID="LBP" runat="server" Text='<%# Bind("NomP") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Etb" runat="server" Text='<%# Bind("NomP") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lbEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        <EditRowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#EFF3FB" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="transparent" Font-Size="25px" Font-Bold="True" ForeColor="#353c4e" />
                        <PagerStyle BackColor="#EFF3FB" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="transparent" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#EFF3FB" />
                        <SortedAscendingHeaderStyle BackColor="#EFF3FB" />
                        <SortedDescendingCellStyle BackColor="#EFF3FB" />
                        <SortedDescendingHeaderStyle BackColor="#EFF3FB" />
                    </asp:GridView>
                </div>
                 <div class="col-lg-12 md-12 col-sm-12">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" Font-Bold="True" Font-Underline="False" AutoGenerateColumns="False" Height="100%">
                        <AlternatingRowStyle BackColor="transparent" />
                        <EmptyDataTemplate>
                            No data here
                        </EmptyDataTemplate>
                        <Columns>
                            <asp:CommandField SelectText="Profile" ShowSelectButton="True" />
                            <asp:TemplateField SortExpression="img">
                                <EditItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img") %>' />
                                </ItemTemplate>
                                <ControlStyle Height="50px" Width="50px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="nom" HeaderText="Nom Et Prenom" ReadOnly="True" SortExpression="nom" />
                            <asp:BoundField DataField="sex" HeaderText="Sexe" SortExpression="sex" />
                            <asp:BoundField DataField="DDN" HeaderText="Date de naissance" SortExpression="DDN" />
                            <asp:BoundField DataField="Ville" HeaderText="Ville" SortExpression="Ville" />
                            <asp:BoundField DataField="Nom_G" HeaderText="Group" SortExpression="Nom_G" />
                            <asp:BoundField DataField="Annee_scolaire" HeaderText="Annee_scolaire" SortExpression="Annee_scolaire" />
                        </Columns>

                        <EditRowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#EFF3FB" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="transparent" Font-Size="25px" Font-Bold="True" ForeColor="#353c4e" />
                        <PagerStyle BackColor="#EFF3FB" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="transparent" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#EFF3FB" />
                        <SortedAscendingHeaderStyle BackColor="#EFF3FB" />
                        <SortedDescendingCellStyle BackColor="#EFF3FB" />
                        <SortedDescendingHeaderStyle BackColor="#EFF3FB" />
                    </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT Etudiant.Nom+' '+ Etudiant.Prenom as nom, Etudiant.sex, Etudiant.DDN, Etudiant.Ville, Etudiant.img, Group_Et.Nom AS Nom_G, Annee_S.Annee_scolaire FROM Etudiant INNER JOIN Group_Et ON Etudiant.ID_GP = Group_Et.ID_Group INNER JOIN Annee_S ON Etudiant.Annee_scolaire = Annee_S.ID_A AND Group_Et.Annee_scolaire = Annee_S.ID_A WHERE (Group_Et.ID_Group = @G)">
                         <SelectParameters>
                             <asp:SessionParameter Name="G" SessionField="ID_GP" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
