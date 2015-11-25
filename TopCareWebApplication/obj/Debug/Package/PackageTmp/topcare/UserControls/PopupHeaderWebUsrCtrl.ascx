<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupHeaderWebUsrCtrl.ascx.cs" Inherits="TopCareWebApplication.topcare.UserControls.PopupHeaderWebUsrCtrl" %>
<style type="text/css">
    .style1
    {
        width: 32px;
        height: 32px;
    }
    
    .panelStyle
    {
        padding:10px;
        }
</style>
<asp:Panel ID="Panel1" runat="server" CssClass="panelStyle" >
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:Label ID="lblHeaderText" runat="server" Text="Label"></asp:Label>
            </td>
            <td align="right" style="width:40px">
                <img alt="Close" class="style1" 
                    src="../images/CloseButton.png" />
            </td>
        </tr>
    </table>

</asp:Panel>

