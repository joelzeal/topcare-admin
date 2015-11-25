<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="NewSchedule.aspx.cs" Inherits="TopCareWebApplication.admin.NewSchedule" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <asp:Literal Text="New" ID="ltTitle" runat="server" /> &nbsp;Schedule<asp:ScriptManager 
            ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    &nbsp;&nbsp;&nbsp;
    </h1>
        <hr />

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ScheduleID" 
        DataSourceID="ScheduleSqlDataSource" DefaultMode="Insert" 
        oniteminserted="FormView1_ItemInserted" Width="506px" 
        onitemupdated="FormView1_ItemUpdated">
        <EditItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td class="style2">
                        Date Of Event:
                    </td>
                    <td>
                        <asp:TextBox ID="DateOfEventTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("DateOfEvent") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Program Title:<asp:CalendarExtender ID="DateOfEventTextBox_CalendarExtender" 
                            runat="server" ClearTime="True" Enabled="True" Format="dd-MMM-yyyy" 
                            TargetControlID="DateOfEventTextBox">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        <asp:TextBox ID="ProgramTitleTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("ProgramTitle") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        Menu:</td>
                    <td>
                        <asp:TextBox ID="MealsToBeServed_NewTextBox0" runat="server" 
                            CssClass="txtinput" Height="100px" Text='<%# Bind("MealsToBeServed_New") %>' 
                            TextMode="MultiLine" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Payment Due:
                    </td>
                    <td>
                        <asp:TextBox ID="PaymentExpectedTextBox0" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("PaymentExpected") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Team:
                    </td>
                    <td>
                        <asp:TextBox ID="TeamTextBox0" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("Team") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" valign="top">
                        Notes:
                    </td>
                    <td>
                        <asp:TextBox ID="NotesNewTextBox0" runat="server" CssClass="txtinput" 
                            Height="200px" Text='<%# Bind("NotesNew") %>' TextMode="MultiLine" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Update" CssClass="buttonGreen" Text="Save - Program Details" />
                        &nbsp;
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="buttonRed" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td class="style1">
                        Date Of Event:
                    </td>
                    <td>
                        <asp:TextBox ID="DateOfEventTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("DateOfEvent") %>' />
                        <asp:CalendarExtender ID="DateOfEventTextBox_CalendarExtender" runat="server" 
                            ClearTime="True" Enabled="True" Format="dd-MMM-yyyy" 
                            TargetControlID="DateOfEventTextBox">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Program Title:</td>
                    <td>
                        <asp:TextBox ID="ProgramTitleTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("ProgramTitle") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1" valign="top">
                        Menu:</td>
                    <td>
                        <asp:TextBox ID="MealsToBeServed_NewTextBox" runat="server" CssClass="txtinput" 
                            Height="100px" Text='<%# Bind("MealsToBeServed_New") %>' TextMode="MultiLine" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Payment Due:
                    </td>
                    <td>
                        <asp:TextBox ID="PaymentExpectedTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("PaymentExpected") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        Team:
                    </td>
                    <td>
                        <asp:TextBox ID="TeamTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("Team") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1" valign="top">
                        Notes:
                    </td>
                    <td>
                        <asp:TextBox ID="NotesNewTextBox" runat="server" CssClass="txtinput" 
                            Height="200px" Text='<%# Bind("NotesNew") %>' TextMode="MultiLine" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" CssClass="buttonGreen" Text="Save - Program Details" />
                        &nbsp;
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="buttonRed" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            ScheduleID:
            <asp:Label ID="ScheduleIDLabel" runat="server" 
                Text='<%# Eval("ScheduleID") %>' />
            <br />
            DateOfEvent:
            <asp:Label ID="DateOfEventLabel" runat="server" 
                Text='<%# Bind("DateOfEvent") %>' />
            <br />
            MealsToBeServed:
            <asp:Label ID="MealsToBeServedLabel" runat="server" 
                Text='<%# Bind("MealsToBeServed") %>' />
            <br />
            ProgramTitle:
            <asp:Label ID="ProgramTitleLabel" runat="server" 
                Text='<%# Bind("ProgramTitle") %>' />
            <br />
            PaymentExpected:
            <asp:Label ID="PaymentExpectedLabel" runat="server" 
                Text='<%# Bind("PaymentExpected") %>' />
            <br />
            Team:
            <asp:Label ID="TeamLabel" runat="server" Text='<%# Bind("Team") %>' />
            <br />
            Notes:
            <asp:Label ID="NotesLabel" runat="server" Text='<%# Bind("Notes") %>' />
            <br />
            NotesNew:
            <asp:Label ID="NotesNewLabel" runat="server" Text='<%# Bind("NotesNew") %>' />
            <br />
            MealsToBeServed_New:
            <asp:Label ID="MealsToBeServed_NewLabel" runat="server" 
                Text='<%# Bind("MealsToBeServed_New") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="ScheduleSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        DeleteCommand="DELETE FROM [Schedules] WHERE [ScheduleID] = @ScheduleID" 
        InsertCommand="INSERT INTO Schedules(DateOfEvent, ProgramTitle, PaymentExpected, Team, NotesNew, MealsToBeServed_New) VALUES (@DateOfEvent, @ProgramTitle, @PaymentExpected, @Team, @NotesNew, @MealsToBeServed_New); Select @sID = Scope_Identity()" 
        SelectCommand="SELECT ScheduleID, DateOfEvent, MealsToBeServed, ProgramTitle, PaymentExpected, Team, Notes, NotesNew, MealsToBeServed_New FROM Schedules WHERE (ScheduleID = @sID)" 
        
        UpdateCommand="UPDATE Schedules SET DateOfEvent = @DateOfEvent, ProgramTitle = @ProgramTitle, PaymentExpected = @PaymentExpected, Team = @Team, NotesNew = @NotesNew, MealsToBeServed_New = @MealsToBeServed_New WHERE (ScheduleID = @ScheduleID)" 
        oninserted="ScheduleSqlDataSource_Inserted">
        <DeleteParameters>
            <asp:Parameter Name="ScheduleID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DateOfEvent" />
            <asp:Parameter Name="ProgramTitle" />
            <asp:Parameter Name="PaymentExpected"  />
            <asp:Parameter Name="Team" />
            <asp:Parameter Name="NotesNew" />
            <asp:Parameter Name="MealsToBeServed_New" />
            <asp:Parameter DefaultValue="0" Direction="Output" Name="sID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="sID" QueryStringField="sID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DateOfEvent" />
            <asp:Parameter Name="ProgramTitle" />
            <asp:Parameter Name="PaymentExpected" />
            <asp:Parameter Name="Team" />
            <asp:Parameter Name="NotesNew" />
            <asp:Parameter Name="MealsToBeServed_New" />
            <asp:Parameter Name="ScheduleID" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
