<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="ScheduleListUpcoming.aspx.cs" Inherits="TopCareWebApplication.admin.ScheduleListUpcoming" %>
<%@ Register src="../UserControls/SchedulesToolbarUserControl1.ascx" tagname="SchedulesToolbarUserControl1" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td ><h1>Upcoming Schedules List</h1>
            </td>
            <td style="width:100px" align="right">
                <uc1:SchedulesToolbarUserControl1 ID="SchedulesToolbarUserControl11" 
                    runat="server" />
            </td>
        </tr>
    </table>
<hr />
 
    <a id="A1" href="ScheduleList_MultiView.aspx" class="button" runat="server"  >Show all schedules</a>
    <br />
    <br />
    <asp:GridView ID="GridView1" Width="100%" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ScheduleID" 
        DataSourceID="AllSchedulesSqlDataSource" ForeColor="Black" 
        GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" 
        BorderStyle="Solid" BorderWidth="1px">
        <Columns>
         <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Delete" 
                        Height="32px" ImageUrl="~/images/delete.png" 
                        onclientclick="return confirm('Are you sure you want to delete?');" 
                        Width="32px" />
                </ItemTemplate>
                <HeaderStyle Width="20px" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:TemplateField>
             
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" ToolTip="Go to attendance register"
                        ImageUrl="~/images/attendanceCheck.png" 
                        NavigateUrl='<%# Eval("ScheduleID", "~/topcare/admin/AttendanceCheck.aspx?sID={0}") %>' 
                        Text="Attendance Check"></asp:HyperLink>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="50px" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:TemplateField>
             <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink100" runat="server" ToolTip="Print schedule"
                        ImageUrl="~/images/printStatement.png" 
                        NavigateUrl='<%# Eval("ScheduleID", "~/topcare/ReportPages/ScheduleDetails.aspx?sID={0}") %>' 
                        Text="Attendance Check"></asp:HyperLink>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="50px" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:BoundField DataField="ScheduleID" HeaderText="ScheduleID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ScheduleID" 
                Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="ScheduleID" 
                DataNavigateUrlFormatString="~/topcare/admin/ScheduleDetails.aspx?sID={0}" 
                DataTextField="DateOfEvent" DataTextFormatString="{0:d}" HeaderText="Date" 
                NavigateUrl="~/topcare/admin/ScheduleDetails.aspx">
            <HeaderStyle HorizontalAlign="Left" Width="100px" />
            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:HyperLinkField>
             
            <asp:BoundField DataField="MealsToBeServed" HeaderText="MealsToBeServed" 
                SortExpression="MealsToBeServed" Visible="False" />
            <asp:TemplateField HeaderText="Program Title" SortExpression="ProgramTitle">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProgramTitle") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" style="font-weight: 700" 
                        Text='<%# Bind("ProgramTitle") %>'></asp:Label>
                    <asp:HiddenField ID="HiddenField1" runat="server" 
                        Value='<%# Eval("ScheduleID") %>' />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                        CellPadding="4" DataKeyNames="ScheduleDetailID" 
                        DataSourceID="ScheduleDetailsSqlDataSource" ForeColor="Black" 
                        GridLines="Horizontal" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="ScheduleDetailID" HeaderText="ScheduleDetailID" 
                                InsertVisible="False" ReadOnly="True" SortExpression="ScheduleDetailID" 
                                Visible="False" />
                            <asp:BoundField DataField="StartTime" HeaderText="From" 
                                SortExpression="StartTime">
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EndTime" HeaderText="To" SortExpression="EndTime">
                            <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Item" HeaderText="Activity" SortExpression="Item">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ScheduleID" HeaderText="ScheduleID" 
                                SortExpression="ScheduleID" Visible="False" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BorderStyle="None" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="ScheduleDetailsSqlDataSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                        SelectCommand="SELECT * FROM [ScheduleDetails] WHERE ([ScheduleID] = @ScheduleID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="HiddenField1" Name="ScheduleID" 
                                PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="MealsToBeServed" HeaderText="Menu" 
                SortExpression="MealsToBeServed">
            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:BoundField>
             
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#506272" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>

    <asp:SqlDataSource ID="AllSchedulesSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        SelectCommand="SELECT ScheduleID, DateOfEvent, MealsToBeServed, ProgramTitle, PaymentExpected FROM Schedules WHERE (cast (DateOfEvent as date) &gt;= cast( GetDate() as Date)) ORDER BY DateOfEvent" 
        onselecting="AllSchedulesSqlDataSource_Selecting" 
        DeleteCommand="DELETE FROM Schedules WHERE (ScheduleID = @ScheduleID)">
        <DeleteParameters>
            <asp:Parameter Name="ScheduleID" />
        </DeleteParameters>
    </asp:SqlDataSource>
    cast(dbo.Contributions.CreatedDate as date)
</asp:Content>
