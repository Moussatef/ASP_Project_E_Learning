<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EtabFiltr.aspx.cs" Inherits="WebApplication4.EtabFiltr" %>

<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <link rel="stylesheet" href="css/ETBP.css">--%>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Raleway&display=swap');
        body {
            margin: 0;
            padding: 0;
            font-family: 'Raleway', sans-serif;
            background: #f3f3f3;
        }

        .em {
            
            padding: 5px 2px;
            margin: 10px 0;
            width: 350px;
            transition: 0.25s;
            border: 2px solid #3498db;
            outline: none;
        }

            .em:focus {
                border-color: #2ecc71;
            }

        .weapper {
            margin: 3% auto 0;
            width: 100%;
            height: 100%;
            display: flex;
            box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
        }

            .weapper  .data h3 ,.weapper .info-data h3{
                margin-top: 35px;
                margin-bottom: 10%;
                padding-bottom: 5px;
                border-bottom: 1px solid #e0e0e0;
                color: #353c4e;
                text-transform: uppercase;
                letter-spacing: 3px;
            }
            .weapper .data h3 {
                margin-top: 35px;
                margin-bottom: 1%;
                padding-bottom: 5px;
                border-bottom: 1px solid #e0e0e0;
                color: #353c4e;
                text-transform: uppercase;
                letter-spacing: 3px;
            }


            .weapper .info-data,
            .weapper .Etud-data {
                width: 100%;
                padding-left: 30px;
                display: flex;
                justify-content: space-between;
            }
        a {
            font-size: 18px;
            margin-bottom: 10px;
            color: #919aa3;
            padding-left: 5px;
        }
    </style>

    <div class="weapper container ">
        <div class="info-data row ">
            <h3 class=" col-lg-12 col-md-12 col-sm-12">Recherecher etablissement</h3>
            <hr />
            <div class="data col-lg-6 col-md-12 col-sm-12">
                <h4>Les Region : </h4>
                <asp:DropDownList ID="cmbReg" runat="server" CssClass="em form-control" AutoPostBack="True" OnSelectedIndexChanged="cmbReg_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="data col-lg-6 col-md-12 col-sm-12">
                <h4>Ville :</h4>
                <asp:DropDownList ID="cmbVille" runat="server" CssClass="em" AutoPostBack="True" OnSelectedIndexChanged="cmbVille_SelectedIndexChanged"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:aspPrejectConnectionString %>" SelectCommand="SELECT [ID_ville], [Nom_Ville] FROM [Ville]"></asp:SqlDataSource>
            </div>

            <div style="height: 50px; width: 100%"></div>

            <div class="data col-lg-12 col-md-12 col-sm-12" style="height: 120%;">
                <h3 class="col-lg-12 col-md-12 col-sm-12">Les Etablissements </h3>
                <asp:GridView ID="GridEtab" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%"  Font-Bold="True" Font-Underline="False" AutoGenerateColumns="False" Height="100%">
                    <AlternatingRowStyle BackColor="transparent" />
                    <EmptyDataTemplate>
                        No data here
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("img") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" Width="50px" Height="45px" runat="server" ImageUrl='<%# Eval("img") %>' />
                            </ItemTemplate>
                            <FooterStyle />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nom_Etb") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="Etb" runat="server" OnClick="Etb_Click" Font-Underline="false"  Text='<%# Bind("Nom_Etb") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID_Etab" Visible="False" />
                    </Columns>

                    <EditRowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#EFF3FB" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="transparent" Font-Size="25px"  Font-Bold="True" ForeColor="#353c4e" />
                        <PagerStyle BackColor="#EFF3FB" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="transparent" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#EFF3FB" />
                        <SortedAscendingHeaderStyle BackColor="#EFF3FB" />
                        <SortedDescendingCellStyle BackColor="#EFF3FB" />
                        <SortedDescendingHeaderStyle BackColor="#EFF3FB" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspPrejectConnectionString %>" SelectCommand="SELECT Etablissement.Nom_Etb,img FROM Etablissement INNER JOIN Ville ON Etablissement.ID_Ville = Ville.ID_ville WHERE (Etablissement.ID_Ville = @V)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbVille" DefaultValue="1" Name="V" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
