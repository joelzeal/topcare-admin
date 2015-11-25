<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotificationsPage.aspx.cs" Inherits="TopCareWebApplication.topcare.admin.NotificationsPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Image ImageUrl="~/images/birthday_gift.png" runat="server" />
                        </td>
                        <td> 
                            <asp:Label Text='<%# Eval("FullName") %>' runat="server" />
                        </td>
                        <td>
                        <asp:Label ID="Label1" Text='<%# Eval("MonthAndDay") %>' runat="server" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>
