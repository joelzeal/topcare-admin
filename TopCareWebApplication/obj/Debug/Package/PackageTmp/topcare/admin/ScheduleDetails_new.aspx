<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true"
    CodeBehind="ScheduleDetails_new.aspx.cs" Inherits="TopCareWebApplication.topcare.admin.ScheduleDetails_new" %>

<%@ Register src="../UserControls/TimePickerWebUserControl_New.ascx" tagname="TimePickerWebUserControl_New" tagprefix="uc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" cellpadding="0" width="100%" cellspacing="0">
        <tr>
            <td>
                <h1>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    Schedule Details -
                    <asp:HyperLink ID="headerHyperLink" runat="server" /></h1>
            </td>
            <td align="right">
                <asp:LinkButton Text="Save" CssClass="buttonGreen" runat="server" ID="btnSave" OnClick="btnSave_Click" />
                &nbsp;
                <asp:LinkButton Text="Load From Template" CssClass="button" runat="server" 
                    ID="btnLoadFromTemplate" onclick="btnLoadFromTemplate_Click" />
                <asp:ConfirmButtonExtender ID="btnLoadFromTemplate_ConfirmButtonExtender" 
                    runat="server" 
                    ConfirmText="Are you want to load schedule details from template? This will override all changes." 
                    TargetControlID="btnLoadFromTemplate">
                </asp:ConfirmButtonExtender>
            </td>
        </tr>
    </table>
    <hr />
    <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False"
        CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Start Time" SortExpression="StartTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="textEntry" 
                        Text='<%# Bind("StartTime") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HiddenField ID="HiddenField1" runat="server" 
                        Value='<%# Bind("ScheduleDetailID") %>' />
                    <asp:TextBox ID="txtStartTime" runat="server" CssClass="txtinput" 
                        Text='<%# Bind("StartTime") %>' Width="100px"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="150px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="End Time" SortExpression="EndTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("EndTime") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="txtEndTime" runat="server" CssClass="txtinput" 
                        Text='<%# Bind("EndTime") %>' Width="100px"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" Width="150px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="Item">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txtinput" Height="50px" Text='<%# Bind("Item") %>'
                        TextMode="MultiLine"></asp:TextBox>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Item") %>'></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
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
