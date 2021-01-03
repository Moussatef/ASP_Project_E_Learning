<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="profilEtabliss.aspx.cs" Inherits="WebApplication4.profilEtabliss" %>

<%@ MasterType VirtualPath="~/Site1.Master" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        h3 {
            border-bottom: 1px solid #e0e0e0;
            color: #353c4e;
            text-transform: uppercase;
            letter-spacing: 6px;
            margin-bottom: 20px;
        }

        .si {
            background-color: rgb(13, 75, 190);
            color: #fff;
            width: 100%;
            padding: 10px;
            border-radius: 15px;
            font-size: 15px;
            border: none;
            cursor: pointer;
        }

            .si:hover {
                background-color: #2ecc71;
            }

        p, a {
            font-size: 18px;
            margin-bottom: 10px;
            color: #919aa3;
            padding-left: 5px;
        }

        h4 {
            color: #353c4e;
            margin-bottom: 5px;
        }

        .mrlt {
            margin-top: 30px;
        }

        body {
            background-color: whitesmoke;
        }
    </style>
    <div class="container" style="background-color: white; max-width: 90%; box-shadow: 7px 7px 6px -3px rgba(168,168,168,1); border: 1.5px solid #e0e0e0; margin-top: 5%; padding: 5%; margin-bottom: 5%;">
        <div class="row">
            <div class="col-lg-3 col-md-12 col-sm-12 " style="margin-top: 10px;">
                <asp:Image ID="imgP" runat="server" class="img-responsive img-circle" Style="width: 160px; height: 160px; margin-bottom: 15px;" />
                <h4>&nbsp;Etablissement </h4>
                <asp:FileUpload ID="UpModifP" Visible="false" CssClass="filebtn form-control" runat="server" />
                <asp:Label ID="FilMess" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-lg-9 col-sm-10 col-md-12">
                <h3 class="col-lg-12 col-md-12 col-sm-12">Information d'Etablissement</h3>
                <div class="form-group col-lg-9 col-md-9 col-sm-9">
                    <h4>
                        <label for="nom">Nom Etablissement : </label>
                    </h4>
                    <p>
                        <asp:Label ID="lbnom" runat="server" Text=""></asp:Label>
                    </p>
                    <asp:TextBox ID="txtNom" CssClass="em form-control" runat="server" Visible="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNom" Display="Dynamic" ErrorMessage="votre nom s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="grp"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="grp" ControlToValidate="txtNom" Display="Dynamic" ErrorMessage="Char" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>

                </div>
                <div class="form-group col-lg-9 col-md-9  col-sm-9">
                    <h4>
                        <label>Adresse : </label>
                    </h4>
                    <p>
                        <asp:Label ID="lbAdrs" runat="server" Text=""></asp:Label>
                    </p>
                    <asp:TextBox ID="txtadrrs" Visible="false" CssClass="em form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtadrrs" Display="Dynamic" ErrorMessage="votre Prenom s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="grp"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="grp" ControlToValidate="txtadrrs" Display="Dynamic" ErrorMessage="syntaxe incorrecte" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group col-lg-9 col-md-9  col-sm-9">
                    <h4>
                        <label>Adresse : </label>
                    </h4>
                    <p>
                        <asp:Label ID="lbtele" runat="server" Text=""></asp:Label>
                    </p>
                    <asp:TextBox ID="txtTele" Visible="false" CssClass="em form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTele" Display="Dynamic" ErrorMessage="votre Prenom s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="grp"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ValidationGroup="grp" ControlToValidate="txtTele" Display="Dynamic" ErrorMessage="syntaxe incorrecte" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>

                </div>
                <div class="form-group col-lg-12 col-md-12 col-sm-12">
                    <h4>
                        <label for="email">Email : </label>
                    </h4>
                    <p>
                        <asp:Label ID="lbemail" runat="server" Text=""></asp:Label>
                    </p>
                    <asp:TextBox ID="txtEmail" TextMode="Email" Visible="false" CssClass="em form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="votre Email s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="grp"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="syntaxe incorrecte" ControlToValidate="txtEmail" Display="Dynamic" ValidationExpression="^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$" ValidationGroup="grp"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group col-lg-12 col-md-12 col-sm-12">
                    <h4>
                        <label for="ville">Ville :  </label>
                    </h4>
                    <p>
                        <asp:Label ID="lbville" runat="server" Text=""></asp:Label>
                    </p>
                </div>

                <div class="col-lg-6 col-md-6 col-sm-12 mrlt">
                    <h4>Mot de pass </h4>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 mrlt">
                    <asp:Label ID="Label2" Text="***********" runat="server"></asp:Label>

                </div>
                <div class="col-lg-9 col-md-9 col-sm-9 ">
                    <p>
                        <asp:Label ID="lbNmt" Visible="false" Text="Novule mot de pass : " runat="server" Style="margin-right: 50px; padding-right: 65px; padding-bottom: 25px"></asp:Label>
                    </p>
                    <asp:TextBox ID="txtPass" Class="em form-control" TextMode="Password" runat="server" Visible="false" placeholder="Novule mot de pass" Style="margin-bottom: 25px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="MP" runat="server" ErrorMessage="*" ControlToValidate="txtPass" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="col-lg-9 col-md-9 col-sm-9 ">
                    <p>
                        <asp:Label ID="lbCmt" Visible="false" Text="Confirmie la novule mot de pass :" Style="margin-right: 30px; padding-bottom: 25px; padding-top: 25px" runat="server"></asp:Label>
                    </p>
                    <asp:TextBox ID="txtPassconf" Visible="false" TextMode="Password" Class="em form-control" runat="server" placeholder="Confirmie la novule mot de pass"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="MP" runat="server" ErrorMessage="*" ControlToValidate="txtPassconf" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" ValidationGroup="MP" runat="server" ErrorMessage="!" ControlToCompare="txtPass" ControlToValidate="txtPassconf" Display="Dynamic"></asp:CompareValidator>
                </div>
                <div class="col-lg-9 col-md-12 col-sm-12 mrlt">
                    <asp:Button Class="btn btn-secondary btn-block" ID="btnMPss" runat="server" Visible="true" Text="Modifier mot de pass" />
                    <asp:Button Class="btn btn-success btn-block" ID="btnEMt" Visible="false" runat="server" ValidationGroup="MP" Text="Enregistrer mot de pass" />
                    <asp:Button Class="btn btn-light btn-block" ID="btnAnulPass" Visible="false" runat="server" Text="Annuler" />
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12 mrlt">
                    <asp:Button CssClass="btn btn-success btn-block" ID="Button1" runat="server" Visible="false" ValidationGroup="grp" Text="Enregistrer Information" />
                </div>
                <div class="col-lg-2 col-md-12 col-sm-12 mrlt">
                    <asp:Button CssClass="btn btn-light btn-block" ID="btnAnull" runat="server" Visible="false" Text="Annuler" />
                </div>
                <asp:Label ID="Label3" runat="server" Visible="false"> </asp:Label>

            </div>
        </div>
        <hr />
        <div class="data col-lg-12 ">
            <div class="card">
                <div class="card-header" id="">
                    <h3>
                        <asp:LinkButton runat="server" data-toggle="collapse" ID="filibtn" data-target="#collapseFil" aria-expanded="false" aria-controls="collapseFil">
                                Les Filière D'établissement
                        </asp:LinkButton>
                    </h3>
                </div>
            </div>
            <div class="collapse show" id="collapseFil">
                <div class="card card-body">
                    <asp:GridView ID="GridFil" runat="server" AutoGenerateColumns="False" CellPadding="2" DataSourceID="SqlDataSource1" Width="100%" Font-Bold="True" Font-Underline="False" OnSelectedIndexChanged="GridFil_SelectedIndexChanged" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" ForeColor="Black" GridLines="None">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:TemplateField HeaderText="Nom de filière" SortExpression="Nom_Filire">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nom_Filire") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="Fil" OnClick="Fil_Click" data-toggle="collapse.show" data-target="#collapseModul" aria-expanded="false" aria-controls="collapseModul" Font-Underline="false" runat="server" Text='<%# Bind("Nom_Filire") %>'></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle ForeColor="#666666" />
                                <FooterStyle Font-Bold="True" Font-Overline="False" Font-Underline="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Niveau formation" SortExpression="niveau_formation">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("niveau_formation") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("niveau_formation") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle ForeColor="#666666" />
                                <FooterStyle Font-Bold="True" Font-Overline="False" Font-Underline="False" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Size="25px" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspPrejectConnectionString %>" SelectCommand="SELECT F.Nom_Filire, N.niveau_formation FROM Filire AS F LEFT OUTER JOIN NvFormation AS N ON F.ID_NV = N.ID_NF WHERE (F.ID_Fil IN (SELECT F.ID_Fil FROM Fill_Etable AS Fill_Etable_1 WHERE (ID_Etabli = @E)))">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="E" SessionField="ID_E" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        <br />
        <div class="data col-lg-12 ">
            <div class="card">
                <div class="card-header" id="">
                    <h3>
                        <asp:LinkButton runat="server" data-toggle="collapse" ID="btn" data-target="#collapseModul" aria-expanded="false" aria-controls="collapseModul">
                                Les Modules de Filière
                        </asp:LinkButton>
                    </h3>
                </div>
            </div>
        </div>

        <div class="collapse show" id="collapseModul">
            <div class="card card-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="2" DataSourceID="SqlDataSource2" Width="100%" Font-Bold="True" Font-Underline="False" OnSelectedIndexChanged="GridFil_SelectedIndexChanged" BackColor="LightGoldenrodYellow" BorderColor="Tan" ForeColor="Black" GridLines="None">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:TemplateField HeaderText="N° Module" SortExpression="N_Module">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("N_Module") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lModl" runat="server" Text='<%# Bind("N_Module") %>'></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Nome_Module" HeaderText="Module" SortExpression="Nome_Module">
                            <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Masse_H" HeaderText="Masse Heure" SortExpression="Masse_H">
                            <FooterStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Size="25px" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:aspPrejectConnectionString %>" SelectCommand="SELECT Module.N_Module, Module.Nome_Module, Module.Masse_H FROM Mod_Filier INNER JOIN Module ON Mod_Filier.ID_Module = Module.ID_M WHERE (Mod_Filier.ID_Filire = @IDF)">
                    <SelectParameters>
                        <asp:SessionParameter Name="IDF" SessionField="ID_Filire" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <br />
        <div class="data col-lg-12 ">
            <div class="card">
                <div class="card-header" id="">
                    <h3>
                        <asp:LinkButton runat="server" data-toggle="collapse" ID="LinkButton1" data-target="#collapseProf" aria-expanded="false" aria-controls="collapseProf">
                                Les Professeur D'établissement
                                 
                        </asp:LinkButton>
                    </h3>
                </div>
            </div>
            <div class="collapse show" id="collapseProf">
                <div class="card card-body">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="ID_For" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="ID_For" HeaderText="ID Professeur" InsertVisible="False" ReadOnly="True" SortExpression="ID_For" />
                            <asp:ImageField DataImageUrlField="img" SortExpression="img">
                                <ControlStyle Height="50px" Width="50px" />
                            </asp:ImageField>
                            <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom" />
                            <asp:BoundField DataField="Prenom" HeaderText="Prenom" SortExpression="Prenom" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Nom_Departement" HeaderText="Departement" SortExpression="Nom_Departement" />
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Size="25px" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT formateur.ID_For, formateur.Nom, formateur.Prenom, formateur.Email, formateur.img, formateur.ID_Depart, Departement.Nom_Departement FROM formateur INNER JOIN Etablissement ON formateur.ID_Etb = Etablissement.ID_Etab INNER JOIN Departement ON formateur.ID_Depart = Departement.ID_Dep"></asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>


</asp:Content>
