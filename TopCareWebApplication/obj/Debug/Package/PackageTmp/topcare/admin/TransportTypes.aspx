<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="TransportTypes.aspx.cs" Inherits="TopCareWebApplication.topcare.admin.TransportTypes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Transport Types</h1>
<hr />

    <asp:FormView ID="FormView1" runat="server" 
        DataKeyNames="TransportationOptionID" 
        DataSourceID="TransportTypesSqlDataSource" DefaultMode="Insert">
        <EditItemTemplate>
            TransportationOptionID:
            <asp:Label ID="TransportationOptionIDLabel1" runat="server" 
                Text='<%# Eval("TransportationOptionID") %>' />
            <br />
            Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            MustHaveMembershipID:
            <asp:CheckBox ID="MustHaveMembershipIDCheckBox" runat="server" 
                Checked='<%# Bind("MustHaveMembershipID") %>' />
            <br />
            NumberToCall:
            <asp:TextBox ID="NumberToCallTextBox" runat="server" 
                Text='<%# Bind("NumberToCall") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            &nbsp;<table style="width:100%;" cellspacing="5">
                <tr>
                    <td>
                        Description:</td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" CssClass="textEntry" 
                            Text='<%# Bind("Description") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Phone Number:</td>
                    <td>
                        <asp:TextBox ID="NumberToCallTextBox" runat="server" CssClass="textEntry" 
                            Text='<%# Bind("NumberToCall") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" CssClass="buttonGreen" Text="Save" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" CssClass="buttonRed" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            TransportationOptionID:
            <asp:Label ID="TransportationOptionIDLabel" runat="server" 
                Text='<%# Eval("TransportationOptionID") %>' />
            <br />
            Description:
            <asp:Label ID="DescriptionLabel" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            MustHaveMembershipID:
            <asp:CheckBox ID="MustHaveMembershipIDCheckBox" runat="server" 
                Checked='<%# Bind("MustHaveMembershipID") %>' Enabled="false" />
            <br />
            NumberToCall:
            <asp:Label ID="NumberToCallLabel" runat="server" 
                Text='<%# Bind("NumberToCall") %>' />
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
    DataSourceID="TransportTypesSqlDataSource" ForeColor="#333333" 
        GridLines="None" AutoGenerateColumns="False" 
        DataKeyNames="TransportationOptionID" EmptyDataText="No records found">
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
            <asp:BoundField DataField="TransportationOptionID" 
                HeaderText="TransportationOptionID" InsertVisible="False" ReadOnly="True" 
                SortExpression="TransportationOptionID" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="NumberToCall" HeaderText="Phone Number" 
                SortExpression="NumberToCall">
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

<asp:SqlDataSource ID="TransportTypesSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        DeleteCommand="DELETE FROM [TransportationOptions] WHERE [TransportationOptionID] = @TransportationOptionID" 
        InsertCommand="INSERT INTO [TransportationOptions] ([Description], [MustHaveMembershipID], [NumberToCall]) VALUES (@Description, @MustHaveMembershipID, @NumberToCall)" 
        SelectCommand="SELECT * FROM [TransportationOptions]" 
        UpdateCommand="UPDATE [TransportationOptions] SET [Description] = @Description, [MustHaveMembershipID] = @MustHaveMembershipID, [NumberToCall] = @NumberToCall WHERE [TransportationOptionID] = @TransportationOptionID">
    <DeleteParameters>
        <asp:Parameter Name="TransportationOptionID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="MustHaveMembershipID" Type="Boolean" />
        <asp:Parameter Name="NumberToCall" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="MustHaveMembershipID" Type="Boolean" />
        <asp:Parameter Name="NumberToCall" Type="String" />
        <asp:Parameter Name="TransportationOptionID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
