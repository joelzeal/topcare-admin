<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true"
    CodeBehind="SearchResultsPage.aspx.cs" Inherits="TopCareWebApplication.admin.SearchResultsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 116px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background: #F9F9F9; padding: 20px">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr valign="middle">
                <td valign="middle">
                    Search:
                </td>
                <td valign="middle">
                    &nbsp;
                    <asp:TextBox ID="txtSearch" runat="server" Width="433px"></asp:TextBox>
                </td>
                <td valign="middle">
                    <asp:ImageButton ID="ImageButton1" ImageUrl="../images/searchButton.png" runat="server"
                        OnClick="ImageButton1_Click" />
                </td>
            </tr>
        </table>
    </div>
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <%-- <td valign="top" class="style1">
                <br />
                <asp:LinkButton ID="btnMembers" runat="server" OnClick="btnMembers_Click">Members</asp:LinkButton>
                <br />
                <asp:LinkButton ID="btnGroup" runat="server" OnClick="btnGroup_Click">Groups</asp:LinkButton>
                <br />
            </td>--%>
            <td>
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="MemberView" runat="server">
                        <h3>
                            <strong>Search Results </strong>
                        </h3>
                        <div style="border-bottom: 1px solid gray">
                        </div>
                        <br />
                        <asp:Label ID="lblNoResults" runat="server" Style="font-style: italic" Text="No match found for your search."
                            Visible="false"></asp:Label>
                        <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                            <ItemTemplate>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr valign="top">
                                        <td>
                                            <asp:HyperLink ID="mainLink" runat="server">
                                                <img src="../images/searchResult.png" />
                                                <%--<asp:Image ID="Image1" Width="50px" CssClass="memberImageBox2" runat="server" />--%>
                                            </asp:HyperLink>
                                        </td>
                                        <td>
                                            <table border="0" cellpadding="0" cellspacing="0" style="margin-left: 10px; width: 100%">
                                                <tr>
                                                    <td>
                                                        <b>
                                                            <asp:HyperLink ID="HyperLink1" Font-Size="Larger" runat="server" Text='<%# Eval("FirstName") +" "+ Eval("LastName")  %>' /></b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><asp:HyperLink ID="hplAttendancePayment" Text="Attendance payment Fee" runat="server" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="hplAttendanceHistory" Text="Attendance History" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="hplSubscriptionFeeHistory" Text="Subscription Fee History" runat="server" />
                                                       
                                                  
                                                        <%--<asp:Label ID="Label1" runat="server" Text='<%# "Balance: " + Eval("Balance") %>'></asp:Label>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
