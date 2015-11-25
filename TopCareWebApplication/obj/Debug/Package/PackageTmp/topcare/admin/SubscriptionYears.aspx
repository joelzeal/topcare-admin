<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="SubscriptionYears.aspx.cs" Inherits="TopCareWebApplication.admin.SubscriptionYears" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Subscription Years<asp:ToolkitScriptManager ID="ToolkitScriptManager1" 
        runat="server">
    </asp:ToolkitScriptManager>
    </h1>
<hr />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="SubscriptionYearID" 
        DataSourceID="subscriptionsYearsSqlDataSource" DefaultMode="Insert">
        <EditItemTemplate>
            SubscriptionYearID:
            <asp:Label ID="SubscriptionYearIDLabel1" runat="server" 
                Text='<%# Eval("SubscriptionYearID") %>' />
            <br />
            Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            CreatedBy:
            <asp:TextBox ID="CreatedByTextBox" runat="server" 
                Text='<%# Bind("CreatedBy") %>' />
            <br />
            CreatedDate:
            <asp:TextBox ID="CreatedDateTextBox" runat="server" 
                Text='<%# Bind("CreatedDate") %>' />
            <br />
            YearStartDate:
            <asp:TextBox ID="YearStartDateTextBox" runat="server" 
                Text='<%# Bind("YearStartDate") %>' />
            <br />
            YearEndDate:
            <asp:TextBox ID="YearEndDateTextBox" runat="server" 
                Text='<%# Bind("YearEndDate") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td>
                        Year:
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" CssClass="txtinput"
                            Text='<%# Bind("Description") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Year Start Date:
                    </td>
                    <td>
                        <asp:TextBox ID="YearStartDateTextBox" runat="server" CssClass="txtinput"
                            Text='<%# Bind("YearStartDate") %>' />
                        <asp:CalendarExtender ID="YearStartDateTextBox_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="YearStartDateTextBox">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Year End Date:
                    </td>
                    <td>
                        <asp:TextBox ID="YearEndDateTextBox" runat="server" CssClass="txtinput"
                            Text='<%# Bind("YearEndDate") %>' />
                        <asp:CalendarExtender ID="YearEndDateTextBox_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="YearEndDateTextBox">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CssClass="buttonGreen"
                            CommandName="Insert" Text="Save" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="buttonRed"
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            SubscriptionYearID:
            <asp:Label ID="SubscriptionYearIDLabel" runat="server" 
                Text='<%# Eval("SubscriptionYearID") %>' />
            <br />
            Description:
            <asp:Label ID="DescriptionLabel" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            CreatedBy:
            <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>' />
            <br />
            CreatedDate:
            <asp:Label ID="CreatedDateLabel" runat="server" 
                Text='<%# Bind("CreatedDate") %>' />
            <br />
            YearStartDate:
            <asp:Label ID="YearStartDateLabel" runat="server" 
                Text='<%# Bind("YearStartDate") %>' />
            <br />
            YearEndDate:
            <asp:Label ID="YearEndDateLabel" runat="server" 
                Text='<%# Bind("YearEndDate") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="subscriptionsYearsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        DeleteCommand="DELETE FROM [SubscriptionYears] WHERE [SubscriptionYearID] = @SubscriptionYearID" 
        InsertCommand="INSERT INTO [SubscriptionYears] ([Description], [CreatedBy], [CreatedDate], [YearStartDate], [YearEndDate]) VALUES (@Description, @CreatedBy, @CreatedDate, @YearStartDate, @YearEndDate)" 
        SelectCommand="SELECT * FROM [SubscriptionYears] ORDER BY [SubscriptionYearID]" 
        
        UpdateCommand="UPDATE [SubscriptionYears] SET [Description] = @Description, [CreatedBy] = @CreatedBy, [CreatedDate] = @CreatedDate, [YearStartDate] = @YearStartDate, [YearEndDate] = @YearEndDate WHERE [SubscriptionYearID] = @SubscriptionYearID">
        <DeleteParameters>
            <asp:Parameter Name="SubscriptionYearID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter DbType="Date" Name="CreatedDate" />
            <asp:Parameter DbType="Date" Name="YearStartDate" />
            <asp:Parameter DbType="Date" Name="YearEndDate" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter DbType="Date" Name="CreatedDate" />
            <asp:Parameter DbType="Date" Name="YearStartDate" />
            <asp:Parameter DbType="Date" Name="YearEndDate" />
            <asp:Parameter Name="SubscriptionYearID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="SubscriptionYearID" DataSourceID="subscriptionsYearsSqlDataSource" 
        ForeColor="#333333" GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
            <HeaderStyle Width="80px" />
            </asp:CommandField>
            <asp:BoundField DataField="SubscriptionYearID" HeaderText="SubscriptionYearID" 
                InsertVisible="False" ReadOnly="True" SortExpression="SubscriptionYearID" 
                Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Year" 
                SortExpression="Description">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="YearStartDate" HeaderText="Year Start Date" 
                SortExpression="YearStartDate">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="YearEndDate" HeaderText="Year End Date" 
                SortExpression="YearEndDate">
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
</asp:Content>
