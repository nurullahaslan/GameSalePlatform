<%@ Page Title="" Language="C#" MasterPageFile="~/Member.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Zteam.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHeader" runat="server">
    <asp:SqlDataSource ID="ProfileDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GAMES_SALES_PLATFORMConnectionString %>" SelectCommand="SELECT [KULLANICI_ID], [ADI], [EMAIL], [FOTOGRAF], [BAKIYE] FROM [KULLANICI] WHERE ([KULLANICI_ID] = @KULLANICI_ID)">
        <SelectParameters>
            <asp:SessionParameter Name="KULLANICI_ID" SessionField="KULLANICI_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="KULLANICI_ID" DataSourceID="ProfileDataSource" Height="267px" Width="187px">
        
        
        <ItemTemplate>
            <div class="nk-gallery-item-box">
                <a href="#" class="nk-gallery-item" data-size="1200x554">
                    
                    <img src="<%#Eval("FOTOGRAF") %>" alt="">
                </a>
            </div>
            KULLANICI_ID:
                                <asp:Label ID="KULLANICI_IDLabel" runat="server" Text='<%# Eval("KULLANICI_ID") %>' />
            <br />
            ADI:
                                <asp:Label ID="ADILabel" runat="server" Text='<%# Bind("ADI") %>' />
            <br />
            EMAIL:
                                <asp:Label ID="EMAILLabel" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentMain" runat="server">
    <h4 class="mb-0"><span class="text-main-1">Edit Profile</span></h4>

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
            <div class="nk-gap"></div>
            Select File &nbsp;<asp:FileUpload ID="FileUploader" runat="server" />
        </div>
        <div class="col-md-6">
            Type Password : 
            <div class="nk-gap"></div>
            <asp:TextBox ID="pass1" type="password" value="" name="password" class="required form-control" placeholder="Password" runat="server"></asp:TextBox>
            <div class="nk-gap"></div>
            ReType Password :
            <div class="nk-gap"></div>
            <asp:TextBox ID="pass2" type="password" value="" name="password" class="required form-control" placeholder="Password" runat="server"></asp:TextBox>
            <div class="nk-gap"></div>
            <asp:Label ID="lblUpload" runat="server"></asp:Label><br />
        </div>
    </div>

    <div class="nk-gap-1"></div>
    <div class="row vertical-gap">
        <div class="col-md-6">
            <div class="nk-gap"></div>
            <asp:Button ID="btnSave" class="nk-btn nk-btn-rounded nk-btn-color-white nk-btn-block" runat="server" OnClick="btnSave_Click" Text="Save" />
        </div>
        <div class="col-md-6">
            <div class="nk-gap"></div>
            <h4 id="errMsg" class="mb-0" runat="server" visible="false"><span class="text-main-1">Passwords are not correct!</span></h4>
        </div>
    </div>
</asp:Content>
