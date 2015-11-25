<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" validateRequest="false"    CodeBehind="EmailReport.aspx.cs" Inherits="TopCareWebApplication.topcare.admin.EmailReport" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 112px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Email Programme Outline<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </h1>
    <hr />

    <table style="width: 100%;">
        <tr>
            <td class="style1" valign="top">
                &nbsp;
                Recipients:</td>
            <td>
                &nbsp;
                <asp:TextBox ID="txtRecipients" runat="server" CssClass="txtinput"  Height="80px" 
                    TextMode="MultiLine" Width="600px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
                Subject:</td>
            <td>
                &nbsp;
                <asp:TextBox ID="txtSubject" runat="server" CssClass="txtinput" Width="600px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1" valign="top">
                &nbsp;&nbsp;Attachments:&nbsp;</td>
            <td>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblAttachedFile" runat="server" Text="Label" 
                    style="text-decoration: underline; color: #0000CC; font-style: italic"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" valign="top">
                &nbsp;
                Body:</td>
            <td>
                &nbsp;
                <asp:TextBox ID="txtBody" runat="server" CssClass="txtinput" Height="120px" 
                    TextMode="MultiLine" Width="717px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1" valign="top">
                &nbsp;</td>
            <td>
                &nbsp;
                <asp:RadioButton ID="rbtnSendNow" runat="server" Checked="True" 
                    GroupName="EmailTime" Text="Send Now" 
                    oncheckedchanged="rbtnSendNow_CheckedChanged" Visible="False" />
&nbsp;
                <asp:RadioButton ID="RadioButton2" runat="server" 
                    GroupName="EmailTime" 
                    Text="Send Later - This option is beta and is being tested. Might not work as expected just yet." 
                    oncheckedchanged="RadioButton2_CheckedChanged" Visible="False" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" valign="top">
                &nbsp; </td>
            <td>
                &nbsp;&nbsp;<asp:LinkButton ID="btnSend" Text="Send" CssClass="buttonGreen" 
                    runat="server" onclick="btnSend_Click" />
                     &nbsp;<asp:LinkButton ID="btnCancel" Text="Cancel" CssClass="buttonRed" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" valign="top">
                &nbsp;</td>
            <td>
                &nbsp;&nbsp;<asp:TextBox ID="txtSendDate" runat="server" CssClass="txtinput" 
                    Visible="False"></asp:TextBox>
                <asp:CalendarExtender ID="txtSendDate_CalendarExtender" runat="server" 
                    Enabled="True" Format="dd-MMM-yyyy" TargetControlID="txtSendDate">
                </asp:CalendarExtender>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </asp:Content>
