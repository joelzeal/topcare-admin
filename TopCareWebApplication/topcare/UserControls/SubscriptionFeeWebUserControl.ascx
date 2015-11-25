<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubscriptionFeeWebUserControl.ascx.cs"
    Inherits="TopCareWebApplication.UserControls.SubscriptionFeeWebUserControl" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<style type="text/css">
    .style2
    {
        width: 51px;
    }
    .style3
    {
        width: 75px;
    }
    .style4
    {
        width: 48px;
        height: 48px;
    }
    .style5
    {
        width: 177px;
    }
</style>
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
        <asp:LinkButton ID="btnEnterPayment" runat="server" 
            onclick="btnEnterPayment_Click">Enter Subscription</asp:LinkButton>
    </asp:View>
    <asp:View ID="View2" runat="server">
        <table>
            <tr>
                <td class="style2">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/check_green.png" />
                </td>
                <td>
                Subscription Paid
                    <%--<asp:Label ID="lblPaidAmount" runat="server" Text="Label"></asp:Label><br />
                    <asp:LinkButton ID="lbtnEdit" runat="server" onclick="lbtnEdit_Click" 
                        style="font-size: x-small">Edit</asp:LinkButton>--%>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View3" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="style3">
                    Amount:</td>
                <td class="style5">
                    <asp:TextBox ID="TextBox2" CssClass="txtInput" runat="server"></asp:TextBox>
                    <%--<asp:FilteredTextBoxExtender ID="TextBox2_FilteredTextBoxExtender" 
                        runat="server" Enabled="True" TargetControlID="TextBox2" ValidChars="+-=/*().">
                    </asp:FilteredTextBoxExtender>--%>
                </td>
                <td>
                    <asp:CheckBox ID="chkWaived" runat="server" AutoPostBack="True" 
                        oncheckedchanged="chkWaived_CheckedChanged" Text="Waive" />
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style5">
                    <asp:LinkButton ID="LinkButton1" CssClass="button" runat="server" 
                        onclick="LinkButton1_Click">Save</asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="button"  runat="server">Cancel</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View4" runat="server">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <img alt="Waived" class="style4" 
                        src="../images/check_yellow.png" />
                </td>
                <td>
                    &nbsp; Waived
                </td>
            </tr>
        </table>
    </asp:View>

</asp:MultiView>