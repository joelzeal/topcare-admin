<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="SchAttendanceSummary_Manual.aspx.cs" Inherits="TopCareWebApplication.ReportPages.SchAttendanceSummary_Manual" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Attendance Summary Report</h1>
<hr />
    <table border="0" cellpadding="5" cellspacing="0">
        <tr>
            <td>Select Schedule:&nbsp;&nbsp;
            </td>
             <td>
                 <asp:DropDownList ID="DropDownList1" runat="server" 
                     DataSourceID="SchedulesSqlDataSource" DataTextField="DateOfEvent" 
                     DataValueField="ScheduleID" DataTextFormatString="{0:dd-MMM-yyyy}" 
                     Height="28px">
                 </asp:DropDownList>
                 <asp:SqlDataSource ID="SchedulesSqlDataSource" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                     
                     SelectCommand="SELECT convert(date, [DateOfEvent]) as DateOfEvent , [ScheduleID] FROM [Schedules] ORDER BY [DateOfEvent]">
                 </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
             <td>
             <center>
                 <asp:LinkButton ID="LinkButton1" CssClass="button"  runat="server" 
                     Width="100px" onclick="LinkButton1_Click">Run</asp:LinkButton>
            </center></td>
        </tr>
    </table>
    <br />
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" Width="100%" Height="632px" 
        runat="server" Font-Names="Verdana" Font-Size="8pt" 
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
        WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="topcare\Reports\rptScheduleSummary.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="vwSubscriptionSummarySqlDataSource" 
                    Name="DataSet1" />
                <rsweb:ReportDataSource DataSourceId="vwMemberAttendanceSqlDataSource" 
                    Name="DataSet2" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="vwMemberAttendanceSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        SelectCommand="SELECT * FROM [vwMemberAttendance] WHERE (([ScheduleID] = @ScheduleID) AND ([HasAttended] = @HasAttended))">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="ScheduleID" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter DefaultValue="false" Name="HasAttended" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="vwSubscriptionSummarySqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        SelectCommand="SELECT * FROM [vwSubscriptionSummary] WHERE (([ScheduleID] = @ScheduleID) AND ([HasAttended] = @HasAttended))">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="ScheduleID" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter DefaultValue="true" Name="HasAttended" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
