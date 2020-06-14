<%@ Page Title="" Language="C#" MasterPageFile="~/Member.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Zteam.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentMain" runat="server">


    <h4 class="mb-0"><span class="text-main-1">Sign</span> In</h4>

    <div class="nk-gap-1"></div>

    <div class="row vertical-gap">
        <div class="col-md-6">
            Use email and password:

                           

                                        <div class="nk-gap"></div>
            <%--<input id="mail" type="email" value="" name="email" class=" form-control" placeholder="Email">--%>
            <asp:TextBox ID="mail" type="email" value="" name="email" class=" form-control" placeholder="Email" runat="server"></asp:TextBox>

            <div class="nk-gap"></div>
            <asp:TextBox ID="pass" type="password" value="" name="password" class="required form-control" placeholder="Password" runat="server"></asp:TextBox>
            <%--<input id="pass" type="password" value="" name="password" class="required form-control" placeholder="Password">--%>
        </div>
        <div class="col-md-6">

            <div class="nk-gap"></div>
            <div class="mnt-5">
                <small><a href="Register.aspx">Not a member? Sign up</a></small>
            </div>
        </div>
    </div>

    <div class="nk-gap-1"></div>
    <div class="row vertical-gap">
        <div class="col-md-6">
            <asp:Button ID="btnlogin" class="nk-btn nk-btn-rounded nk-btn-color-white nk-btn-block" runat="server" OnClick="btnLogin_Click" Text="Sign In" />
            <%--<a href="#" id="btnlogin" class="nk-btn nk-btn-rounded nk-btn-color-white nk-btn-block" runat="server" OnClick="btnLogin_Click">Sign In</a>--%>
        </div>

    </div>

</asp:Content>
