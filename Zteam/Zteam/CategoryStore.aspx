<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CategoryStore.aspx.cs" Inherits="Zteam.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nk-main">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GAMES_SALES_PLATFORMConnectionString %>" SelectCommand="SELECT * FROM [OYUN] inner join ICERIR on OYUN.OYUN_ID=ICERIR.OYUN_ID inner join KATEGORILER on ICERIR.KATEGORI_ID=KATEGORILER.KATEGORI_ID WHERE (ICERIR.KATEGORI_ID = @KATEGORI_ID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="KATEGORI_ID" QueryStringField="KATEGORI_ID" Type="Int32" />
                                </SelectParameters>
                    </asp:SqlDataSource>
        <!-- START: Breadcrumbs -->
        <div class="nk-gap-1"></div>
        <div class="container">
            <ul class="nk-breadcrumbs">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <li><span><%#Eval("TUR") %></span></li>
                    </ItemTemplate>
                </asp:Repeater>
                
            </ul>
        </div>
    </div>
    <div class="nk-gap-1"></div>
    <!-- END: Breadcrumbs -->

    <div class="container">
                   
   
        <!-- START: Most Popular -->
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
