<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="MemberFeePaymentForSch.aspx.cs" Inherits="TopCareWebApplication.admin.MemberFeePaymentForSch" %>
<%@ Register src="../UserControls/MemberDetailsToolbarUserControl.ascx" tagname="MemberDetailsToolbarUserControl" tagprefix="uc1" %>
<%@ Register src="../UserControls/MemberToolbarUserControl1.ascx" tagname="MemberToolbarUserControl1" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 96px;
        }
        .style2
        {
            height: 44px;
        }
        .style3
        {
            height: 35px;
        }
        .style4
        {
            width: 96px;
            height: 39px;
        }
        .style5
        {
            height: 39px;
        }
        .style6
        {
            height: 44px;
            width: 134px;
        }
        .style7
        {
            height: 35px;
            width: 134px;
        }
        .style8
        {
            width: 134px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td><table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td><h1>Weekly Fee Payment/Attendance History - </h1>
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

    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
        onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
        <asp:ListItem>Pay for a day</asp:ListItem>
        <asp:ListItem>Pay for a period</asp:ListItem>
    </asp:RadioButtonList>
    <hr />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MemberAttendanceID" 
        DataSourceID="SchedulePaymentSqlDataSource" DefaultMode="Insert" 
        Width="658px" Visible="False" oniteminserted="FormView1_ItemInserted">
        <EditItemTemplate>
            MemberAttendanceID:
            <asp:Label ID="MemberAttendanceIDLabel1" runat="server" 
                Text='<%# Eval("MemberAttendanceID") %>' />
            <br />
            ScheduleID:
            <asp:TextBox ID="ScheduleIDTextBox" runat="server" 
                Text='<%# Bind("ScheduleID") %>' />
            <br />
            MemberID:
            <asp:TextBox ID="MemberIDTextBox" runat="server" 
                Text='<%# Bind("MemberID") %>' />
            <br />
            HasAttended:
            <asp:CheckBox ID="HasAttendedCheckBox" runat="server" 
                Checked='<%# Bind("HasAttended") %>' />
            <br />
            HasPaid:
            <asp:CheckBox ID="HasPaidCheckBox" runat="server" 
                Checked='<%# Bind("HasPaid") %>' />
            <br />
            AmountPaid:
            <asp:TextBox ID="AmountPaidTextBox" runat="server" 
                Text='<%# Bind("AmountPaid") %>' />
            <br />
            PaymentRecievedBy:
            <asp:TextBox ID="PaymentRecievedByTextBox" runat="server" 
                Text='<%# Bind("PaymentRecievedBy") %>' />
            <br />
            PaymentMethodID:
            <asp:TextBox ID="PaymentMethodIDTextBox" runat="server" 
                Text='<%# Bind("PaymentMethodID") %>' />
            <br />
            PaymentDate:
            <asp:TextBox ID="PaymentDateTextBox" runat="server" 
                Text='<%# Bind("PaymentDate") %>' />
            <br />
            Narration:
            <asp:TextBox ID="NarrationTextBox" runat="server" 
                Text='<%# Bind("Narration") %>' />
            <br />
            IsFeeWaived:
            <asp:CheckBox ID="IsFeeWaivedCheckBox" runat="server" 
                Checked='<%# Bind("IsFeeWaived") %>' />
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
                        Schedule</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SchedulesUnpaidSqlDataSource" DataTextField="Description" 
                            DataValueField="ScheduleID" SelectedValue='<%# Bind("ScheduleID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SchedulesUnpaidSqlDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                            
                            
                            SelectCommand="SELECT CONVERT (varchar, Schedules.DateOfEvent) + ' - ' + Schedules.ProgramTitle AS Description, Schedules.ScheduleID FROM Schedules LEFT OUTER JOIN MemberAttendance ON Schedules.ScheduleID = MemberAttendance.ScheduleID WHERE (MemberAttendance.HasPaid = 0) AND (MemberAttendance.IsFeeWaived = 0) AND (MemberAttendance.MemberID = @MemberID) OR (Schedules.ScheduleID NOT IN (SELECT ScheduleID FROM MemberAttendance AS MemberAttendance_1 WHERE (MemberID = @MemberID)))">
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
                        Amount Paid:</td>
                    <td>
                        <asp:TextBox ID="AmountPaidTextBox" CssClass="txtinput" runat="server" 
                            Text='<%# Bind("AmountPaid") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style4">
                    </td>
                    <td class="style5">
                        <asp:CheckBox ID="CheckBox1" runat="server" 
                            Checked='<%# Bind("IsFeeWaived") %>' Text="Waive" />
                    </td>
                    <td class="style5">
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="InsertButton" CssClass="buttonGreen" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Save" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="buttonRed"
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            MemberAttendanceID:
            <asp:Label ID="MemberAttendanceIDLabel" runat="server" 
                Text='<%# Eval("MemberAttendanceID") %>' />
            <br />
            ScheduleID:
            <asp:Label ID="ScheduleIDLabel" runat="server" 
                Text='<%# Bind("ScheduleID") %>' />
            <br />
            MemberID:
            <asp:Label ID="MemberIDLabel" runat="server" Text='<%# Bind("MemberID") %>' />
            <br />
            HasAttended:
            <asp:CheckBox ID="HasAttendedCheckBox" runat="server" 
                Checked='<%# Bind("HasAttended") %>' Enabled="false" />
            <br />
            HasPaid:
            <asp:CheckBox ID="HasPaidCheckBox" runat="server" 
                Checked='<%# Bind("HasPaid") %>' Enabled="false" />
            <br />
            AmountPaid:
            <asp:Label ID="AmountPaidLabel" runat="server" 
                Text='<%# Bind("AmountPaid") %>' />
            <br />
            PaymentRecievedBy:
            <asp:Label ID="PaymentRecievedByLabel" runat="server" 
                Text='<%# Bind("PaymentRecievedBy") %>' />
            <br />
            PaymentMethodID:
            <asp:Label ID="PaymentMethodIDLabel" runat="server" 
                Text='<%# Bind("PaymentMethodID") %>' />
            <br />
            PaymentDate:
            <asp:Label ID="PaymentDateLabel" runat="server" 
                Text='<%# Bind("PaymentDate") %>' />
            <br />
            Narration:
            <asp:Label ID="NarrationLabel" runat="server" Text='<%# Bind("Narration") %>' />
            <br />
            IsFeeWaived:
            <asp:CheckBox ID="IsFeeWaivedCheckBox" runat="server" 
                Checked='<%# Bind("IsFeeWaived") %>' Enabled="false" />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>

    <asp:Panel runat="server" ID="pnlMultiPayments" Visible="False">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="style6" valign="top">
                Unpaid Schedules:
                </td>
                <td class="style2" valign="top">
                <div style="border-radius:4px;background:#C2E4EB">
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                        DataSourceID="SchedulesUnpaidSqlDataSource1" DataTextField="Description" 
                        DataValueField="ScheduleID" BackColor="Transparent" Width="343px">
                    </asp:CheckBoxList></div>
                    <asp:SqlDataSource ID="SchedulesUnpaidSqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                        
                        
                        SelectCommand="SELECT CONVERT (varchar, Schedules.DateOfEvent) + ' - ' + Schedules.ProgramTitle AS Description, Schedules.ScheduleID FROM Schedules LEFT OUTER JOIN MemberAttendance ON Schedules.ScheduleID = MemberAttendance.ScheduleID WHERE (MemberAttendance.HasPaid = 0) AND (MemberAttendance.IsFeeWaived = 0) AND (MemberAttendance.MemberID = @MemberID) OR (Schedules.ScheduleID NOT IN (SELECT ScheduleID FROM MemberAttendance AS MemberAttendance_1 WHERE (MemberID = @MemberID)))">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="MemberID" QueryStringField="mid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Amount Paid</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox2" CssClass="txtinput" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td>
                    <asp:LinkButton ID="LinkButton1" CssClass="buttonGreen" runat="server" 
                        onclick="LinkButton1_Click">Save</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="LinkButton2" CssClass="buttonRed" runat="server">Cancel</asp:LinkButton>
                </td>
            </tr>
        </table>
        <br />
    </asp:Panel>

    <asp:SqlDataSource ID="SchedulePaymentSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        DeleteCommand="DELETE FROM [MemberAttendance] WHERE [MemberAttendanceID] = @MemberAttendanceID" 
        InsertCommand="INSERT INTO [MemberAttendance] ([ScheduleID], [MemberID], [HasAttended], [HasPaid], [AmountPaid], [PaymentRecievedBy], [PaymentMethodID], [PaymentDate], [Narration], [IsFeeWaived]) VALUES (@ScheduleID, @MemberID, @HasAttended, 1, @AmountPaid, @PaymentRecievedBy, @PaymentMethodID, GetDate(), @Narration, @IsFeeWaived)" 
        SelectCommand="SELECT * FROM [MemberAttendance] WHERE ([MemberID] = @MemberID)" 
        
        UpdateCommand="UPDATE [MemberAttendance] SET [ScheduleID] = @ScheduleID, [MemberID] = @MemberID, [HasAttended] = @HasAttended, [HasPaid] = @HasPaid, [AmountPaid] = @AmountPaid, [PaymentRecievedBy] = @PaymentRecievedBy, [PaymentMethodID] = @PaymentMethodID, [PaymentDate] = @PaymentDate, [Narration] = @Narration, [IsFeeWaived] = @IsFeeWaived WHERE [MemberAttendanceID] = @MemberAttendanceID">
        <DeleteParameters>
            <asp:Parameter Name="MemberAttendanceID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ScheduleID" Type="Int32" />
            <asp:QueryStringParameter Name="MemberID" QueryStringField="mid" Type="Int32" />
            <asp:Parameter Name="HasAttended" />
            <asp:Parameter Name="AmountPaid" />
            <asp:Parameter Name="PaymentRecievedBy" />
            <asp:Parameter Name="PaymentMethodID" />
            <asp:Parameter Name="Narration" />
            <asp:Parameter Name="IsFeeWaived" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberID" QueryStringField="mid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ScheduleID" Type="Int32" />
            <asp:Parameter Name="MemberID" Type="Int32" />
            <asp:Parameter Name="HasAttended" Type="Boolean" />
            <asp:Parameter Name="HasPaid" Type="Boolean" />
            <asp:Parameter Name="AmountPaid" Type="Decimal" />
            <asp:Parameter Name="PaymentRecievedBy" Type="String" />
            <asp:Parameter Name="PaymentMethodID" Type="Int32" />
            <asp:Parameter Name="PaymentDate" Type="DateTime" />
            <asp:Parameter Name="Narration" Type="String" />
            <asp:Parameter Name="IsFeeWaived" Type="Boolean" />
            <asp:Parameter Name="MemberAttendanceID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" Width="100%" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MemberAttendanceID" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
        EmptyDataText="No payments made">
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
            <asp:CheckBoxField DataField="HasAttended" HeaderText="Attendance" 
                SortExpression="HasAttended">
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
        <EmptyDataRowStyle Font-Italic="True" Font-Underline="False" 
            HorizontalAlign="Center" />
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
