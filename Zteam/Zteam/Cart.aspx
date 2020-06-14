<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Zteam.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="nk-store nk-store-cart">
        <div class="table-responsive">

            <!-- START: Products in Cart -->
                    <asp:DataList ID="cartList" runat="server">
                    <ItemTemplate>
                        <table class="table nk-store-cart-products">
                        <tbody>
                        <tr>
                            <td class="nk-product-cart-thumb">
                                <a href="store-product.html" class="nk-image-box-1 nk-post-image">
                                    <img src="<%#Eval("FOTOGRAF") %>" alt="However, I have reason" width="115">
                                </a>
                            </td>
                            <td class="nk-product-cart-title">
                                <h5 class="h6">Product:</h5>
                                <div class="nk-gap-1"></div>

                                <h2 class="nk-post-title h4">
                                    <a href="store-product.html"><%#Eval("ADI") %></a>
                                </h2>
                            </td>
                            <td class="nk-product-cart-price">
                                <h5 class="h6">Price:</h5>
                                <div class="nk-gap-1"></div>

                              <strong>$ <%#Eval("FIYAT") %></strong>
                            </td>
                            <td class="nk-product-cart-quantity">
                                <h5 class="h6">Quantity:</h5>
                                <div class="nk-gap-1"></div>

                                <div class="nk-form">
                                    <input type="number" class="form-control" value="<%#Eval("ADET") %>" min="1" max="21">
                                </div>
                            </td>
                            <td class="nk-product-cart-total">
                                <h5 class="h6">Sub Total:</h5>
                                <div class="nk-gap-1"></div>

                                <strong>$ <%#Eval("ARATOPLAM") %></strong>
                            </td>
                            
                        </tr>
                           
                            </tbody>
                            </table>
                    </ItemTemplate>
                    </asp:DataList>
                

            <!-- END: Products in Cart -->

        </div>
        <div class="clearfix"></div>
        <div class="nk-gap-2"></div>
        <div class="row vertical-gap">
            <div class="col-md-6">

            </div>
            <div class="col-md-6">
                <table class="nk-table nk-table-sm">
                    <tbody>
                        <tr class="nk-store-cart-totals-total">
                            <td>
                                Total
                            </td>
                            <td>
                                $ <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="nk-gap-2"></div>
        <asp:Button ID="btnCheck" class="nk-btn nk-btn-rounded nk-btn-color-main-1 float-right" runat="server" OnClick="btnClick_Event" Text="Proceed to Checkout" />
        <div class="clearfix"></div>
    </div>
</div>

<div class="nk-gap-2"></div>
</asp:Content>
