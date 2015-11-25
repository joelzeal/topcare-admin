<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="ScheduleList.aspx.cs" Inherits="TopCareWebApplication.admin.ScheduleList" %>
<%@ Register src="../UserControls/SchedulesToolbarUserControl1.ascx" tagname="SchedulesToolbarUserControl1" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td ><h1>All Schedule List</h1>
            </td>
            <td style="width:100px">
                <uc1:SchedulesToolbarUserControl1 ID="SchedulesToolbarUserControl11" 
                    runat="server" />
            </td>
        </tr>
    </table>
<hr />
   <%-- <a href="ScheduleListUpcoming.aspx" class="button" runat="server" >Show only current and upcoming schedules</a>
    <br />
    <br />--%>
    <asp:GridView ID="GridView1" Width="100%" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ScheduleID" 
        DataSourceID="AllSchedulesSqlDataSource" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
         <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Text="Delete" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </asp:TemplateField>
             
            <asp:BoundField DataField="ScheduleID" HeaderText="ScheduleID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ScheduleID" 
                Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="ScheduleID" 
                DataNavigateUrlFormatString="~/topcare/admin/ScheduleDetails.aspx?sID={0}" 
                DataTextField="DateOfEvent" DataTextFormatString="{0:d}" HeaderText="Date" 
                NavigateUrl="~/topcare/admin/ScheduleDetails.aspx">
            <HeaderStyle HorizontalAlign="Left" Width="200px" />
            </asp:HyperLinkField>
             
            <asp:BoundField DataField="MealsToBeServed" HeaderText="MealsToBeServed" 
                SortExpression="MealsToBeServed" Visible="False" />
            <asp:BoundField DataField="ProgramTitle" HeaderText="Program Title" 
                SortExpression="ProgramTitle">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
             
            <asp:HyperLinkField DataNavigateUrlFields="ScheduleID" 
                DataNavigateUrlFormatString="~/topcare/admin/AttendanceCheck.aspx?sID={0}" 
                NavigateUrl="~/topcare/admin/AttendanceCheck.aspx" Text="Attendance Check">
            <HeaderStyle HorizontalAlign="Left" Width="150px" />
            </asp:HyperLinkField>
             
        </Columns>
        <EditRowStyle BackColor="#999999" />
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

    <asp:SqlDataSource ID="AllSchedulesSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        SelectCommand="SELECT * FROM [Schedules] ORDER BY [DateOfEvent]" 
        onselecting="AllSchedulesSqlDataSource_Selecting" 
        DeleteCommand="DELETE FROM Schedules WHERE (ScheduleID = @ScheduleID)">
        <DeleteParameters>
            <asp:Parameter Name="ScheduleID" />
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>
