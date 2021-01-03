<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Ajouter_Cours.aspx.cs" Inherits="WebApplication4.Ajouter_Cours" %>

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

        label {
            font-size: 18px;
            margin-bottom: 10px;
            color: #919aa3;
            padding-left: 5px;
        }
    </style>

    <div class="container" style="background-color: white; max-width: 100%; margin-top: 5%; padding: 5%; margin-bottom: 5%;">
        <h3 style="text-align: center;">Ajouter cour
        </h3>
        <br />
        <div class="row">
            <div class="form-group col-lg-6 col-sm-12">
                <label>Nom Cour : </label>
                <asp:TextBox class="form-control" runat="server" ID="txtNom" placeholder="Nom  de coure"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vld" ControlToValidate="txtNom" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group col-lg-6 col-sm-12">
                <label>Réalisé par professeur :</label>
                <asp:TextBox class="form-control" ID="txtRealise" ReadOnly="true" runat="server"></asp:TextBox>
            </div>
            <div class="form-group col-lg-12 col-sm-12">
                <label>Description : </label>
                <asp:TextBox runat="server" TextMode="MultiLine" Style="height: 150px" ID="txtDesc" class="form-control"> </asp:TextBox>
            </div>

            <div class="form-group col-lg-6 col-sm-12">
                <label>Filiere :</label>
                <asp:DropDownList runat="server" ID="Filire" class="form-control" DataTextField="Nom_Filire" DataValueField="ID_Fil" AutoPostBack="True" OnSelectedIndexChanged="Filire_SelectedIndexChanged"></asp:DropDownList>

            </div>
            <div class="form-group col-lg-3 col-sm-12">
                <label>Module : </label>
                <asp:DropDownList runat="server" ID="Module" class="form-control" DataSourceID="SqlDataSource2" DataTextField="Nome_Module" DataValueField="ID_M"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT Module.ID_M, Module.Nome_Module FROM Module INNER JOIN Mod_Filier ON Module.ID_M = Mod_Filier.ID_Module WHERE (Mod_Filier.ID_Filire = @F)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Filire" DefaultValue="0" Name="F" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <div class="form-group col-lg-3 col-sm-12">
                <label>Lancement en groupe (facultatif / ختياري)  : </label>
                 <asp:GridView ID="grdGr" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Group" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkG1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Nom" HeaderText="Groupes qui enseignent " SortExpression="Nom" />
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
            </div>
            <div class="form-group col-lg-6 col-sm-12">
                <hr />
                <label>Téléverser un fichier : </label>
                <asp:FileUpload class="form-control" Style="margin-bottom: 25px; padding-bottom: 20px;" ID="DecumentUp" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="vld" ControlToValidate="DecumentUp" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group col-lg-6 col-sm-12">
                <hr />
                <label>Téléverser un line de video (OPTIONNEL / ختياري) : </label>
                <asp:FileUpload class="form-control" Style="margin-bottom: 25px; padding-bottom: 20px;" ID="upvd" runat="server" />
            </div>

            <div class="form-group col-lg-12 col-sm-12" style="text-align:center">
                <hr />
                <label>&nbsp; </label>
                <asp:LinkButton ID="save" ValidationGroup="vld" style="width:30%" OnClick="save_Click" CssClass="btn btn-primary "  runat="server">Enregistere</asp:LinkButton>

            </div>
            <asp:Label runat="server" ID="FilMess"></asp:Label>

            <div class="data col-lg-12 col-md-12 col-sm-12">
                <div class="card">
                    <div class="card-header" id="" style="text-align:center">
                        <h3>
                            <asp:LinkButton runat="server" data-toggle="collapse" ID="filibtn" data-target="#collapseFil" aria-expanded="false" aria-controls="collapseFil"> Les cours téléverser </asp:LinkButton>
                        </h3>
                    </div>
                </div>
                <div class="container collapse show" id="collapseFil">
                    <div class="row">


                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div class="col-lg-3 col-md-5 card" style="text-align:center">
                                        <div class="form-group">
                                            <asp:Image ID="Image1" runat="server" Width="150px" Height="150px" ImageUrl="~/imgProfil/doc.jpg" />
                                        </div>
                                        <div class="form-group ">
                                            <h4>
                                                <asp:Label ID="titer" runat="server" Text="Titer Cour"></asp:Label>
                                            </h4>
                                            <asp:LinkButton ID="lnNom" OnClick="lnNom_Click" CommandArgument='<%# Eval("ID_Cour") %>' runat="server" Text='<%# Eval("Nom") %>'></asp:LinkButton>
                                       
                                            <h4>
                                                <asp:Label ID="Label1" runat="server" Text="Filiere"></asp:Label>
                                            </h4>
                                            <asp:LinkButton ID="lnFiliere" runat="server" Text='<%# Eval("Filiere") %>'></asp:LinkButton>
                                            <h4>
                                                <asp:Label ID="Label2" runat="server" Text="Module"></asp:Label>
                                            </h4>
                                            <asp:LinkButton ID="lnModule" runat="server" Text='<%# Eval("Module") %>'></asp:LinkButton>
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
        </div>
    </div>

</asp:Content>
