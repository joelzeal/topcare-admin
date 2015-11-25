<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="PreScheduleFollowupSummary.aspx.cs" Inherits="TopCareWebApplication.ReportPages.PreScheduleFollowupSummary" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register src="../UserControls/PreSFToolbarUserControl.ascx" tagname="PreSFToolbarUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td><h1>Pre-Schedule Followup Summary</h1>
            </td>
            <td align="right">
                <uc1:PreSFToolbarUserControl ID="PreSFToolbarUserControl1" runat="server" />
            </td>
        </tr>
    </table>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" Width="100%" Height="632px" 
        runat="server" Font-Names="Verdana" Font-Size="8pt" 
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
        WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="topcare\Reports\rptPreScheduleFollowup.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="vwPreSFSqlDataSource" 
                    Name="DataSet1" />
                <rsweb:ReportDataSource DataSourceId="vwRSVPSummarySqlDataSource" 
                    Name="DataSet2" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="vwRSVPSummarySqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        SelectCommand="SELECT * FROM [vwRSVPSummary] WHERE ([ScheduleID] = @ScheduleID) ORDER BY [Description]">
        <SelectParameters>
            <asp:QueryStringParameter Name="ScheduleID" QueryStringField="sID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="vwPreSFSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        SelectCommand="SELECT Name, MemberID, PreScheduleFollowupID, RSVPStatusID, PickOffTime, DropOffTime, Comments, IsTransportBooked, PreScheduleFollowupDetailID, PhoneNumber1, PhoneNumber2, PhoneNumber3, MemberTransportationID, RSVPStatusDescription, TransportationOptionsDescription, ScheduleDateOfEvent, ScheduleID FROM vwPreScheduleFollowup WHERE (ScheduleID = @ScheduleID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ScheduleID" QueryStringField="sID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <!-- -1 means the customer has attended and has paid earlier
    -5 means the -->
    </asp:Content>
