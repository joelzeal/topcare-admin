<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="ScheduleDetailsMulti.aspx.cs" Inherits="TopCareWebApplication.ReportPages.ScheduleDetailsMulti" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Century Gothic" 
    Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
    <LocalReport ReportPath="topcare\Reports\rptScheduleList.rdlc">
        <DataSources>
            <rsweb:ReportDataSource DataSourceId="ScheduleSqlDataSource" Name="DataSet1" />
        </DataSources>
    </LocalReport>
</rsweb:ReportViewer>
    <asp:SqlDataSource ID="ScheduleDetailsSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        SelectCommand="SELECT * FROM [ScheduleDetails] WHERE ([ScheduleID] = @ScheduleID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ScheduleID" QueryStringField="sID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ScheduleSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        SelectCommand="SELECT * FROM [Schedules] ORDER BY [DateOfEvent]">
    </asp:SqlDataSource>

</asp:Content>
