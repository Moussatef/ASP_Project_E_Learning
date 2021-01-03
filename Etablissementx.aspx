<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Etablissementx.aspx.cs" Inherits="WebApplication4.Etablissementx" %>

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
            margin: 2% auto 0;
            max-width: 100%;
            display: block;
            box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
        }

            .weapper .left {
                width: 100%;
                display: flex;
                background: linear-gradient(to left,#01a9ac,#01dbdf);
                padding: 15px 15px;
                border-top-left-radius: 5px;
                border-bottom-left-radius: 5px;
                text-align: left;
                color: #fff;
            }

                .weapper .left img {
                    margin: 10px;
                    border-radius: 5px;
                }

                .weapper .left h4 {
                    margin: 30px 20px;
                    text-align: center;
                    padding-bottom: 5px;
                    border-bottom: 2px solid #e0e0e0;
                }

                .weapper .left p {
                    font-size: 20px;
                    text-align: center;
                }

            .weapper .right {
                width: 100%;
                background: #fff;
                border-top-right-radius: 5px;
                border-bottom-right-radius: 5px;
                padding: 30px 15px;
            }

                .weapper .right .info-data, .weapper .right .Etud-data {
                    margin-bottom: 8%;
                }

                    .weapper .right h3, .weapper .right .Etud-data h3 {
                        margin-bottom: 5%;
                        padding-bottom: 5px;
                        padding-left:10px;
                        border-bottom: 1px solid #e0e0e0;
                        color: #353c4e;
                        text-transform: uppercase;
                        letter-spacing: 3px;
                    }

                .weapper .right .info-data,
                .weapper .right .Etud-data {
                    /*padding-left: 30px;*/
                    /*display: flex;*/
                    justify-content: space-between;
                }

                    .weapper .right .info-data ,
                    .weapper .right .Etud-data  {
                        /*width: 45%;*/
                        margin-bottom: 50px;
                    }

                        .weapper .right .info-data  h4,
                        .weapper .right .Etud-data  h4 {
                            color: #353c4e;
                            margin-bottom: 5px;
                        }

                        .weapper .right .info-data  p,
                        .weapper .right .Etud-data  p {
                            font-size: 20px;
                            margin-bottom: 10px;
                            color: #919aa3;
                            padding-left: 5px;
                        }

        .brd {
            margin-right: auto;
            margin-left: auto;
        }

        .si {
            background-color: rgb(13, 75, 190);
            color: #fff;
            width: 100%;
            padding: 10px;
            border-radius: 20px;
            font-size: 15px;
            border: none;
            cursor: pointer;
        }

            .si:hover {
                background-color: #2ecc71;
            }

        .em {
            border-radius: 18px;
            padding: 8px 10px;
            margin: 20px auto;
            width: 300px;
            color: rgb(19, 19, 19);
            transition: 0.25s;
            border: 2px solid #3498db;
            outline: none;
        }

            .em:focus {
                width: 350px;
                border-color: #2ecc71;
            }
              a {
            font-size: 18px;
            margin-bottom: 10px;
            color: #919aa3;
            padding-left: 5px;
        }
    </style>
    <div class="weapper">
        <div class="left">
            <asp:Image ID="imgPr" runat="server" Width="150px" Height="160px" />
            <div class=" brd">
                <h4>
                    <asp:Label ID="lbNEtb" runat="server"></asp:Label></h4>
                <p>
                    <asp:Label ID="Reg" runat="server"></asp:Label>
                </p>
            </div>

        </div>
        <div class="right container">
            <h3>Fiche détaillée de l'établissement</h3>
            <div class="info  row">
                
                <div class="info-data col-lg-6 col-md-12 col-ms-12"> 
                    
                        <h4>Etablissement  </h4>
                        <p>
                            <asp:Label ID="lbNom" runat="server"></asp:Label>
                            <asp:TextBox ID="txtNE" CssClass="em" runat="server" Visible="false"></asp:TextBox>
                        </p>

                    </div>
                    <div class="info-data col-lg-6 col-md-12 col-ms-12">
                        <h4>Ville</h4>
                        <p>
                            <asp:Label ID="lbVille" runat="server"> </asp:Label>
                            <asp:TextBox ID="txtvill" CssClass="em" runat="server" Visible="false"></asp:TextBox>
                        </p>
                    </div>


                    <div class="info-data col-lg-6 col-md-12 col-ms-12">
                        <h4>Teleohone </h4>
                        <p>
                            <asp:Label ID="lbphone" runat="server"></asp:Label>
                            <asp:TextBox ID="txtPhone" CssClass="em" runat="server" Visible="false"></asp:TextBox>

                        </p>
                    </div>
                    <div class="info-data col-lg-6 col-md-12 col-ms-12">
                        <h4>Adresse  </h4>
                        <p>
                            <asp:Label ID="lbAdrr" runat="server"></asp:Label>
                            <asp:TextBox ID="txtAdrr" CssClass="em" runat="server" Visible="false"></asp:TextBox>
                        </p>
                    </div>
            </div>
            <br />
            <h3>Filières assurées à l'établissement</h3>
            
            <div class="Etud-data row">
                
                <div class="data col-lg-12 " >
                    <asp:GridView ID="GridFil" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" Width="100%" Font-Bold="True" Font-Underline="False" OnSelectedIndexChanged="GridFil_SelectedIndexChanged" BackColor="White" BorderColor="#e0e0e0" BorderStyle="None" BorderWidth="1px">
                       <AlternatingRowStyle BackColor="transparent" />
                        <Columns>
                            <asp:TemplateField HeaderText="Nom de filière" SortExpression="Nom_Filire">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nom_Filire") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="Fil" OnClick="Fil_Click" Font-Underline="false"  runat="server" Text='<%# Bind("Nom_Filire") %>'></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle ForeColor="#666666" />
                                <FooterStyle Font-Bold="True" Font-Overline="False" Font-Underline="False" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="niveau_formation" HeaderText="Niveau formation" SortExpression="niveau_formation" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspPrejectConnectionString %>" SelectCommand="SELECT F.Nom_Filire, N.niveau_formation FROM Filire AS F LEFT OUTER JOIN NvFormation AS N ON F.ID_NV = N.ID_NF WHERE (F.ID_Fil IN (SELECT F.ID_Fil FROM Fill_Etable AS Fill_Etable_1 WHERE (ID_Etabli = @E)))">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="E" SessionField="ID_E" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <br />
                <div class="col-lg-12 col-md-12 col-sm-12 mrlt">
                    <asp:Button CssClass="si" ID="btnMod" runat="server" Visible="false" OnClick="btnMod_Click" Text="Modifier les informations" />
                </div>
                </div>
            </div>
        </div>
   
</asp:Content>
