<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RSVPWebUserControl.ascx.cs"
    Inherits="TopCareWebApplication.topcare.UserControls.RSVPWebUserControl" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<style type="text/css">
    .style2
    {
    }
    .style3
    {
        width: 80px;
    }
    .style4
    {
    }
    .style5
    {
        width: 177px;
    }
    
       .style6
    {
        width: 68px;
    }
    
    
</style>
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
        <asp:LinkButton ID="lbtnBookTransport" runat="server" 
            onclick="lbtnBookTransport_Click">Book Transport</asp:LinkButton>
        <asp:ModalPopupExtender ID="lbtnBookTransport_ModalPopupExtender" 
            runat="server" DynamicServicePath="" Enabled="True"  CancelControlID="closeImg" DropShadow="true"  PopupControlID="Panel1"
            TargetControlID="lbtnBookTransport">
        </asp:ModalPopupExtender>
    </asp:View>
    <asp:View ID="View2" runat="server">
        <table style="width: 317px">
            <tr>
                <td class="style3">
                    &nbsp;<img alt="Transport" src="../../images/SUV.png" width="60px" />
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td>
                                Pick up:
                                <asp:Label ID="lblPickup" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Drop off:
                                <asp:Label ID="lblDropOff" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                   
                        <asp:LinkButton ID="lbtnEdit" runat="server" onclick="lbtnEdit_Click">Edit</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp; <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Cancel Booking</asp:LinkButton>
                   
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View3" runat="server">
      
        <table style="width:100%;">
            <tr>
                <td class="style6">
                    Pick up:</td>
                <td class="style5">
                    <asp:TextBox ID="txtPickup" runat="server" width="90px" CssClass="txtinput"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    Drop off:</td>
                <td class="style5">
                    <asp:TextBox ID="txtDropOff" runat="server" width="90px" CssClass="txtinput"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4" colspan="2">
                    <asp:LinkButton ID="lbtnSave" runat="server" CssClass="button" 
                        onclick="lbtnSave_Click" ValidationGroup="vgInsert">Save</asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbtnCancel" runat="server" CssClass="button" 
                        onclick="lbtnCancel_Click">Cancel</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
      
    </asp:View>
</asp:MultiView>
<asp:HiddenField ID="UserNameHiddenField" runat="server" />

<%--<asp:Panel ID="Panel1" runat="server" CssClass="panelStyle" Width="600px">
<table class="panelStyleHeader" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:Label ID="lblHeaderText" runat="server" Text="Label" 
                    style="font-weight: 700">Transport Arrangement</asp:Label>
            </td>
            <td align="right" style="width:40px">
                <img alt="Close" id="closeImg" class="style1" 
                    src="../images/CloseButton.png" />
            </td>
        </tr>
    </table>
</asp:Panel>--%>

