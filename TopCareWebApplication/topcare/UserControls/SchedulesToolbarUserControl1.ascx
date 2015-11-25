<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SchedulesToolbarUserControl1.ascx.cs" Inherits="TopCareWebApplication.UserControls.SchedulesToolbarUserControl1" %>
<table style="border-bottom-style: solid;border-bottom-color: #6699FF;margin-bottom:10px;margin-top:-10px" cellpadding="5">
    <tr>
        <td>
            <asp:ImageButton ID="ImageButton4" ToolTip="Add new Schedule" runat="server" 
                ImageUrl="~/images/AddLoan.png" 
                ValidationGroup="gx" onclick="ImageButton4_Click" />
        </td>
     <%--   <td align="right">
            <asp:ImageButton ID="ImageButton3" ToolTip="Veiw current and upcoming schedules" runat="server" 
                ImageUrl="~/images/Groups.png" onclick="ImageButton3_Click" Height="32px" Width="32px" 
                ValidationGroup="gx" />
        </td>
        <td align="right">
            <asp:ImageButton ID="ImageButton2" runat="server" 
                ToolTip="View all schedules" ImageUrl="~/images/Groups.png"
                onclick="ImageButton2_Click" Height="32px" Width="32px" 
                ValidationGroup="gx"/>
        </td>--%>
        <%-- <td align="right">
            <asp:ImageButton ID="btnPrintSchedule" runat="server" 
                ToolTip="Print schedules" ImageUrl="~/images/printSchedule.png"
                onclick="ImageButton2_Click" Height="32px" Width="32px" 
                ValidationGroup="gx"/>
        </td>--%>
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