<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Module.aspx.cs" Inherits="WebApplication4.Module" %>

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
                width: 13%;
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
                    font-size: 16px;
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
                            margin-bottom: 10px;
                            color: #919aa3;
                            padding-left: 5px;
                        }
    </style>

    <div class="weapper">
        <div class="left">
        </div>
        <div class="right" style="width: 77%">
            <div class="info">
                <h3>Les modules de première année</h3>
                <h4>Première année : </h4>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Style="width: 100%; height: auto">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="N° Module" SortExpression="N_Module">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("N_Module") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="Label1" runat="server" Font-Underline="false" ForeColor="#33ccff" Text='<%# Bind("N_Module") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Nome_Module" HeaderText="Module" SortExpression="Nome_Module" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspPrejectConnectionString %>" SelectCommand="SELECT Module.N_Module, Module.Nome_Module FROM Mod_Filier INNER JOIN Module INNER JOIN A_M ON Module.ID_M = A_M.ID_Module ON Mod_Filier.ID_Module = Module.ID_M WHERE (A_M.Annee_scolaire =1) AND (Mod_Filier.ID_Filire = @M)">
                    <SelectParameters>
                        <asp:SessionParameter Name="M" SessionField="ID_M" />
                    </SelectParameters>
                </asp:SqlDataSource>


            </div>

            <div class="Etud">
                <h3>Les modules de deuxième année</h3>
                <h4>Deuxième année : </h4>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" Style="width: 100%; height: auto;" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="N° Module" SortExpression="N_Module">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("N_Module") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="Label2" runat="server" Font-Underline="false" ForeColor="#33ccff" Text='<%# Bind("N_Module") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Nome_Module" HeaderText="Module" SortExpression="Nome_Module" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:aspPrejectConnectionString %>" SelectCommand="SELECT Module.N_Module, Module.Nome_Module FROM Mod_Filier INNER JOIN Module INNER JOIN A_M ON Module.ID_M = A_M.ID_Module ON Mod_Filier.ID_Module = Module.ID_M WHERE (A_M.Annee_scolaire =2) AND (Mod_Filier.ID_Filire = @M)">
                    <SelectParameters>
                        <asp:SessionParameter Name="M" SessionField="ID_M" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>
