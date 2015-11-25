<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true"
    CodeBehind="AttendanceCheck.aspx.cs" Inherits="TopCareWebApplication.admin.AttendanceCheck" %>

<%@ Register Src="../UserControls/AttendanceWebUserControl.ascx" TagName="AttendanceWebUserControl"
    TagPrefix="uc1" %>
<%@ Register src="../UserControls/SubscriptionFeeWebUserControl.ascx" tagname="SubscriptionFeeWebUserControl" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .marginTop{margin-top:0px}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr valign="top">
            <td>
                <h1>
                    <asp:Label ID="lblTitle" runat="server" Text="Label">Schedule Attendance</asp:Label> 
                </h1>
            </td>
            <td align="right" valign="top">
                <%--<asp:ImageButton ImageUrl="~/images/printStatement.png" CssClass="marginTop" Height="29px" 
                    runat="server" onclick="Unnamed1_Click" />--%>
                     <asp:HyperLink CssClass="buttonOrange" ID="LinkButton1" runat="server" 
                    NavigateUrl="~/topcare/ReportPages/EmptyAttendanceSheet.aspx" Height="20px" >Print Empty Attendance List </asp:HyperLink>
                    &nbsp;
                     <asp:LinkButton CssClass="button" ID="lbtnPrint" runat="server" Height="20px" OnClick="Unnamed1_Click">Print</asp:LinkButton>
                    &nbsp;
                <asp:LinkButton CssClass="buttonGreen" ID="btnSave" runat="server" Height="20px" OnClick="btnSave_Click">Save</asp:LinkButton>
                &nbsp;<asp:LinkButton CssClass="buttonRed" ID="btnCancel" Height="20px" runat="server">Cancel</asp:LinkButton>
            </td>
        </tr>
    </table>
    <hr />
    <asp:GridView ID="GridView1" runat="server" Width="100%" CellPadding="4" ForeColor="#333333"
        GridLines="None" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="MemberAttendanceID" HeaderText="MemberAttendanceID" SortExpression="MemberAttendanceID"
                Visible="False" />
            <asp:BoundField DataField="ScheduleID" HeaderText="ScheduleID" SortExpression="ScheduleID"
                Visible="False" />
            <asp:BoundField DataField="MemberID" HeaderText="MemberID" SortExpression="MemberID"
                Visible="False" />
            <asp:TemplateField HeaderText="Has Attended" SortExpression="HasAttended">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" 
                        Checked='<%# Bind("HasAttended") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" 
                        Checked='<%# Bind("HasAttended") %>' />
                   
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Weekly Payment" SortExpression="HasPaid">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("HasPaid") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <uc1:AttendanceWebUserControl ID="AttendanceWebUserControl1" runat="server" ScheduleID='<%# Bind("ScheduleID") %>'
                        MemberID='<%# Bind("MemberID") %>' />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Subscription Payment">
                <ItemTemplate>
                    <%--<asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("MemberID", "~/topcare/admin/SubscriptionFeePayments.aspx?mid={0}") %>' 
                        Text='<%# ((int)Eval("IsSubscriptionPaid") )== 0 ? "Subscription Paid" : "Owed" %>'></asp:HyperLink>--%>
                    <uc2:SubscriptionFeeWebUserControl ID="SubscriptionFeeWebUserControl1" MemberID='<%# Bind("MemberID") %>'
                        runat="server" />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
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
</asp:Content>
