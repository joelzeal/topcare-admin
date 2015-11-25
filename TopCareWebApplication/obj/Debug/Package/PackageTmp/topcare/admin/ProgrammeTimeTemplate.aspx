<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true"
    CodeBehind="ProgrammeTimeTemplate.aspx.cs" Inherits="TopCareWebApplication.topcare.admin.ProgrammeTimeTemplate" %>

<%@ Register Src="../UserControls/TimePickerWebUserControl_New.ascx" TagName="TimePickerWebUserControl_New"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 63px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        Programme Time Template</h1>
    <hr />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ItemID" DataSourceID="SqlDataSource1"
        DefaultMode="Insert">
        <EditItemTemplate>
            ItemID:
            <asp:Label ID="ItemIDLabel1" runat="server" Text='<%# Eval("ItemID") %>' />
            <br />
            StartTime:
            <asp:TextBox ID="StartTimeTextBox" runat="server" Text='<%# Bind("StartTime") %>' />
            <br />
            EndTime:
            <asp:TextBox ID="EndTimeTextBox" runat="server" Text='<%# Bind("EndTime") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width: 100%;">
                <tr>
                    <td class="style1">
                        Start Time:
                    </td>
                    <td>
                        <uc1:TimePickerWebUserControl_New EventTime='<%# Bind("StartTime") %>' ID="TimePickerWebUserControl_New1"
                            runat="server" />
                        <%--<asp:TextBox ID="StartTimeTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("StartTime") %>' />--%>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        End Time:
                    </td>
                    <td>
                        <uc1:TimePickerWebUserControl_New EventTime='<%# Bind("EndTime") %>' ID="TimePickerWebUserControl_New2"
                            runat="server" />
                        <%-- <asp:TextBox ID="EndTimeTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("EndTime") %>' />--%>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Description:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="txtinput" Text='<%# Bind("Template") %>'></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            CssClass="buttonGreen" Text="Save" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" CssClass="buttonRed" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            ItemID:
            <asp:Label ID="ItemIDLabel" runat="server" Text='<%# Eval("ItemID") %>' />
            <br />
            StartTime:
            <asp:Label ID="StartTimeLabel" runat="server" Text='<%# Bind("StartTime") %>' />
            <br />
            EndTime:
            <asp:Label ID="EndTimeLabel" runat="server" Text='<%# Bind("EndTime") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:GridView ID="GridView1" Width="100%" runat="server" CellPadding="4" DataSourceID="SqlDataSource1"
        ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ItemID"
        OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Delete" Height="32px"
                        ImageUrl="~/images/delete.png" OnClientClick="return confirm('Are you sure you want to delete?');"
                        Width="32px" />
                </ItemTemplate>
                <HeaderStyle Width="20px" />
                <ItemStyle HorizontalAlign="Left"  />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" Height="32px"
                        Width="32px" CommandName="Edit" ImageUrl="~/images/edit.png" Text="Edit" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
                <EditItemTemplate>
                    <div style="text-align: right">
                        <asp:ImageButton ID="ImageButton14" runat="server" CausesValidation="True" CommandName="Update"
                            Height="20px" ImageUrl="~/images/save.png" Text="Update" />
                        &nbsp;<asp:ImageButton ID="ImageButton25" runat="server" CausesValidation="False"
                            CommandName="Cancel" Height="20px" ImageUrl="~/images/cancel.png" Text="Cancel" />
                    </div>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ItemID" HeaderText="ItemID" InsertVisible="False" ReadOnly="True"
                SortExpression="ItemID" Visible="False" />
            <asp:BoundField DataField="StartTime" HeaderText="Start Time" SortExpression="StartTime">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="EndTime" HeaderText="End Time" SortExpression="EndTime">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Description" SortExpression="Template">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txtinput" Height="50px" Text='<%# Bind("Template") %>'
                        TextMode="MultiLine"></asp:TextBox>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Template") %>'></asp:TextBox>
                </EditItemTemplate>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>"
        
        DeleteCommand="DELETE FROM [ProgrameTimeTemplate] WHERE [ItemID] = @ItemID" InsertCommand="INSERT INTO ProgrameTimeTemplate(StartTime, EndTime, Template) VALUES (@StartTime, @EndTime, @Template)"
        SelectCommand="SELECT * FROM [ProgrameTimeTemplate] ORDER BY [StartTime]" 
        UpdateCommand="UPDATE ProgrameTimeTemplate SET StartTime = @StartTime, EndTime = @EndTime, Template = @Template WHERE (ItemID = @ItemID)">
        <DeleteParameters>
            <asp:Parameter Name="ItemID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Time" Name="StartTime" />
            <asp:Parameter DbType="Time" Name="EndTime" />
            <asp:Parameter Name="Template" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Time" Name="StartTime" />
            <asp:Parameter DbType="Time" Name="EndTime" />
            <asp:Parameter Name="ItemID" Type="Int32" />
            <asp:Parameter Name="Template" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
