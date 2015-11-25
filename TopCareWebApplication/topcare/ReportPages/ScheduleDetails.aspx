<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="ScheduleDetails.aspx.cs" Inherits="TopCareWebApplication.ReportPages.ScheduleDetails" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table align="right">
        <tr>
            <td>
                <asp:LinkButton Text="Email" id="btnEmail" CssClass="buttonOrange" 
                    runat="server" onclick="btnEmail_Click" Width="150px"  />
            </td>
        </tr>
    </table>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Century Gothic" 
    Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" 
        style="text-align: center" Height="500px">
    <LocalReport ReportPath="topcare\Reports\rptProgramOutLine.rdlc">
        <DataSources>
            <rsweb:ReportDataSource DataSourceId="ScheduleSqlDataSource" Name="DataSet1" />
            <rsweb:ReportDataSource DataSourceId="ScheduleDetailsSqlDataSource" 
                Name="DataSet2" />
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
        SelectCommand="SELECT * FROM [Schedules] WHERE ([ScheduleID] = @ScheduleID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ScheduleID" QueryStringField="sID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
