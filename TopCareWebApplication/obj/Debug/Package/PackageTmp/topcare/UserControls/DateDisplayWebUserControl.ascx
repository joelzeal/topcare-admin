<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DateDisplayWebUserControl.ascx.cs" Inherits="TopCareWebApplication.topcare.UserControls.DateDisplayWebUserControl" %>
<link href="../../Styles/dateCtrlCss.css" rel="stylesheet" type="text/css" />
<div style="width:50px;text-align:center" class="mainCtrl">
    <div class="mainTop">
        <asp:Label Text="Nov" runat="server" ID="lblMonth" />
    </div>
    <div style="height:35px;" class="mainMiddle">
        <asp:Label Text="20" runat="server" id="lblDay"/></div>
    <div  class="mainTop">
        <asp:Label Text="2014" runat="server" ID ="lblYear" /></div>
</div>