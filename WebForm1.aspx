<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication4.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <a href="Dashboard.aspx" style="    font-weight: bold;">
                    Dashboard
                </a>
                <span style="font-size:12px ;font-weight:800">.</span>
                <a href="profile.aspx" style="    font-weight: bold;">
                    Parametres
                </a>
                <h2   style="border-bottom: #e8e8e8 solid 1.5px;">Parametres</h2>
  <div style="background-color:#edeeef">

      <div class="container" style="background-color:white ;margin-top:5% ;padding:5%;margin-bottom:5%;">
                <div class="row">
                    <div class="col-lg-3 col-sm-3 " style="    margin-top: 3%;">
                        <asp:Image ID="Image1" runat="server" class="img-responsive img-circle"  style="width:160px; height:160px ;margin-top:5px; margin-left:16%;" />
                    
                    </div>
                    <div class="col-lg-9 col-sm-9">
                   
                            <div class="form-group col-lg-5 col-sm-12">
                                <label for="nom">Nom Complet</label>
                                <input type="text" class="form-control" runat="server" id="nom" placeholder="Votre nom" value="Yassine Bissaoui">
                            </div>  
                            <div class="form-group col-lg-4 col-sm-12">
                                <label for="ddn">Date de naissance</label>
                            </div>  
                         <div class="form-group col-lg-3 col-sm-12">
                                <label for="Etablissement1"> Sexe :      </label>
                              <asp:DropDownList runat="server" id="DropDownList4"  class="form-control" > </asp:DropDownList>
                            </div>
                             <div class="form-group col-lg-12 col-sm-12">
                                <label for="email">Email</label>
                                <input type="text" class="form-control" disabled runat="server"  placeholder="Votre Email" value="  Yassine.Bissaoui@gmail.com">
                            </div>  
                            <div class="form-group col-lg-6 col-sm-12">
                                <label for="ville"> Ville :      </label>
                              <asp:DropDownList runat="server" id="ville"  class="form-control" > </asp:DropDownList>
                              
                            </div>  
                            <div class="form-group col-lg-6 col-sm-12">
                                <label for="Etablissement1"> Etablissement :      </label>
                              <asp:DropDownList runat="server" id="Etablissement1"  class="form-control" > </asp:DropDownList>
                            </div>  
                            <div class="form-group col-lg-4 col-sm-12">
                                <label for="Etablissement1"> Departement :      </label>
                              <asp:DropDownList runat="server" id="DropDownList1"  class="form-control" > </asp:DropDownList>
                            </div>  
                             <div class="form-group col-lg-4 col-sm-12">
                                <label for="Etablissement1"> Filier :      </label>
                              <asp:DropDownList runat="server" id="DropDownList3"  class="form-control" > </asp:DropDownList>
                            </div>
                            <div class="form-group col-lg-4 col-sm-12">
                                <label for="Etablissement1"> Niveau de formation :      </label>
                              <asp:DropDownList runat="server" id="DropDownList2"  class="form-control" > </asp:DropDownList>
                            </div>  
                            <div class="form-group col-lg-12 col-sm-12"><label>   Description : </label>
                                <textarea class="form-control" >
                                                                nana nanana nanana nnana nanana  
                                </textarea>
                            </div>  
                   </div>
                </div>
           </div>
        </div>
</asp:Content>

