<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="PaymentMethods.aspx.cs" Inherits="TopCareWebApplication.admin.PaymentMethods" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Payment  Methods</h1>
<hr />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="PaymentMethodID" 
        DataSourceID="PaymentMethodsSqlDataSource" DefaultMode="Insert">
        <EditItemTemplate>
            PaymentMethodID:
            <asp:Label ID="PaymentMethodIDLabel1" runat="server" 
                Text='<%# Eval("PaymentMethodID") %>' />
            <br />
            Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            &nbsp;<table style="width:100%;">
                <tr>
                    <td>
                        Description:</td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" CssClass="txtinput"
                            Text='<%# Bind("Description") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CssClass="buttonGreen"
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="buttonRed"
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            PaymentMethodID:
            <asp:Label ID="PaymentMethodIDLabel" runat="server" 
                Text='<%# Eval("PaymentMethodID") %>' />
            <br />
            Description:
            <asp:Label ID="DescriptionLabel" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="PaymentMethodsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        DeleteCommand="DELETE FROM [PaymentMethods] WHERE [PaymentMethodID] = @PaymentMethodID" 
        InsertCommand="INSERT INTO [PaymentMethods] ([Description]) VALUES (@Description)" 
        SelectCommand="SELECT * FROM [PaymentMethods] ORDER BY [Description]" 
        UpdateCommand="UPDATE [PaymentMethods] SET [Description] = @Description WHERE [PaymentMethodID] = @PaymentMethodID">
        <DeleteParameters>
            <asp:Parameter Name="PaymentMethodID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="PaymentMethodID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="PaymentMethodID" DataSourceID="PaymentMethodsSqlDataSource" 
        ForeColor="#333333" GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
            <HeaderStyle Width="80px" />
            </asp:CommandField>
            <asp:BoundField DataField="PaymentMethodID" HeaderText="PaymentMethodID" 
                InsertVisible="False" ReadOnly="True" SortExpression="PaymentMethodID" 
                Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description">
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
