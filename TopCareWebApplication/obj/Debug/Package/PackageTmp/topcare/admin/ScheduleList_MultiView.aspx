<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true"
    CodeBehind="ScheduleList_MultiView.aspx.cs" Inherits="TopCareWebApplication.admin.ScheduleList_MultiView" %>

<%@ Register Src="../UserControls/SchedulesToolbarUserControl1.ascx" TagName="SchedulesToolbarUserControl1"
    TagPrefix="uc1" %>
<%@ Register src="../UserControls/DateDisplayWebUserControl.ascx" tagname="DateDisplayWebUserControl" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <h1>
                    All Schedules
                </h1>
            </td>
            <td style="width: 100px" align="right">
                <uc1:SchedulesToolbarUserControl1 ID="SchedulesToolbarUserControl11" runat="server" />
            </td>
        </tr>
    </table>
    <hr />
    <a href="ScheduleListUpcoming.aspx" class="button" runat="server">Show only current
        and upcoming schedules</a>
    <br />
    <br />
    <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="ScheduleID" DataSourceID="AllSchedulesSqlDataSource"
        ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC"
        BorderStyle="Solid" BorderWidth="1px" onrowcreated="GridView1_RowCreated">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Delete" Height="32px"
                        ImageUrl="~/images/delete.png" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Width="32px" />
                </ItemTemplate>
                <HeaderStyle Width="20px" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" ToolTip="Go to attendance register"
                        ImageUrl="~/images/attendanceCheck.png" NavigateUrl='<%# Eval("ScheduleID", "~/topcare/admin/AttendanceCheck.aspx?sID={0}") %>'
                        Text="Attendance Check"></asp:HyperLink>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="35px" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink100" runat="server" ToolTip="Print schedule" ImageUrl="~/images/printStatement.png"
                        NavigateUrl='<%# Eval("ScheduleID", "~/topcare/ReportPages/ScheduleDetails.aspx?sID={0}") %>'
                        Text="Attendance Check"></asp:HyperLink>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="35px" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:TemplateField>

             <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1231" runat="server" ToolTip="Go to attendance register"
                        ImageUrl="~/images/telephoneRed.png"  NavigateUrl='<%# Eval("ScheduleID", "~/topcare/admin/WeeklyClientFollowup.aspx?sID={0}") %>'
                        Text="Attendance Check"></asp:HyperLink>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="35px" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:TemplateField>


            <asp:BoundField DataField="ScheduleID" HeaderText="ScheduleID" InsertVisible="False"
                ReadOnly="True" SortExpression="ScheduleID" Visible="False" />
            <asp:TemplateField HeaderText="Date">
                <ItemTemplate>
                   <%-- <asp:HyperLink ID="HyperLink2" runat="server" 
                        NavigateUrl='<%# Eval("ScheduleID", "~/topcare/admin/NewSchedule.aspx?sID={0}") %>' 
                        Text='<%# Eval("DateOfEvent", "{0:d}") %>'></asp:HyperLink>--%>
                    <a style="text-decoration:none;" href='<%# Eval("ScheduleID", "NewSchedule.aspx?sID={0}") %>'><uc2:DateDisplayWebUserControl TheDate='<%# Bind("DateOfEvent") %>' ID="DateDisplayWebUserControl1" runat="server" /></a>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="60px" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:BoundField DataField="MealsToBeServed_New" HeaderText="MealsToBeServed" SortExpression="MealsToBeServed_New"
                Visible="False" />
            <asp:TemplateField HeaderText="Program Title" SortExpression="ProgramTitle">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProgramTitle") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Style="font-weight: 700" Text='<%# Bind("ProgramTitle") %>'></asp:Label>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("ScheduleID") %>' />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" DataKeyNames="ScheduleDetailID"
                        DataSourceID="ScheduleDetailsSqlDataSource" ForeColor="Black" GridLines="Horizontal"
                        Width="100%">
                        <Columns>
                            <asp:BoundField DataField="ScheduleDetailID" HeaderText="ScheduleDetailID" InsertVisible="False"
                                ReadOnly="True" SortExpression="ScheduleDetailID" Visible="False" />
                            <asp:BoundField DataField="StartTime" HeaderText="From" SortExpression="StartTime">
                                <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EndTime" HeaderText="To" SortExpression="EndTime">
                                <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Item" HeaderText="Activity" SortExpression="Item">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ScheduleID" HeaderText="ScheduleID" SortExpression="ScheduleID"
                                Visible="False" />
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
                    <asp:SqlDataSource ID="ScheduleDetailsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>"
                        SelectCommand="SELECT * FROM [ScheduleDetails] WHERE ([ScheduleID] = @ScheduleID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="HiddenField1" Name="ScheduleID" PropertyName="Value"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Menu" SortExpression="MealsToBeServed_New">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" BorderStyle="None" Height="100px" 
                        ReadOnly="True" Text='<%# Bind("MealsToBeServed_New") %>' TextMode="MultiLine" 
                        Width="250px"></asp:TextBox>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" 
                        Text='<%# Bind("MealsToBeServed_New") %>'></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
            </asp:TemplateField>
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
    <asp:SqlDataSource ID="AllSchedulesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>"
        SelectCommand="SELECT * FROM [Schedules] ORDER BY [DateOfEvent] DESC" OnSelecting="AllSchedulesSqlDataSource_Selecting"
        DeleteCommand="DELETE FROM Schedules WHERE (ScheduleID = @ScheduleID)">
        <DeleteParameters>
            <asp:Parameter Name="ScheduleID" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
