<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="NewAddonService.aspx.cs" Inherits="TopCareWebApplication.topcare.admin.NewAddonService" %>
<%@ Register assembly="DropDownChosen" namespace="CustomDropDown" tagprefix="ucc" %>
<%@ Register src="../UserControls/TimePickerWebUserControl_New.ascx" tagname="TimePickerWebUserControl_New" tagprefix="uc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .style1
        {
            width: 114px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Record Addon Service</h1>
<hr />

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="AddonServiceID" 
        DataSourceID="AddonServicesSqlDataSource" DefaultMode="Insert">
        <EditItemTemplate>
            <table border="0" cellpadding="0" cellspacing="5" width="100%">
                <tr>
                    <td class="style1">
                        Member:
                    </td>
                    <td>
                        <ucc:DropDownListChosen ID="cboMember" runat="server" 
                            DataSourceID="MembersSqlDataSource" DataTextField="Name" 
                            DataValueField="MemberID" DisableSearchThreshold="10" 
                            SelectedValue='<%# Bind("MemberId") %>'>
                        </ucc:DropDownListChosen>
                        <asp:SqlDataSource ID="MembersSqlDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                            SelectCommand="SELECT [MemberID], [FirstName] + ' ' + [LastName] as Name FROM [Members] ORDER BY [FirstName]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Service Type:
                    </td>
                    <td>
                        <asp:DropDownList ID="cboServiceType" runat="server" 
                            DataSourceID="AddonServiceTypesSqlDataSource" DataTextField="Description" 
                            DataValueField="AddonServiceTypeId" 
                            SelectedValue='<%# Bind("AddonServiceTypeId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="AddonServiceTypesSqlDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                            SelectCommand="SELECT [AddonServiceTypeId], [Description] FROM [AddonServiceTypes] ORDER BY [Description]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Responsible Staff
                    </td>
                    <td>
                        <asp:DropDownList ID="cboDBSStaff" runat="server" 
                            DataSourceID="DBSStaffSqlDataSource" DataTextField="StaffName" 
                            DataValueField="DBSStaffID" SelectedValue='<%# Bind("StaffID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="DBSStaffSqlDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                            SelectCommand="SELECT [DBSStaffID], [FirstName] + ' ' + [LastName] as StaffName FROM [DBSSTaff]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Date:</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("ServiceDate") %>'></asp:TextBox>
                        <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="TextBox1">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td class="style1" valign="top">
                        Comments
                    </td>
                    <td valign="top">
                        <asp:TextBox ID="txtComments" runat="server" CssClass="txtinput" Height="142px" 
                            Text='<%# Bind("Comments") %>' TextMode="MultiLine" Width="371px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1" valign="top">
                        &nbsp;</td>
                    <td valign="top">
                        <asp:LinkButton ID="btnSave" runat="server" CommandName="Insert" 
                            CssClass="buttonGreen" onclick="btnSave_Click">Save</asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" 
                            CssClass="buttonRed">Cancel</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table border="0" cellpadding="0" cellspacing="5" width="100%">
                <tr>
                    <td class="style1">
                        Member:
                    </td>
                    <td>
                        <ucc:DropDownListChosen ID="cboMember" runat="server" 
                            DataSourceID="MembersSqlDataSource" DataTextField="Name" 
                            DataValueField="MemberID" DisableSearchThreshold="10" 
                            SelectedValue='<%# Bind("MemberId") %>'>
                        </ucc:DropDownListChosen>
                        <asp:SqlDataSource ID="MembersSqlDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                            SelectCommand="SELECT [MemberID], [FirstName] + ' ' + [LastName] as Name FROM [Members] ORDER BY [FirstName]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Service Type:
                    </td>
                    <td>
                        <asp:DropDownList ID="cboServiceType" runat="server" 
                            DataSourceID="AddonServiceTypesSqlDataSource" DataTextField="Description" 
                            DataValueField="AddonServiceTypeId" 
                            SelectedValue='<%# Bind("AddonServiceTypeId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="AddonServiceTypesSqlDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                            SelectCommand="SELECT [AddonServiceTypeId], [Description] FROM [AddonServiceTypes] ORDER BY [Description]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Responsible Staff
                    </td>
                    <td>
                        <asp:DropDownList ID="cboDBSStaff" runat="server" 
                            DataSourceID="DBSStaffSqlDataSource" DataTextField="StaffName" 
                            DataValueField="DBSStaffID" SelectedValue='<%# Bind("StaffID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="DBSStaffSqlDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                            SelectCommand="SELECT [DBSStaffID], [FirstName] + ' ' + [LastName] as StaffName FROM [DBSSTaff]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Date:</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("ServiceDate") %>'></asp:TextBox>
                        <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="TextBox1">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td class="style1" valign="top">
                        Comments
                    </td>
                    <td valign="top">
                        <asp:TextBox ID="txtComments" runat="server" CssClass="txtinput" Height="142px" 
                            Text='<%# Bind("Comments") %>' TextMode="MultiLine" Width="371px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1" valign="top">
                        &nbsp;</td>
                    <td valign="top">
                        <asp:LinkButton ID="btnSave" runat="server" CommandName="Insert" 
                            CssClass="buttonGreen" onclick="btnSave_Click">Save</asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" 
                            CssClass="buttonRed">Cancel</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            AddonServiceID:
            <asp:Label ID="AddonServiceIDLabel" runat="server" 
                Text='<%# Eval("AddonServiceID") %>' />
            <br />
            AddonServiceTypeId:
            <asp:Label ID="AddonServiceTypeIdLabel" runat="server" 
                Text='<%# Bind("AddonServiceTypeId") %>' />
            <br />
            ServiceDate:
            <asp:Label ID="ServiceDateLabel" runat="server" 
                Text='<%# Bind("ServiceDate") %>' />
            <br />
            StaffID:
            <asp:Label ID="StaffIDLabel" runat="server" Text='<%# Bind("StaffID") %>' />
            <br />
            CreatedDate:
            <asp:Label ID="CreatedDateLabel" runat="server" 
                Text='<%# Bind("CreatedDate") %>' />
            <br />
            CreatedBy:
            <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>' />
            <br />
            ModifiedDate:
            <asp:Label ID="ModifiedDateLabel" runat="server" 
                Text='<%# Bind("ModifiedDate") %>' />
            <br />
            ModifiedBy:
            <asp:Label ID="ModifiedByLabel" runat="server" 
                Text='<%# Bind("ModifiedBy") %>' />
            <br />
            MemberId:
            <asp:Label ID="MemberIdLabel" runat="server" Text='<%# Bind("MemberId") %>' />
            <br />
            Comments:
            <asp:Label ID="CommentsLabel" runat="server" Text='<%# Bind("Comments") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="AddonServicesSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        DeleteCommand="DELETE FROM [AddonServices] WHERE [AddonServiceID] = @AddonServiceID" 
        InsertCommand="INSERT INTO [AddonServices] ([AddonServiceTypeId], [ServiceDate], [StaffID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MemberId], [Comments]) VALUES (@AddonServiceTypeId, @ServiceDate, @StaffID, @CreatedDate, @CreatedBy, @ModifiedDate, @ModifiedBy, @MemberId, @Comments)" 
        SelectCommand="SELECT * FROM [AddonServices]" 
        UpdateCommand="UPDATE [AddonServices] SET [AddonServiceTypeId] = @AddonServiceTypeId, [ServiceDate] = @ServiceDate, [StaffID] = @StaffID, [CreatedDate] = @CreatedDate, [CreatedBy] = @CreatedBy, [ModifiedDate] = @ModifiedDate, [ModifiedBy] = @ModifiedBy, [MemberId] = @MemberId, [Comments] = @Comments WHERE [AddonServiceID] = @AddonServiceID">
        <DeleteParameters>
            <asp:Parameter Name="AddonServiceID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="AddonServiceTypeId" Type="Int32" />
            <asp:Parameter Name="ServiceDate" Type="DateTime" />
            <asp:Parameter Name="StaffID" Type="Int32" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="MemberId" Type="Int32" />
            <asp:Parameter Name="Comments" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="AddonServiceTypeId" Type="Int32" />
            <asp:Parameter Name="ServiceDate" Type="DateTime" />
            <asp:Parameter Name="StaffID" Type="Int32" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="MemberId" Type="Int32" />
            <asp:Parameter Name="Comments" Type="String" />
            <asp:Parameter Name="AddonServiceID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
