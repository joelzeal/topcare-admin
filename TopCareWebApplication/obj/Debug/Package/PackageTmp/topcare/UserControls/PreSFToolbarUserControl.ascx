<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PreSFToolbarUserControl.ascx.cs" Inherits="TopCareWebApplication.UserControls.PreSFToolbarUserControl" %>
<table style="border-bottom-style: solid;border-bottom-color: #6699FF;margin-bottom:10px;margin-top:-10px" cellpadding="5">
    <tr>
        <td>
            <asp:ImageButton ID="btnPrintPreSchedule" ToolTip="Add new Schedule" runat="server" 
                ImageUrl="~/images/printStatement.png" 
                ValidationGroup="gx" onclick="btnPrintPreSchedule_Click"  />
        </td>
      <td align="right">
            <asp:ImageButton ID="btnScheduleDetails" ToolTip="Veiw schedules details" runat="server" 
                ImageUrl="~/images/Groups.png"  Height="32px" Width="32px" 
                ValidationGroup="gx" onclick="btnScheduleDetails_Click" />
        </td>
         <td align="right">
            <asp:ImageButton ID="btnAttendanceCheck" runat="server" 
                ToolTip="View attendance register" ImageUrl="~/images/attendanceCheck.png"
                 Height="32px" Width="32px" 
                ValidationGroup="gx" onclick="btnAttendanceCheck_Click"/>
        </td>
         <td align="right">
            <asp:ImageButton ID="btnPreSFDetails" runat="server" 
                ToolTip="Print schedules" ImageUrl="~/images/telephoneRed.png"
                Height="32px" Width="32px" 
                ValidationGroup="gx" onclick="btnPreSFDetails_Click"/>
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