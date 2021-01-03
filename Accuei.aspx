<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Accuei.aspx.cs" Inherits="WebApplication4.WebForm2" %>

<%@ MasterType VirtualPath="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .all {
            box-sizing: border-box;
            font-family: 'Poppins',sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #f3f3f3;
            overflow: hidden;
        }

        .galery {
            /*height: 100%;*/
            width:1150px;
            display: flex;
            /*margin: 2% auto 40px;*/
            box-sizing: border-box;
            position:relative;
            flex-wrap:wrap;
            justify-content:space-between;
            transition:0.5s;
            margin-bottom:15px;
        }
        .galery .card{
            position:relative;
            width:500px;
            height:100%;
            background:#fff;
            transition:0.5s;
            margin-bottom:15px;

        }
         .galery .card:hover{
             transform:translateY(-40px);
         }
   
       .galery .card  .img-box{
           position:relative;
           width:500px;
           height:300px;
           background:#00c7ff;
           display:flex;
           justify-content:center;
           align-items:center;
           flex-direction:column;

       }
        .galery .card  .img-box img {
                width: 100%;
               height:300px;
                margin-bottom: 5px;
                object-fit: cover;
                transition: .5s;
            }
         .galery .card  .img-box h3{
             position:relative;
             color:#fff;
             margin-top:10px;
         }
          .galery .card  .content{
              position:relative;
              width:100%;
              height:auto;
              padding:5px;
              color:#777;
              text-align:center;
              margin-bottom:10%;
          }

       
    </style>
    <div class="all">


        <div class="galery">
            <div class="card act as">
                <div class="img-box act">
                    <img src="css/img/m1.jpg">
                    <h3>Sa Majesté le Roi Mohammed VI</h3>
                </div>
                <div class="content">
                    <p>
Sa Majesté le Roi Mohammed VI lance les travaux de construction de la Cité des Métiers et des Compétences Souss Massa                    </p>
                </div>
            </div>
            <div class="card">
                <div class="img-box act">
                    <img src="css/img/m2.jpg">
                    
                </div>
                <div class="content">
                    <p>
Les partenaires du projet AGEVEC célèbrent sa contribution à l’insertion des jeunes à l’occasion d’une cérémonie de clôture à Settat                    </p>
                </div>
            </div>
            <div class="card">
                <div class="img-box act">
                    <img src="css/img/m33.jpg">
                    <h3></h3>
                </div>
                <div class="content">
                    <p>
L'OFPPT lance la formation à distance                    </p>
                </div>
            </div>
            <div class="card">
                <div class="img-box act">
                    <img src="css/img/m4.jpg">
                    <h3></h3>
                </div>
                <div class="content">
                    <p>
                    </p>
                </div>
            </div>

            <div class="card">
                <div class="img-box act">
                    <img src="css/img/m5.jpg">
                    <h3></h3>
                </div>
                <div class="content">
                    <p>

                    </p>
                </div>
            </div>

            <div class="card">
                <div class="img-box act">
                    <img src="css/img/m6.jpg">
                    <h3></h3>
                </div>
                <div class="content">
                    <p>
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
