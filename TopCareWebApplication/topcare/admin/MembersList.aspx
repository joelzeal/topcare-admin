<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="MembersList.aspx.cs" Inherits="TopCareWebApplication.admin.MembersList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Members List</h1>
<hr />
    <asp:GridView ID="GridView1" Width="100%" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MemberID" 
        DataSourceID="MembersSqlDataSource" ForeColor="#333333" GridLines="None">
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
            <asp:BoundField DataField="MemberID" HeaderText="MemberID" 
                InsertVisible="False" ReadOnly="True" SortExpression="MemberID" 
                Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="MemberID" 
                DataNavigateUrlFormatString="~/topcare/admin/CreateMember.aspx?mid={0}" 
                DataTextField="FirstName" HeaderText="First Name" 
                NavigateUrl="~/topcare/admin/CreateMember.aspx">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="MemberID" 
                DataNavigateUrlFormatString="~/topcare/admin/CreateMember.aspx?mid={0}" 
                DataTextField="LastName" HeaderText="Last Name" 
                NavigateUrl="~/topcare/admin/CreateMember.aspx">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" 
                SortExpression="EmailAddress">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
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
    <asp:SqlDataSource ID="MembersSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        
    SelectCommand="SELECT DISTINCT * FROM [Members] ORDER BY [FirstName], [LastName]" 
    DeleteCommand="DELETE FROM Members WHERE (MemberID = @MemberID)">
        <DeleteParameters>
            <asp:Parameter Name="MemberID" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
