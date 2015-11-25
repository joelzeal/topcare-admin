<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="SchAttendanceSummary.aspx.cs" Inherits="TopCareWebApplication.ReportPages.SchAttendanceSummary" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
    <!-- -1 means the customer has attended and has paid earlier
    -5 means the -->
    <asp:SqlDataSource ID="vwMemberAttendanceSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        
        
        SelectCommand="SELECT * FROM vwMemberAttendance WHERE (ScheduleID = @ScheduleID) AND (HasAttended = @HasAttended)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ScheduleID" QueryStringField="sID" 
                Type="Int32" />
            <asp:Parameter DefaultValue="false" Name="HasAttended" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="vwSubscriptionSummarySqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        SelectCommand="SELECT * FROM [vwSubscriptionSummary] WHERE (([ScheduleID] = @ScheduleID) AND ([HasAttended] = @HasAttended))">
        <SelectParameters>
            <asp:QueryStringParameter Name="ScheduleID" QueryStringField="sID" 
                Type="Int32" />
            <asp:Parameter DefaultValue="true" Name="HasAttended" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
