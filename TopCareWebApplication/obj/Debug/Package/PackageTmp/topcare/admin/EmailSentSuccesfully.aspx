<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true"
    CodeBehind="EmailSentSuccesfully.aspx.cs" Inherits="TopCareWebApplication.topcare.admin.EmailSentSuccesfully" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="alert alert-success" runat="server" id="divContainer">
        <a class="close" data-dismiss="alert">×</a> <strong>Well done!</strong>
        <br />
        <asp:Label ID="lblMessage" runat="server" />
    </div>
</asp:Content>
