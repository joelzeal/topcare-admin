<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true"
    CodeBehind="ScheAttendanceDetailedRpt_noCash.aspx.cs" Inherits="TopCareWebApplication.ReportPages.ScheAttendanceDetailedRpt_noCash" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="../UserControls/PreSFToolbarUserControl.ascx" TagName="PreSFToolbarUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
                    Schedule Detailed Report Type 2<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    </h1>
                    <hr />
    <table border="0" cellpadding="3" cellspacing="0">
        <tr>
            <td>
                Start Date:
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtStartDate" CssClass="txtinput" Width="150px" />
                <asp:CalendarExtender ID="txtStartDate_CalendarExtender" Format="dd-MMM-yyyy" runat="server"
                    TargetControlID="txtStartDate">
                </asp:CalendarExtender>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td>
                End Date:
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtEndDate"  CssClass="txtinput" Width="150px" />
                <asp:CalendarExtender ID="txtEndDate_CalendarExtender" Format="dd-MMM-yyyy" runat="server"
                    TargetControlID="txtEndDate">
                </asp:CalendarExtender>
            </td>
            <td>
                <asp:LinkButton Text="Load Data" ID="Run" CssClass="button" runat="server" 
                    onclick="Run_Click" />
            </td>
        </tr>
        <tr style="height:2px">
            <td style="height:2px">
                &nbsp;
            </td>
            <td>
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <rsweb:ReportViewer ID="ReportViewer1" Width="100%" Height="632px" runat="server"
        Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana"
        WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="topcare\Reports\rptAttendanceDetailedRpt_noMoney.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="scheduleSqlDataSource" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="scheduleSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        
        
        
        SelectCommand="SELECT ScheduleID, DateOfEvent, MealsToBeServed, ProgramTitle, PaymentExpected, Team, Notes FROM Schedules WHERE (CONVERT (Date, DateOfEvent) BETWEEN CONVERT (Date, @StartDate) AND CONVERT (Date, @EndDate)) ORDER BY DateOfEvent">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtStartDate" DefaultValue="1/1/2050" 
                Name="StartDate" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtEndDate" DefaultValue="1/1/2050" 
                Name="EndDate" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="vwSchAttForReportSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        
        
    SelectCommand="SELECT * FROM [vwSubscriptionSummary] WHERE (([ScheduleID] = @ScheduleID) AND ([HasAttended] = 1))">
        <SelectParameters>
            <asp:Parameter Name="ScheduleID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ScheduleDetailsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        SelectCommand="SELECT * FROM [ScheduleDetails] WHERE ([ScheduleID] = @ScheduleID) ORDER BY [StartTime]">
        <SelectParameters>
            <asp:Parameter Name="ScheduleID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>
