<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profil_Formateur.aspx.cs" Inherits="WebApplication4.Profil_Formateur" %>

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
        .auto-style1 {
            position: relative;
            width: 100%;
            -ms-flex: 0 0 100%;
            flex: 0 0 100%;
            max-width: 100%;
            text-align: center;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
    <div class="container" style="background-color: whitesmoke; max-width:85%; box-shadow: 7px 7px 6px -3px rgba(168,168,168,1); border: 1.5px solid #e0e0e0; margin-top: 5%; padding: 5%; margin-bottom: 5%;">
        <div class="row">
            <div class="col-lg-3 col-md-12 col-sm-12 " style="margin-top: 10px;">
                <asp:Image ID="imgP" runat="server" class="img-responsive img-circle" Style="width: 160px; height: 160px;margin-left:25px; margin-bottom: 15px;" />
                <h4 style="border-bottom: 1px solid #e0e0e0 ;position:center;text-align:center;">Professeur </h4>
                <asp:FileUpload ID="UpModifP" Visible="false" CssClass="filebtn form-control" runat="server" />
                <asp:Label ID="FilMess" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-lg-9 col-sm-10 col-md-12">
                <h3 class="col-lg-12 col-md-12 col-sm-12">Information Personel</h3>
                <div class="form-group col-lg-9 col-md-9 col-sm-9">
                    <h4>
                        <label for="nom">Nom : </label>
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
                        <label for="prenom">Prenom : </label>
                    </h4>
                    <p>
                        <asp:Label ID="lbprenom" runat="server" Text=""></asp:Label>

                    </p>
                    <asp:TextBox ID="txtPrenom" Visible="false" CssClass="em form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrenom" Display="Dynamic" ErrorMessage="votre Prenom s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="grp"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="grp" ControlToValidate="txtPrenom" Display="Dynamic" ErrorMessage="Char" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>

                </div>
                <div class="form-group col-lg-12 col-md-12 col-sm-12">
                    <h4>
                        <label for="email">Email : </label>
                    </h4>
                    <p>
                        <asp:Label ID="lbemail" runat="server" Text=""></asp:Label>
                    </p>
                    <asp:TextBox ID="txtEmail" Visible="false" CssClass="em form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="votre Prenom s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="grp"></asp:RequiredFieldValidator>

                </div>

                <div class="form-group col-lg-12 col-md-12 col-sm-12">
                    <h4>
                        <label for="ville">Ville :  </label>
                    </h4>
                    <p>
                        <asp:Label ID="lbville" runat="server" Text=""></asp:Label>
                    </p>
                    <asp:DropDownList ID="drville" Class="em form-control" Visible="False" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nom_Ville" DataValueField="ID_ville"></asp:DropDownList>
                </div>
                <div class="form-group col-lg-12 col-md-12 col-sm-12">
                    <h4>Description :
                    </h4>
                    <br />
                    <p>
                        <asp:Label ID="lbDesc" CssClass="form-control" runat="server" Text=""></asp:Label>
                    </p>

                    <asp:TextBox ID="txtDesc" CssClass="em form-control" runat="server" Visible="false" placeholder="Description" TextMode="MultiLine" Height="192px"></asp:TextBox>

                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 mrlt">
                    <h4><asp:Label ID="LBmotpass" runat="server">Mot de pass</asp:Label> </h4>
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
                    <asp:Button Class="btn btn-primary btn-block" ID="btnMPss" runat="server" Visible="false" OnClick="btnMPss_Click" Text="Modifier mot de pass" />
                    <asp:Button Class="btn btn-secondary btn-block" ID="btnEMt" Visible="false" runat="server" OnClick="btnEMt_Click" ValidationGroup="MP" Text="Enregistrer mot de pass" />
                    <asp:Button Class="btn btn-secondary btn-block" ID="btnAnulPass" Visible="false" runat="server" OnClick="btnAnulPass_Click" Text="Annuler" />
                </div>

                <div class="col-lg-12 col-md-12 col-sm-12 mrlt">
                    <asp:Button CssClass="btn btn-primary btn-block" ID="btnMod" runat="server" OnClick="btnMod_Click" Text="Modifier les informations personel" />

                </div>
                <div class="col-lg-6 col-md-12 col-sm-12 mrlt">
                    <asp:Button CssClass="btn btn-success btn-block" ID="Button1" runat="server" OnClick="Button1_Click" Visible="false" ValidationGroup="grp" Text="Enregistrer Information" />
                </div>
                <div class="col-lg-2 col-md-12 col-sm-12 mrlt">
                    <asp:Button CssClass="btn btn-secondary btn-block" ID="btnAnull" runat="server" OnClick="btnAnull_Click" Visible="false" Text="Annuler" />
                </div>
                <asp:Label ID="Label3" runat="server" Visible="false"> </asp:Label>

            </div>

            <div class="col-lg-12 col-md-12 col-sm-12">
                <h3 class="auto-style1" style="margin-top: 29px">Information professionnelle</h3>
            </div>

            <div class="col-lg-12 col-md-12 col-sm-12 mrlt">
                <div class="text-center">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="transparent" />
                    <Columns>
                        <asp:TemplateField HeaderText="Etablissemenet" SortExpression="Nom_Etb">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nom_Etb") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="Etab" runat="server" OnClick="Etab_Click" Text='<%# Bind("Nom_Etb") %>'></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle ForeColor="#666666" />
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

                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:aspPrejectConnectionString %>" SelectCommand="SELECT Etablissement.Nom_Etb FROM formateur INNER JOIN Etablissement ON formateur.ID_Etb = Etablissement.ID_Etab WHERE (formateur.ID_For = @E)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="1" Name="E" SessionField="ID_Prof" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>

            <div class="col-lg-6 col-md-6 col-sm-12 mrlt">
                <%--<h4>Les Filières</h4>--%>
                <div class="text-center">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="transparent" />
                    <Columns>
                        <asp:TemplateField SortExpression="Nom_Filire" HeaderText="Les Filières">

                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Nom_Filire") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="Filir" OnClick="Filir_Click" runat="server" Text='<%# Bind("Nom_Filire") %>'></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle ForeColor="#666666" />
                            <ItemStyle />
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
                <div class="text-center">
                    <div class="text-center">
                    </div>
                </div>
                <br />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT Filire.Nom_Filire FROM Filire INNER JOIN Format_Filer ON Filire.ID_Fil = Format_Filer.ID_Filire WHERE (Format_Filer.ID_Form in( @For,@V) )">
                    <SelectParameters>
                        <asp:SessionParameter Name="For" SessionField="ID_Prof" DefaultValue="0" />
                        <asp:SessionParameter DefaultValue="0" Name="V" SessionField="IDF_V" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div class="col-lg-6 col-md-6 col-sm-12 mrlt">
                <%-- <h4>Les Groups </h4>--%>
                <div class="text-center">
                <asp:GridView ID="GridView1"  runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource6" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="transparent" />
                    <Columns>
                        <asp:TemplateField SortExpression="Nom" HeaderText="Les Groups">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nom") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="Grp" OnClick="Grp_Click" runat="server" Text='<%# Bind("Nom") %>'></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle ForeColor="#666666" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="transparent" Font-Size="25px" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="transparent" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>

                </div>
                <div class="text-center">

                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT Group_Et.Nom FROM Group_Et INNER JOIN G_F ON Group_Et.ID_Group = G_F.ID_G WHERE (G_F.ID_Formateur in(@F,@V))">
                        <SelectParameters>
                            <asp:SessionParameter Name="F" SessionField="ID_Prof" DefaultValue="0" />
                            <asp:SessionParameter DefaultValue="0" Name="V" SessionField="IDF_V" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
                <br />

            </div>



        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [ID_ville], [Nom_Ville] FROM [Ville]"></asp:SqlDataSource>

</asp:Content>
