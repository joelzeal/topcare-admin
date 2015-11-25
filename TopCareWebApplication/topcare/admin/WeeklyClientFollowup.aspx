<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="WeeklyClientFollowup.aspx.cs" Inherits="TopCareWebApplication.topcare.admin.WeeklyClientFollowup" %>
<%@ Register src="../UserControls/RSVPWebUserControl.ascx" tagname="RSVPWebUserControl" tagprefix="uc1" %>
<%@ Register src="../UserControls/PreSFToolbarUserControl.ascx" tagname="PreSFToolbarUserControl" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr valign="top">
            <td ><h1>
                Client Followup</h1></td>
            <td align="right">  <uc2:PreSFToolbarUserControl ID="PreSFToolbarUserControl1" runat="server" />
               
             
            </td>
        </tr>
        <tr valign="top">
            <td colspan="2" align="right"> <hr />
          </td>
        </tr>
        <tr valign="top">
            <td  >
            <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>Transports Option<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
                :&nbsp;
            </td>
             <td>
                 <asp:DropDownList ID="DropDownList1" runat="server" height="28px"
                     DataSourceID="TransportOptionsSqlDataSource" DataTextField="Description" 
                     DataValueField="TransportationOptionID" AutoPostBack="True" 
                     onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                     ondatabound="DropDownList1_DataBound">
                 </asp:DropDownList>
                 <asp:SqlDataSource ID="TransportOptionsSqlDataSource" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                     
                     SelectCommand="SELECT TransportationOptionID, Description + ' - ' + NumberToCall AS Description, MustHaveMembershipID FROM TransportationOptions ORDER BY Description">
                 </asp:SqlDataSource>
            </td>
        </tr>
    </table> </td><td  align="right">    <asp:LinkButton Text="Save" CssClass="buttonGreen" ID="btnSave" runat="server" 
                    onclick="btnSave_Click" />
                &nbsp;<asp:LinkButton Text="Cancel" CssClass="buttonRed" ID="btnCanel"  runat="server" /></td>
        </tr>
    </table>
    <div style="height:8px"></div>
    
<asp:GridView ID="GridView1" width="100%" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" 
        ForeColor="#333333" GridLines="None" EmptyDataText="No record(s) found" 
        >
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:TemplateField HeaderText="Name" SortExpression="Name">
            <EditItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                <%--<asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("xxx") %>' />--%>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" Width="200px" />
        </asp:TemplateField>
        <asp:BoundField DataField="MemberTransportationID" 
            HeaderText="Transport. ID" SortExpression="MemberTransportationID">
        <HeaderStyle HorizontalAlign="Left" Width="170px" />
        </asp:BoundField>
        <asp:BoundField DataField="PhoneNumber1" HeaderText="Phone Number(s)" 
            SortExpression="PhoneNumber1">
        <HeaderStyle HorizontalAlign="Left" Width="270px" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="RSVP Status" SortExpression="RSVPStatusID">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RSVPStatusID") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="RSVPStatusSqlDataSource" DataTextField="Description" 
                    DataValueField="RSVPStatusID" SelectedValue='<%# Bind("RSVPStatusID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="RSVPStatusSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                    SelectCommand="SELECT * FROM [RSVPStatus]"></asp:SqlDataSource>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" Width="150px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Transport" SortExpression="IsTransportBooked">
            <EditItemTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" 
                    Checked='<%# Bind("IsTransportBooked") %>' />
            </EditItemTemplate>
            <ItemTemplate>
                <uc1:RSVPWebUserControl ID="RSVPWebUserControl1" PreScheduleFollowupDetailID='<%# Bind("PreScheduleFollowupDetailID") %>' 
                MemberID='<%# Bind("MemberID") %>'  IsTransportBooked='<%# Bind("IsTransportBooked") %>' Pickup='<%# Bind("PickOffTime") %>'
               Dropoff='<%# Bind("DropOffTime") %>' runat="server" />
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" Width="300px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Comments" SortExpression="Comments">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="txtinput" Height="30px" 
                    Text='<%# Bind("Comments") %>' TextMode="MultiLine"></asp:TextBox>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left" />
        </asp:TemplateField>
    </Columns>
    <EditRowStyle BackColor="#999999" Font-Italic="True" />
    <EmptyDataRowStyle HorizontalAlign="Center" />
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
        SelectCommand="SELECT * FROM [vwPreScheduleFollowup]"></asp:SqlDataSource>
    <div>
        
    </div>

</asp:Content>
