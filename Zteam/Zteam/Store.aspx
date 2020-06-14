<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="Zteam.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nk-main">

        <!-- START: Breadcrumbs -->
        <div class="nk-gap-1"></div>
        <div class="container">
            <ul class="nk-breadcrumbs">
                <li><span>Store</span></li>
            </ul>
        </div>
    </div>
    <div class="nk-gap-1"></div>
    <!-- END: Breadcrumbs -->

    <div class="container">
        <!--veritabanı bağlama-->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GAMES_SALES_PLATFORMConnectionString %>" SelectCommand="SELECT * FROM [OYUN]"></asp:SqlDataSource>
        <!--veritabanı bağlama-->
        <div class="nk-gap"></div>
        <div class="nk-carousel nk-carousel-x4" data-autoplay="5000" data-dots="false" data-cell-align="left" data-arrows="true">
            <div class="nk-carousel-inner">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div>
                            <div class="pl-5 pr-5">
                                <div class="nk-product-cat-3">
                                    <a class="nk-product-image" href="ProductDetail.aspx?OYUN_ID=<%#Eval("OYUN_ID") %>">
                                        <img src="<%#Eval("FOTOGRAF") %>" alt="">
                                    </a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="nk-product-cont">
                                        <div class="nk-gap-1"></div>
                                        <h3 class="nk-product-title h5"><a href="ProductDetail.aspx?OYUN_ID=<%#Eval("OYUN_ID") %>"><%#Eval("ADI") %></a></h3>
                                        <div class="nk-gap-1"></div>
                                        <div class="nk-product-price">$ <%#Eval("FIYAT").ToString().TrimEnd('0').TrimEnd(',') %></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>


            </div>
        </div>
        <!-- END: Top 10 Best Sellers -->

        <!-- START: Most Popular -->
        <div class="nk-gap-3"></div>
        <h3 class="nk-decorated-h-2"><span><span class="text-main-1">Most</span> Popular</span></h3>
        <div class="nk-gap"></div>
        <div class="row vertical-gap">
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6">
                <div class="nk-product-cat">
                    <a class="nk-product-image" href="ProductDetail.aspx?OYUN_ID=<%#Eval("OYUN_ID") %>">
                        <img src="<%#Eval("FOTOGRAF") %>" alt="She gave my mother">
                    </a>
                    <div class="nk-product-cont">
                        <h3 class="nk-product-title h5"><a href="ProductDetail.aspx?OYUN_ID=<%#Eval("OYUN_ID") %>""><%#Eval("ADI") %></a></h3>
                        <div class="nk-gap-1"></div>
                        <div class="nk-product-rating" data-rating="3"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></div>
                        <div class="nk-gap-1"></div>
                        <div class="nk-product-price">$ <%#Eval("FIYAT").ToString().TrimEnd('0').TrimEnd(',') %></div>
                    </div>
                </div>
            </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!-- END: Most Popular -->
    </div>

    <div class="nk-gap-2"></div>
</asp:Content>
