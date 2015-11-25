<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MemberToolbarUserControl1.ascx.cs" Inherits="TopCareWebApplication.UserControls.MemberToolbarUserControl1" %>
<table style="border-bottom-style: solid;border-bottom-color: #6699FF;margin-bottom:10px;margin-top:-10px" cellpadding="5">
    <tr>
     <td align="right">
            <asp:ImageButton ID="btnMemberAttendancePayments" 
                ToolTip="Attendance History/Payments" runat="server" 
                ImageUrl="~/images/1406035831_money_gold.png" Height="32px" Width="32px" 
                ValidationGroup="gx" onclick="btnMemberAttendancePayments_Click"  />
        </td>
      <%--  <td align="right">
            <asp:ImageButton ID="btnAttendanceHistory" 
                ToolTip="View Attendance History" runat="server" 
                ImageUrl="~/images/Groups.png" Height="32px" Width="32px" 
                ValidationGroup="gx" onclick="btnAttendanceHistory_Click" />
        </td>--%>
        <td align="right">
            <asp:ImageButton ID="btnSubscriptionFeePaymentHistory" runat="server" 
                ToolTip="View Subscription Fee Payments" ImageUrl="~/images/1406035855_wallet_louis_vuitton_bills.png"
                onclick="ImageButton2_Click" Height="32px" Width="32px" 
                ValidationGroup="gx"/>
        </td>
       <%-- <td align="right">
            <asp:ImageButton ID="ImageButton1" runat="server" ToolTip="Print Loan Statement"
                ImageUrl="~/images/printStatement.png" onclick="ImageButton1_Click" 
                ValidationGroup="gx" />
        </td>
          <td align="right">
            <asp:ImageButton ID="btnSchedule" runat="server" ToolTip="Print Loan Schedule"
                ImageUrl="~/images/printSchedule.png" 
                ValidationGroup="gx" onclick="btnSchedule_Click" />
        </td>--%>
    </tr>
    </table>