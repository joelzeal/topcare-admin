<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="AttendanceHistory.aspx.cs" Inherits="TopCareWebApplication.admin.AttendanceHistory" %>
<%@ Register src="../UserControls/MemberDetailsToolbarUserControl.ascx" tagname="MemberDetailsToolbarUserControl" tagprefix="uc1" %>
<%@ Register src="../UserControls/MemberToolbarUserControl1.ascx" tagname="MemberToolbarUserControl1" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td><table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td><h1>Member Attendance History - </h1>
            </td>
             <td><h1><uc1:MemberDetailsToolbarUserControl ID="MemberDetailsToolbarUserControl1" 
        runat="server" /></h1>
            </td>
        </tr>
    </table>
            </td>
            <td align="right">
                
                <uc2:MemberToolbarUserControl1 ID="MemberToolbarUserControl11" runat="server" />
                
            </td>
        </tr>
    </table>
    
<hr />
    <asp:GridView ID="GridView1" Width="100%" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MemberAttendanceID" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
        EmptyDataText="Member hasn't attended any club sessions">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Schedule Date" SortExpression="DateOfEvent">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateOfEvent") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Bind("DateOfEvent", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="MemberAttendanceID" HeaderText="MemberAttendanceID" 
                InsertVisible="False" ReadOnly="True" SortExpression="MemberAttendanceID" 
                Visible="False" />
            <asp:BoundField DataField="ScheduleID" HeaderText="ScheduleID" 
                SortExpression="ScheduleID" Visible="False" />
            <asp:BoundField DataField="MemberID" HeaderText="MemberID" 
                SortExpression="MemberID" Visible="False" />
            <asp:CheckBoxField DataField="HasAttended" HeaderText="HasAttended" 
                SortExpression="HasAttended" Visible="False" />
            <asp:CheckBoxField DataField="HasPaid" HeaderText="Has Paid" 
                SortExpression="HasPaid">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:CheckBoxField>
            <asp:BoundField DataField="AmountPaid" HeaderText="Amount Paid" 
                SortExpression="AmountPaid">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="PaymentRecievedBy" HeaderText="Payment Recieved By" 
                SortExpression="PaymentRecievedBy">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="PaymentMethodID" HeaderText="PaymentMethodID" 
                SortExpression="PaymentMethodID" Visible="False" />
            <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" 
                SortExpression="PaymentDate">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Narration" HeaderText="Narration" 
                SortExpression="Narration" Visible="False" />
            <asp:BoundField DataField="IsFeeWaived" HeaderText="Is Fee Waived" 
                SortExpression="IsFeeWaived">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <EmptyDataRowStyle Font-Italic="True" HorizontalAlign="Center" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        
        SelectCommand="SELECT MemberAttendance.MemberAttendanceID, MemberAttendance.ScheduleID, MemberAttendance.MemberID, MemberAttendance.HasAttended, MemberAttendance.HasPaid, MemberAttendance.AmountPaid, MemberAttendance.PaymentRecievedBy, MemberAttendance.PaymentMethodID, MemberAttendance.PaymentDate, MemberAttendance.Narration, Schedules.DateOfEvent, MemberAttendance.IsFeeWaived FROM Schedules INNER JOIN MemberAttendance ON Schedules.ScheduleID = MemberAttendance.ScheduleID WHERE (MemberAttendance.MemberID = @MemberID) AND (MemberAttendance.HasAttended = 1) ORDER BY Schedules.DateOfEvent">
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberID" QueryStringField="mid" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
