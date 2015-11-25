<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MemberDetailsToolbarUserControl.ascx.cs" Inherits="TopCareWebApplication.UserControls.MemberDetailsToolbarUserControl" %>
<asp:FormView ID="FormView1" runat="server" DataKeyNames="MemberID" 
    DataSourceID="SqlDataSource1">
    <EditItemTemplate>
        FirstName:
        <asp:TextBox ID="FirstNameTextBox" runat="server" 
            Text='<%# Bind("FirstName") %>' />
        <br />
        LastName:
        <asp:TextBox ID="LastNameTextBox" runat="server" 
            Text='<%# Bind("LastName") %>' />
        <br />
        MemberID:
        <asp:Label ID="MemberIDLabel1" runat="server" Text='<%# Eval("MemberID") %>' />
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
            CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
    <InsertItemTemplate>
        FirstName:
        <asp:TextBox ID="FirstNameTextBox" runat="server" 
            Text='<%# Bind("FirstName") %>' />
        <br />
        LastName:
        <asp:TextBox ID="LastNameTextBox" runat="server" 
            Text='<%# Bind("LastName") %>' />
        <br />

        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
            CommandName="Insert" Text="Insert" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        &nbsp;<asp:Label ID="FirstNameLabel" runat="server" 
            Text='<%# Bind("FirstName") %>' />
&nbsp;
        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
    SelectCommand="SELECT [FirstName], [LastName], [MemberID] FROM [Members] WHERE ([MemberID] = @MemberID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="MemberID" QueryStringField="mid" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

