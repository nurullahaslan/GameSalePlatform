<%@ Page Title="" Language="C#" MasterPageFile="~/Member.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Zteam.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentMain" runat="server">
    <h4 class="mb-0"><span class="text-main-1">Register</span></h4>

    <div class="nk-gap-1"></div>

    <div class="row vertical-gap">
        <div class="col-md-6">
            Type Name :
             <div class="nk-gap"></div>
            <asp:TextBox ID="name" type="name" value="" name="name" class="form-control" placeholder="Name" runat="server"></asp:TextBox>
            <div class="nk-gap"></div>
            Type Email :
             <div class="nk-gap"></div>
            <asp:TextBox ID="mail" type="email" value="" name="email" class="form-control" placeholder="Email" runat="server"></asp:TextBox>
            
        </div>
        <div class="col-md-6">
            Type Password : 
            <div class="nk-gap"></div>
            <asp:TextBox ID="pass1" type="password" value="" name="password" class="required form-control" placeholder="Password" runat="server"></asp:TextBox>
            <div class="nk-gap"></div>
            ReType Password :
            <div class="nk-gap"></div>
            <asp:TextBox ID="pass2" type="password" value="" name="password" class="required form-control" placeholder="Password" runat="server"></asp:TextBox>
        </div>
    </div>

    <div class="nk-gap-1"></div>
    <div class="row vertical-gap">
        <div class="col-md-6">
            <div class="nk-gap"></div>
            <asp:Button ID="btnRegister" class="nk-btn nk-btn-rounded nk-btn-color-white nk-btn-block" runat="server" OnClick="btnRegister_Click" Text="Register" />
        </div>
        <div class="col-md-6">
            <div class="nk-gap"></div>
            <h4 id="errMsg" class="mb-0" runat="server" visible="false"><span class="text-main-1">Passwords are not correct!</span></h4>
        </div>
    </div>
</asp:Content>
