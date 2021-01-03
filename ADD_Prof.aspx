<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ADD_Prof.aspx.cs" Inherits="WebApplication4.ADD_Prof" %>

<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="background-color: white; max-width:90%; margin-top: 5%; padding: 5%; margin-bottom: 5%;">
        <div class="row">

            <div class="data col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="card-header" id="">
                        <h3>
                            <asp:LinkButton runat="server" data-toggle="collapse" ID="filibtn" data-target="#collapseFil" aria-expanded="false" aria-controls="collapseFil">
                                 Enseignants D'établissement
                            </asp:LinkButton>
                        </h3>
                    </div>
                </div>
                <div class="collapse show" id="collapseFil">
                    <div class="card card-body">
                        <h4>
                           Enseignants Departement Informatique 
                        </h4>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"  ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [ID_For], [Nom], [Prenom], [Email], [img] FROM [formateur]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [formateur] WHERE [ID_For] = @original_ID_For AND (([Nom] = @original_Nom) OR ([Nom] IS NULL AND @original_Nom IS NULL)) AND (([Prenom] = @original_Prenom) OR ([Prenom] IS NULL AND @original_Prenom IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([img] = @original_img) OR ([img] IS NULL AND @original_img IS NULL))" InsertCommand="INSERT INTO [formateur] ([Nom], [Prenom], [Email], [img]) VALUES (@Nom, @Prenom, @Email, @img)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [formateur] SET [Nom] = @Nom, [Prenom] = @Prenom, [Email] = @Email, [img] = @img WHERE [ID_For] = @original_ID_For AND (([Nom] = @original_Nom) OR ([Nom] IS NULL AND @original_Nom IS NULL)) AND (([Prenom] = @original_Prenom) OR ([Prenom] IS NULL AND @original_Prenom IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([img] = @original_img) OR ([img] IS NULL AND @original_img IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_ID_For" Type="Int32" />
                                <asp:Parameter Name="original_Nom" Type="String" />
                                <asp:Parameter Name="original_Prenom" Type="String" />
                                <asp:Parameter Name="original_Email" Type="String" />
                                <asp:Parameter Name="original_img" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Nom" Type="String" />
                                <asp:Parameter Name="Prenom" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="img" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Nom" Type="String" />
                                <asp:Parameter Name="Prenom" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="img" Type="String" />
                                <asp:Parameter Name="original_ID_For" Type="Int32" />
                                <asp:Parameter Name="original_Nom" Type="String" />
                                <asp:Parameter Name="original_Prenom" Type="String" />
                                <asp:Parameter Name="original_Email" Type="String" />
                                <asp:Parameter Name="original_img" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                        <div class="text-center">

                        <asp:GridView ID="GridView2" runat="server" DataKeyNames="ID_For" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="100%" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" OnRowCancelingEdit="GridView2_RowCancelingEdit" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView2_RowDeleting" OnSelectedIndexChanging="GridView2_SelectedIndexChanging">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Profil"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("ID_For") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("ID_For") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("img") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img") %>' />
                                    </ItemTemplate>
                                    <ControlStyle Height="50px" Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nom">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtNomD" runat="server" Text='<%# Eval("Nom") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Nom") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Prenom">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPrenomD" runat="server" Text='<%# Eval("Prenom") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Prenom") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEmailD" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Operation">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton9" CssClass="btn btn-secondary" runat="server" CommandName="Update">Update</asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="LinkButton10" runat="server" CssClass="btn btn-danger" CommandName="Cancel">Cancel</asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <div class="text-center">
                                            <asp:LinkButton ID="LinkButton7" runat="server"  CssClass="btn btn-primary" CommandName="Edit">Edite</asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:LinkButton ID="LinkButton8" runat="server"  CssClass="btn btn-danger" CommandName="Delete">Delete</asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>


                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />


                        </asp:GridView>

                        </div>

                    </div>

                </div>

            </div>
            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                <br />
                <h3>
                    Ajouter Enseignant
                </h3>
                <br />
                <hr />
            </div>
            <div class="form-group col-lg-6 col-sm-12">
                <hr />
                <label for="nom">Nom : </label>
                <asp:TextBox ID="txtNom" placeholder="Votre Nom" CssClass="em form-control" runat="server" Visible="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNom" Display="Dynamic" ErrorMessage="votre nom s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="grp"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="grp" ControlToValidate="txtNom" Display="Dynamic" ErrorMessage="Char" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group col-lg-6 col-sm-12">
                <hr />
                <label for="prenom">Prenom : </label>
                <asp:TextBox ID="txtPrenom" placeholder="Votre Prenom" Visible="true" CssClass="em form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrenom" Display="Dynamic" ErrorMessage="votre Prenom s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="grp"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="grp" ControlToValidate="txtPrenom" Display="Dynamic" ErrorMessage="Char" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group col-lg-12 col-sm-12">
                <label for="email">Email : </label>
                <asp:TextBox ID="txtEmail" placeholder="Votre Email" Visible="true" CssClass="em form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="votre Prenom s'il vous plait !!" ForeColor="#FF5050" SetFocusOnError="True" ValidationGroup="grp"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-12 col-md-9 col-sm-9 ">
                <p>
                    <asp:Label ID="lbNmt" Visible="true" Text="Mot de pass : " runat="server" Style="margin-right: 50px; padding-right: 65px; padding-bottom: 25px"></asp:Label>
                </p>
                <asp:TextBox ID="txtPass" Class="em form-control" TextMode="Password" runat="server" Visible="true" placeholder="Votre mot de pass" Style="margin-bottom: 25px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="MP" runat="server" ErrorMessage="*" ControlToValidate="txtPass" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-12 col-md-9 col-sm-9 ">
                <p>
                    <asp:Label ID="lbCmt" Visible="true" Text="Confirmie mot de pass : " Style="margin-right: 30px; padding-bottom: 25px; padding-top: 25px" runat="server"></asp:Label>
                </p>
                <asp:TextBox ID="txtPassconf" Visible="true" TextMode="Password" Class="em form-control" runat="server" placeholder="Confirmie mot de pass"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="grp" runat="server" ErrorMessage="*" ControlToValidate="txtPassconf" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" ValidationGroup="grp" runat="server" ErrorMessage="!" ControlToCompare="txtPass" ControlToValidate="txtPassconf" Display="Dynamic"></asp:CompareValidator>
            </div>

            <div class="form-group col-lg-3 col-md-6  col-sm-12">
                <br />
                <asp:Label runat="server" Font-Size="15px" CssClass="ac" Width="165px" Text="Ville : "></asp:Label>
                <asp:TextBox ID="vill" ReadOnly="true" CssClass="form-control em" runat="server"></asp:TextBox>
            </div>
            <div class="form-group col-lg-9 col-md-6  col-sm-12">
                <br />
                <asp:Label runat="server" Font-Size="15px" CssClass="ac" Width="165px" Text="Etablissement : "></asp:Label>
                <asp:TextBox ID="etab" ReadOnly="true" CssClass="em form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group col-lg-6 col-sm-12">


                <asp:GridView ID="grdFilir" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Fil" DataSourceID="SqlDataSource1" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkF" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_Fil" ReadOnly="True" SortExpression="ID_Fil" Visible="True" />
                        <asp:BoundField DataField="Nom_Filire" HeaderText="Filiere qui enseignent" SortExpression="Nom_Filire" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspPrejectConnectionString %>" SelectCommand="SELECT F.ID_Fil,F.Nom_Filire FROM Etablissement INNER JOIN Fill_Etable ON Etablissement.ID_Etab = Fill_Etable.ID_Etabli RIGHT OUTER JOIN Filire AS F ON Fill_Etable.ID_Fil = F.ID_Fil  WHERE (Etablissement.Email =@F)">
                    <SelectParameters>
                        <asp:SessionParameter Name="F" SessionField="Etablissement" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <h3>
                    <asp:LinkButton ID="vd" CssClass="btn btn-secondary" Style="float: inherit" OnClick="vd_Click" runat="server">Confiremer</asp:LinkButton>
                </h3>


                <asp:Label runat="server" ID="lb1"></asp:Label>
            </div>
            <div class="form-group col-lg-4 col-sm-12">
                <asp:GridView ID="grdGr1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Group" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkG1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Nom" HeaderText="Groupes qui enseignent on 1ere annee" SortExpression="Nom" />
                        <asp:BoundField DataField="ID_Group" HeaderText="ID_Group" SortExpression="ID_Group" Visible="False" />
                    </Columns>
                    <EditRowStyle BackColor="#EFF3FB" />
                    <FooterStyle BackColor="#EFF3FB" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="transparent" Font-Size="15px" Font-Bold="True" ForeColor="#353c4e" />
                    <PagerStyle BackColor="#EFF3FB" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="transparent" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#EFF3FB" />
                    <SortedAscendingHeaderStyle BackColor="#EFF3FB" />
                    <SortedDescendingCellStyle BackColor="#EFF3FB" />
                    <SortedDescendingHeaderStyle BackColor="#EFF3FB" />
                </asp:GridView>

                <asp:GridView ID="grdGrp" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Group" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkG2" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_Group" SortExpression="ID_Group" Visible="False" />
                        <asp:BoundField DataField="Nom" HeaderText="Groupes qui enseignent on 2ere annee" SortExpression="Nom" />
                    </Columns>
                    <EditRowStyle BackColor="#EFF3FB" />
                    <FooterStyle BackColor="#EFF3FB" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="transparent" Font-Size="15px" Font-Bold="True" ForeColor="#353c4e" />
                    <PagerStyle BackColor="#EFF3FB" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="transparent" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#EFF3FB" />
                    <SortedAscendingHeaderStyle BackColor="#EFF3FB" />
                    <SortedDescendingCellStyle BackColor="#EFF3FB" />
                    <SortedDescendingHeaderStyle BackColor="#EFF3FB" />
                </asp:GridView>
            </div>
            <div class="form-group col-lg-6 col-sm-12">
            </div>
            <div class="form-group col-lg-6 col-sm-12">
                <asp:LinkButton ID="btnEnrg" CssClass="btn btn-primary btn-block" OnClick="btnEnrg_Click" runat="server" ValidationGroup="grp">Enregistrier</asp:LinkButton>
                <hr />
                <asp:Label ID="lb2" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
