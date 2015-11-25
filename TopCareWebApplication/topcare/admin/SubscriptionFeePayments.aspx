<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="SubscriptionFeePayments.aspx.cs" Inherits="TopCareWebApplication.admin.SubscriptionFeePayments" %>
<%@ Register src="../UserControls/MemberDetailsToolbarUserControl.ascx" tagname="MemberDetailsToolbarUserControl" tagprefix="uc1" %>
<%@ Register src="../UserControls/MemberToolbarUserControl1.ascx" tagname="MemberToolbarUserControl1" tagprefix="uc2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 112px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td><table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td><h1>Member Subscription Fee Payment - 
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                </h1>
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

<table style="width:100%;">
                <tr>
                    <td class="style1">
                        Amount Paid:
                    </td>
                    <td>
                        <asp:TextBox ID="AmountPaidTextBox" runat="server" CssClass="txtinput"
                            Text='<%# Bind("AmountPaid") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
              
                <tr>
                    <td class="style1">
                        Payment Date:</td>
                    <td>
                        <asp:TextBox ID="PaymentDateTextBox" runat="server" CssClass="txtinput"
                            Text='<%# Bind("AmountPaid") %>' />
                        <asp:CalendarExtender ID="PaymentDate_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd-MMM-yyyy" TargetControlID="PaymentDateTextBox">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
              
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CssClass="buttonGreen"
                            Text="Save" onclick="InsertButton_Click" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="buttonRed"
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>

    <%--<asp:FormView ID="FormView1" runat="server" 
        DataKeyNames="MemberSubscriptionPaidID" 
        DataSourceID="MemberSubscriptionsSqlDataSource" DefaultMode="Insert">
        <EditItemTemplate>
            MemberSubscriptionPaidID:
            <asp:Label ID="MemberSubscriptionPaidIDLabel1" runat="server" 
                Text='<%# Eval("MemberSubscriptionPaidID") %>' />
            <br />
            MemberID:
            <asp:TextBox ID="MemberIDTextBox" runat="server" 
                Text='<%# Bind("MemberID") %>' />
            <br />
            AmountPaid:
            <asp:TextBox ID="AmountPaidTextBox" runat="server" 
                Text='<%# Bind("AmountPaid") %>' />
            <br />
            PaymentDate:
            <asp:TextBox ID="PaymentDateTextBox" runat="server" 
                Text='<%# Bind("PaymentDate") %>' />
            <br />
            PaymentRecievedBy:
            <asp:TextBox ID="PaymentRecievedByTextBox" runat="server" 
                Text='<%# Bind("PaymentRecievedBy") %>' />
            <br />
            CreatedBy:
            <asp:TextBox ID="CreatedByTextBox" runat="server" 
                Text='<%# Bind("CreatedBy") %>' />
            <br />
            CreatedDate:
            <asp:TextBox ID="CreatedDateTextBox" runat="server" 
                Text='<%# Bind("CreatedDate") %>' />
            <br />
            ModifiedBy:
            <asp:TextBox ID="ModifiedByTextBox" runat="server" 
                Text='<%# Bind("ModifiedBy") %>' />
            <br />
            ModifiedDate:
            <asp:TextBox ID="ModifiedDateTextBox" runat="server" 
                Text='<%# Bind("ModifiedDate") %>' />
            <br />
            SubscriptionYearID:
            <asp:TextBox ID="SubscriptionYearIDTextBox" runat="server" 
                Text='<%# Bind("SubscriptionYearID") %>' />
            <br />
            IsOpen:
            <asp:CheckBox ID="IsOpenCheckBox" runat="server" 
                Checked='<%# Bind("IsOpen") %>' />
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
                        Amount Paid:
                    </td>
                    <td>
                        <asp:TextBox ID="AmountPaidTextBox" runat="server" CssClass="txtinput"
                            Text='<%# Bind("AmountPaid") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Year:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="UnPaidSubscriptionYearsSqlDataSource" DataTextField="Description" 
                            DataValueField="SubscriptionYearID" 
                            SelectedValue='<%# Bind("SubscriptionYearID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="UnPaidSubscriptionYearsSqlDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                            SelectCommand="SELECT SubscriptionYearID, Description FROM SubscriptionYears WHERE (SubscriptionYearID NOT IN (SELECT SubscriptionYearID FROM MemberSubscriptionsPaid WHERE (MemberID = @MemberID)))">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="MemberID" QueryStringField="mid" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CssClass="button"
                            CommandName="Insert" Text="Save" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="button"
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            MemberSubscriptionPaidID:
            <asp:Label ID="MemberSubscriptionPaidIDLabel" runat="server" 
                Text='<%# Eval("MemberSubscriptionPaidID") %>' />
            <br />
            MemberID:
            <asp:Label ID="MemberIDLabel" runat="server" Text='<%# Bind("MemberID") %>' />
            <br />
            AmountPaid:
            <asp:Label ID="AmountPaidLabel" runat="server" 
                Text='<%# Bind("AmountPaid") %>' />
            <br />
            PaymentDate:
            <asp:Label ID="PaymentDateLabel" runat="server" 
                Text='<%# Bind("PaymentDate") %>' />
            <br />
            PaymentRecievedBy:
            <asp:Label ID="PaymentRecievedByLabel" runat="server" 
                Text='<%# Bind("PaymentRecievedBy") %>' />
            <br />
            CreatedBy:
            <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>' />
            <br />
            CreatedDate:
            <asp:Label ID="CreatedDateLabel" runat="server" 
                Text='<%# Bind("CreatedDate") %>' />
            <br />
            ModifiedBy:
            <asp:Label ID="ModifiedByLabel" runat="server" 
                Text='<%# Bind("ModifiedBy") %>' />
            <br />
            ModifiedDate:
            <asp:Label ID="ModifiedDateLabel" runat="server" 
                Text='<%# Bind("ModifiedDate") %>' />
            <br />
            SubscriptionYearID:
            <asp:Label ID="SubscriptionYearIDLabel" runat="server" 
                Text='<%# Bind("SubscriptionYearID") %>' />
            <br />
            IsOpen:
            <asp:CheckBox ID="IsOpenCheckBox" runat="server" 
                Checked='<%# Bind("IsOpen") %>' Enabled="false" />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>--%>
    <asp:SqlDataSource ID="MemberSubscriptionsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        DeleteCommand="DELETE FROM [MemberSubscriptionsPaid] WHERE [MemberSubscriptionPaidID] = @MemberSubscriptionPaidID" 
        
        SelectCommand="SELECT * FROM [MemberSubscriptionsPaid] WHERE ([MemberID] = @MemberID) ORDER BY PaymentDate desc" 
        
        UpdateCommand="UPDATE [MemberSubscriptionsPaid] SET [MemberID] = @MemberID, [AmountPaid] = @AmountPaid, [PaymentDate] = @PaymentDate, [PaymentRecievedBy] = @PaymentRecievedBy, [CreatedBy] = @CreatedBy, [CreatedDate] = @CreatedDate, [ModifiedBy] = @ModifiedBy, [ModifiedDate] = @ModifiedDate, [SubscriptionYearID] = @SubscriptionYearID, [IsOpen] = @IsOpen WHERE [MemberSubscriptionPaidID] = @MemberSubscriptionPaidID">
        <DeleteParameters>
            <asp:Parameter Name="MemberSubscriptionPaidID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:QueryStringParameter Name="MemberID" QueryStringField="mid" Type="Int32" />
            <asp:Parameter Name="AmountPaid" />
            <asp:SessionParameter Name="PaymentRecievedBy" SessionField="CurrentUser" />
            <asp:SessionParameter DefaultValue="" Name="CreatedBy" 
                SessionField="CurrentUser" />
            <asp:Parameter Name="ModifiedBy" />
            <asp:Parameter Name="ModifiedDate" />
            <asp:Parameter Name="SubscriptionYearID" />
            <asp:Parameter Name="IsOpen" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberID" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MemberID" Type="Int32" />
            <asp:Parameter Name="AmountPaid" Type="Decimal" />
            <asp:Parameter Name="PaymentDate" Type="DateTime" />
            <asp:Parameter Name="PaymentRecievedBy" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="ModifiedDate" Type="DateTime" />
            <asp:Parameter Name="SubscriptionYearID" Type="Int32" />
            <asp:Parameter Name="IsOpen" Type="Boolean" />
            <asp:Parameter Name="MemberSubscriptionPaidID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" Width="100%" 
        AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="MemberSubscriptionPaidID" 
        DataSourceID="MemberSubscriptionsSqlDataSource" ForeColor="#333333" 
        GridLines="None" EmptyDataText="No subscrition fee paid ">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="MemberSubscriptionPaidID" 
                HeaderText="MemberSubscriptionPaidID" InsertVisible="False" ReadOnly="True" 
                SortExpression="MemberSubscriptionPaidID" Visible="False" />
            <asp:BoundField DataField="MemberID" HeaderText="MemberID" 
                SortExpression="MemberID" Visible="False" />
            <asp:TemplateField HeaderText="Payment Date" SortExpression="PaymentDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PaymentDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%# Bind("PaymentDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="AmountPaid" HeaderText="Amount Paid" 
                SortExpression="AmountPaid">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="PaymentRecievedBy" HeaderText="Payment Recieved By" 
                SortExpression="PaymentRecievedBy">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="SubscriptionYearID" HeaderText="SubscriptionYearID" 
                SortExpression="SubscriptionYearID" Visible="False" />
            <asp:TemplateField HeaderText="Expiry Date" SortExpression="ExpiryDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ExpiryDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ExpiryDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
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
</asp:Content>
