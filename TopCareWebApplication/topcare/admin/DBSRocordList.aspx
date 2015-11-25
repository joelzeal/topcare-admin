<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="DBSRocordList.aspx.cs" Inherits="TopCareWebApplication.topcare.admin.DBSRocordList" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 87px;
        }
        .style2
        {
            width: 87px;
            height: 3px;
        }
        .style3
        {
            height: 3px;
        }
        .style4
        {
            width: 344px;
        }
        .style5
        {
            height: 3px;
            width: 344px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>DBS Certified Staff<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </h1>
    <hr />
    <asp:FormView ID="FormView1" Width="100%" runat="server" 
        DataKeyNames="DBSStaffID" DataSourceID="DBSStaffSqlDataSource" 
        DefaultMode="Insert">
        <EditItemTemplate>
            DBSStaffID:
            <asp:Label ID="DBSStaffIDLabel1" runat="server" 
                Text='<%# Eval("DBSStaffID") %>' />
            <br />
            FirstName:
            <asp:TextBox ID="FirstNameTextBox" runat="server" 
                Text='<%# Bind("FirstName") %>' />
            <br />
            LastName:
            <asp:TextBox ID="LastNameTextBox" runat="server" 
                Text='<%# Bind("LastName") %>' />
            <br />
            IssueDate:
            <asp:TextBox ID="IssueDateTextBox" runat="server" 
                Text='<%# Bind("IssueDate") %>' />
            <br />
            DBSNumber:
            <asp:TextBox ID="DBSNumberTextBox" runat="server" 
                Text='<%# Bind("DBSNumber") %>' />
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
                        First Name:</td>
                    <td class="style4">
                        <asp:TextBox ID="FirstNameTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("FirstName") %>' />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="FirstNameTextBox" ErrorMessage="First name is required" 
                            ForeColor="Red" ValidationGroup="DBSvg"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Last Name:</td>
                    <td class="style4">
                        <asp:TextBox ID="LastNameTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("LastName") %>' />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="LastNameTextBox" ErrorMessage="Last name is required" 
                            ForeColor="Red" ValidationGroup="DBSvg"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Email:</td>
                    <td class="style4">
                        <asp:TextBox ID="EmailAddressTextBox" runat="server" AutoCompleteType="Email" 
                            CssClass="txtinput" Text='<%# Bind("EmailAddress") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Issue Date:</td>
                    <td class="style4">
                        <asp:TextBox ID="IssueDateTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("IssueDate") %>' />
                        <asp:CalendarExtender ID="IssueDateTextBox_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd-MMM-yyyy" TargetControlID="IssueDateTextBox">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="IssueDateTextBox" ErrorMessage="Issue date is required" 
                            ForeColor="Red" ValidationGroup="DBSvg"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        DBS Number:
                    </td>
                    <td class="style4">
                        <asp:TextBox ID="DBSNumberTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("DBSNumber") %>' />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="DBSNumberTextBox" ErrorMessage="DBS number is required" 
                            ForeColor="Red" ValidationGroup="DBSvg"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                    </td>
                    <td class="style5">
                    </td>
                    <td class="style3">
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="style4">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" CssClass="buttonGreen" Text="Save" 
                            ValidationGroup="DBSvg" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" CssClass="buttonRed" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            DBSStaffID:
            <asp:Label ID="DBSStaffIDLabel" runat="server" 
                Text='<%# Eval("DBSStaffID") %>' />
            <br />
            FirstName:
            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
            <br />
            LastName:
            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
            <br />
            IssueDate:
            <asp:Label ID="IssueDateLabel" runat="server" Text='<%# Bind("IssueDate") %>' />
            <br />
            DBSNumber:
            <asp:Label ID="DBSNumberLabel" runat="server" Text='<%# Bind("DBSNumber") %>' />
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
    <asp:GridView ID="GridView1" Width="100%" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" 
        DataKeyNames="DBSStaffID" DataSourceID="DBSStaffSqlDataSource" 
        EmptyDataText="No records found">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                        CommandName="Edit" ImageUrl="~/images/edit.png" Text="Edit" />
                </ItemTemplate>
                <EditItemTemplate >
                    <div style="text-align:right"><asp:ImageButton ID="ImageButton14" runat="server" CausesValidation="True" 
                        CommandName="Update" Height="20px" ImageUrl="~/images/save.png" Text="Update" />
                    &nbsp;<asp:ImageButton ID="ImageButton25" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Height="20px" ImageUrl="~/images/cancel.png" 
                        Text="Cancel" />
                    </div>
                    
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DBSStaffID" HeaderText="DBSStaffID" 
                InsertVisible="False" ReadOnly="True" SortExpression="DBSStaffID" 
                Visible="False" />
            <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="txtinput" 
                        Text='<%# Bind("FirstName") %>' Width="300px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txtinput" 
                        Text='<%# Bind("LastName") %>' Width="300px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="EmailAddress" HeaderText="Email" 
                SortExpression="EmailAddress">
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Issue Date" SortExpression="IssueDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="txtinput" 
                        Text='<%# Bind("IssueDate", "{0:d}") %>' Width="150px"></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" 
                        Enabled="True" Format="dd-MMM-yyyy" TargetControlID="TextBox3">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("IssueDate", "{0:dd-MMM-yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DBS Number" SortExpression="DBSNumber">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="txtinput" 
                        Text='<%# Bind("DBSNumber") %>' Width="200px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("DBSNumber") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <EmptyDataRowStyle Font-Italic="True" />
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
    <asp:SqlDataSource ID="DBSStaffSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        DeleteCommand="DELETE FROM [DBSSTaff] WHERE [DBSStaffID] = @DBSStaffID" 
        InsertCommand="INSERT INTO DBSSTaff(FirstName, LastName, IssueDate, DBSNumber, EmailAddress) VALUES (@FirstName, @LastName, @IssueDate, @DBSNumber, @EmailAddress)" 
        SelectCommand="SELECT * FROM [DBSSTaff] ORDER BY [FirstName], [LastName]" 
        
        UpdateCommand="UPDATE DBSSTaff SET FirstName = @FirstName, LastName = @LastName, IssueDate = @IssueDate, DBSNumber = @DBSNumber, EmailAddress = @EmailAddress WHERE (DBSStaffID = @DBSStaffID)">
        <DeleteParameters>
            <asp:Parameter Name="DBSStaffID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter DbType="Date" Name="IssueDate" />
            <asp:Parameter Name="DBSNumber" Type="String" />
            <asp:Parameter Name="EmailAddress" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter DbType="Date" Name="IssueDate" />
            <asp:Parameter Name="DBSNumber" Type="String" />
            <asp:Parameter Name="DBSStaffID" Type="Int32" />
            <asp:Parameter Name="EmailAddress" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
