<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="ScheduleDetails.aspx.cs" Inherits="TopCareWebApplication.admin.ScheduleDetails" %>
<%@ Register src="../UserControls/TimePickerWebUserControl_New.ascx" tagname="TimePickerWebUserControl_New" tagprefix="uc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register src="../UserControls/ScheduleDetailsToolbarUserControl1.ascx" tagname="ScheduleDetailsToolbarUserControl1" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td><h1>
        
     <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
                Schedule Details - 
            </td> 
            <td>  <asp:FormView ID="FormView2" runat="server" DataKeyNames="ScheduleID" 
            DataSourceID="ScheduleSqlDataSource">
            <EditItemTemplate>
                ScheduleID:
                <asp:Label ID="ScheduleIDLabel1" runat="server" 
                    Text='<%# Eval("ScheduleID") %>' />
                <br />
                DateOfEvent:
                <asp:TextBox ID="DateOfEventTextBox" runat="server" 
                    Text='<%# Bind("DateOfEvent") %>' />
                <br />
                MealsToBeServed:
                <asp:TextBox ID="MealsToBeServedTextBox" runat="server" 
                    Text='<%# Bind("MealsToBeServed") %>' />
                <br />
                ProgramTitle:
                <asp:TextBox ID="ProgramTitleTextBox" runat="server" 
                    Text='<%# Bind("ProgramTitle") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                DateOfEvent:
                <asp:TextBox ID="DateOfEventTextBox" runat="server" 
                    Text='<%# Bind("DateOfEvent") %>' />
                <br />
                MealsToBeServed:
                <asp:TextBox ID="MealsToBeServedTextBox" runat="server" 
                    Text='<%# Bind("MealsToBeServed") %>' />
                <br />
                ProgramTitle:
                <asp:TextBox ID="ProgramTitleTextBox" runat="server" 
                    Text='<%# Bind("ProgramTitle") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="DateOfEventLabel" runat="server" 
                    Text='<%# Eval("DateOfEvent", "{0:d}") %>' />
                &nbsp;(<asp:Label ID="ProgramTitleLabel" runat="server" 
                    Text='<%# Bind("ProgramTitle") %>' />
                )<br />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="ScheduleSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
            SelectCommand="SELECT * FROM [Schedules] WHERE ([ScheduleID] = @ScheduleID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ScheduleID" QueryStringField="sID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
            </td>
        </tr>
    </table>
   
      </h1>
            </td>
            <td align="right">
                <uc2:ScheduleDetailsToolbarUserControl1 ID="ScheduleDetailsToolbarUserControl11" 
                    runat="server" />
            </td>
        </tr>
    </table>
    
    <hr />
    <asp:SqlDataSource ID="ScheduleDetailsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        DeleteCommand="DELETE FROM [ScheduleDetails] WHERE [ScheduleDetailID] = @ScheduleDetailID" 
        InsertCommand="INSERT INTO [ScheduleDetails] ([Item], [ScheduleID], [StartTime], [EndTime]) VALUES (@Item, @ScheduleID, @StartTime, @EndTime)" 
        SelectCommand="SELECT * FROM ScheduleDetails WHERE (ScheduleID = @ScheduleID) ORDER BY StartTime" 
        
        
        UpdateCommand="UPDATE [ScheduleDetails] SET [Item] = @Item, [StartTime] = @StartTime, [EndTime] = @EndTime WHERE [ScheduleDetailID] = @ScheduleDetailID">
        <DeleteParameters>
            <asp:Parameter Name="ScheduleDetailID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Item" Type="String" />
            <asp:QueryStringParameter Name="ScheduleID" QueryStringField="sID" 
                Type="Int32" />
            <asp:Parameter DbType="Time" Name="StartTime" />
            <asp:Parameter DbType="Time" Name="EndTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ScheduleID" QueryStringField="sID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Item" Type="String" />
            <asp:Parameter DbType="Time" Name="StartTime" />
            <asp:Parameter DbType="Time" Name="EndTime" />
            <asp:Parameter Name="ScheduleDetailID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

       <asp:FormView ID="FormView1" runat="server" DataKeyNames="ScheduleDetailID" 
        DataSourceID="ScheduleDetailsSqlDataSource" DefaultMode="Insert" 
        Width="516px">
           <EditItemTemplate>
               ScheduleDetailID:
               <asp:Label ID="ScheduleDetailIDLabel1" runat="server" 
                   Text='<%# Eval("ScheduleDetailID") %>' />
               <br />
               Item:
               <asp:TextBox ID="ItemTextBox" runat="server" Text='<%# Bind("Item") %>' />
               <br />
               ScheduleID:
               <asp:TextBox ID="ScheduleIDTextBox" runat="server" 
                   Text='<%# Bind("ScheduleID") %>' />
               <br />
               StartTime:
               <asp:TextBox ID="StartTimeTextBox" runat="server" 
                   Text='<%# Bind("StartTime") %>' />
               <br />
               EndTime:
               <asp:TextBox ID="EndTimeTextBox" runat="server" Text='<%# Bind("EndTime") %>' />
               <br />
               <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                   CommandName="Update" Text="Update" />
               &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                   CausesValidation="False" CommandName="Cancel" Text="Cancel" />
           </EditItemTemplate>
           <InsertItemTemplate>

               <table style="width:100%;">
                <tr>
                    <td class="style1">
                        Start Time:</td>
                    <td>
                        <%--<asp:TextBox ID="StartTimeTextBox" runat="server" CssClass="txtinput"
                            Text='<%# Bind("StartTime") %>' />--%>
                        <uc1:TimePickerWebUserControl_New ID="TimePickerWebUserControl_New1" 
                            runat="server" EventTime='<%# Bind("StartTime") %>'  />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        End Time:</td>
                    <td>
                        <uc1:TimePickerWebUserControl_New ID="TimePickerWebUserControl_New2" 
                            runat="server" EventTime='<%# Bind("EndTime") %>'  />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Item:
                    </td>
                    <td>
                        
                        <asp:TextBox ID="TextBox1" runat="server"  CssClass="txtinput" 
                            Text='<%# Bind("Item") %>' Height="100px" TextMode="MultiLine" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CssClass="buttonGreen"
                             Text="Save" CommandName="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" CssClass="buttonRed" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
           </InsertItemTemplate>
           <ItemTemplate>
               ScheduleDetailID:
               <asp:Label ID="ScheduleDetailIDLabel" runat="server" 
                   Text='<%# Eval("ScheduleDetailID") %>' />
               <br />
               Item:
               <asp:Label ID="ItemLabel" runat="server" Text='<%# Bind("Item") %>' />
               <br />
               ScheduleID:
               <asp:Label ID="ScheduleIDLabel" runat="server" 
                   Text='<%# Bind("ScheduleID") %>' />
               <br />
               StartTime:
               <asp:Label ID="StartTimeLabel" runat="server" Text='<%# Bind("StartTime") %>' />
               <br />
               EndTime:
               <asp:Label ID="EndTimeLabel" runat="server" Text='<%# Bind("EndTime") %>' />
               <br />
               <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                   CommandName="Edit" Text="Edit" />
               &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                   CommandName="Delete" Text="Delete" />
               &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                   CommandName="New" Text="New" />
           </ItemTemplate>
    </asp:FormView>
            <br />
            <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ScheduleDetailID" 
        DataSourceID="ScheduleDetailsSqlDataSource" ForeColor="#333333" 
        GridLines="None" Width="100%" EmptyDataText="No items added">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
            <HeaderStyle Width="50px" />
            </asp:CommandField>
            <asp:BoundField DataField="ScheduleDetailID" HeaderText="ScheduleDetailID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ScheduleDetailID" 
                Visible="False" />
            <asp:BoundField DataField="ScheduleID" HeaderText="ScheduleID" 
                SortExpression="ScheduleID" Visible="False" />
            <asp:BoundField DataField="StartTime" HeaderText="Start Time" 
                SortExpression="StartTime">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="EndTime" HeaderText="End Time" 
                SortExpression="EndTime">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br />
</asp:Content>
