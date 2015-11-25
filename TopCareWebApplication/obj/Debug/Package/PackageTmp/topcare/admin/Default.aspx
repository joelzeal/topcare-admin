<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="TopCareWebApplication.admin.Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.cookie.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.jscrollpane.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.jscrollpane.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.mousewheel.js" type="text/javascript"></script>
    <link href="../Styles/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        $(document).ready(function ($) {
            var sectionHeights = ($(window).height() - 170) / 2;
            var sectionWidths = ($(document).width() - 60) / 2;
            $('#firstSection').height(sectionHeights); /* */
            $('#secondSection').height(sectionHeights); /* */
            $('#thirdSection').height(sectionHeights); /* */
            $('#fourthSection').height(sectionHeights); /* */

            $('#firstSection').width(sectionWidths); /* */
            $('#secondSection').width(sectionWidths); /* */
            $('#thirdSection').width(sectionWidths); /* */
            $('#fourthSection').width(sectionWidths); /* */
        });

        $(function () {
            $('#firstSection').each(
        		function () {
        		    $(this).jScrollPane(
        				{
        				    showArrows: $(this).is('.arrow')
        				}
        			);

        		    var api = $(this).data('jsp');
        		    var throttleTimeout;
        		    $(window).bind(
        				'resize',
        				function () {

        				    if ($.browser.msie) {


        				        // IE fires multiple resize events while you are dragging the browser window which
        				        // causes it to crash if you try to update the scrollpane on every one. So we need
        				        // to throttle it to fire a maximum of once every 50 milliseconds...
        				        if (!throttleTimeout) {
        				            throttleTimeout = setTimeout(
        								function () {
        								    api.reinitialise();
        								    throttleTimeout = null;
        								},
        								50
        							);
        				        }
        				    } else {
        				        api.reinitialise();
        				    }
        				}
        			);
        		}
        )
        });


        $(function () {
            $('#secondSection').each(
        		function () {
        		    $(this).jScrollPane(
        				{
        				    showArrows: $(this).is('.arrow')
        				}
        			);

        		    var api = $(this).data('jsp');
        		    var throttleTimeout;
        		    $(window).bind(
        				'resize',
        				function () {

        				    if ($.browser.msie) {


        				        // IE fires multiple resize events while you are dragging the browser window which
        				        // causes it to crash if you try to update the scrollpane on every one. So we need
        				        // to throttle it to fire a maximum of once every 50 milliseconds...
        				        if (!throttleTimeout) {
        				            throttleTimeout = setTimeout(
        								function () {
        								    api.reinitialise();
        								    throttleTimeout = null;
        								},
        								50
        							);
        				        }
        				    } else {
        				        api.reinitialise();
        				    }
        				}
        			);
        		}
        )
        });





        $(function () {
            $('#thirdSection').each(
        		function () {
        		    $(this).jScrollPane(
        				{
        				    showArrows: $(this).is('.arrow')
        				}
        			);

        		    var api = $(this).data('jsp');
        		    var throttleTimeout;
        		    $(window).bind(
        				'resize',
        				function () {

        				    if ($.browser.msie) {


        				        // IE fires multiple resize events while you are dragging the browser window which
        				        // causes it to crash if you try to update the scrollpane on every one. So we need
        				        // to throttle it to fire a maximum of once every 50 milliseconds...
        				        if (!throttleTimeout) {
        				            throttleTimeout = setTimeout(
        								function () {
        								    api.reinitialise();
        								    throttleTimeout = null;
        								},
        								50
        							);
        				        }
        				    } else {
        				        api.reinitialise();
        				    }
        				}
        			);
        		}
        )
        });


        $(function () {
            $('#fourthSection').each(
        		function () {
        		    $(this).jScrollPane(
        				{
        				    showArrows: $(this).is('.arrow')
        				}
        			);

        		    var api = $(this).data('jsp');
        		    var throttleTimeout;
        		    $(window).bind(
        				'resize',
        				function () {

        				    if ($.browser.msie) {


        				        // IE fires multiple resize events while you are dragging the browser window which
        				        // causes it to crash if you try to update the scrollpane on every one. So we need
        				        // to throttle it to fire a maximum of once every 50 milliseconds...
        				        if (!throttleTimeout) {
        				            throttleTimeout = setTimeout(
        								function () {
        								    api.reinitialise();
        								    throttleTimeout = null;
        								},
        								50
        							);
        				        }
        				    } else {
        				        api.reinitialise();
        				    }
        				}
        			);
        		}
        )
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h1>
            Member Attendance History</h1><hr />
        <asp:Chart ID="Chart1" runat="server" DataSourceID="AttendanceCountSqlDataSource"
            Height="500px" Width="500px" ToolTip="Weekly member attendance history ">
            <Series>
                <asp:Series Name="Series1" XValueMember="DateOfEvent" YValueMembers="attendanceCount"
                    YValuesPerPoint="1">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        
        <asp:Chart ID="Chart2" runat="server" 
            DataSourceID="AttendanceCountSqlDataSource_byMonth" Width="500px" 
            Height="500px" ToolTip="Monthly member attendace history">
            <Series>
                <asp:Series ChartType="Pie" Name="Series1" XValueMember="mnth" 
                    YValueMembers="attendanceCount" Legend="Legend1" YValuesPerPoint="2">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend Name="Legend1">
                </asp:Legend>
            </Legends>
        </asp:Chart>
        
        <asp:SqlDataSource ID="AttendanceCountSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>"
            SelectCommand="SELECT     COUNT(dbo.MemberAttendance.MemberID) AS attendanceCount, CONVERT(varchar, dbo.Schedules.DateOfEvent) AS DateOfEvent
FROM         dbo.Schedules INNER JOIN
                      dbo.MemberAttendance ON dbo.Schedules.ScheduleID = dbo.MemberAttendance.ScheduleID
WHERE     (dbo.MemberAttendance.HasAttended = 1)
GROUP BY dbo.Schedules.DateOfEvent"></asp:SqlDataSource> 

<asp:SqlDataSource ID="AttendanceCountSqlDataSource_byMonth" runat="server" ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>"
            
            SelectCommand="SELECT COUNT(MemberAttendance.MemberID) AS attendanceCount, DATENAME(mm, Schedules.DateOfEvent) AS mnth, MONTH(Schedules.DateOfEvent) AS Expr1 FROM Schedules INNER JOIN MemberAttendance ON Schedules.ScheduleID = MemberAttendance.ScheduleID WHERE (MemberAttendance.HasAttended = 1) GROUP BY DATENAME(mm, Schedules.DateOfEvent), MONTH(Schedules.DateOfEvent) ORDER BY Expr1"></asp:SqlDataSource>
    </center>
    
    
</asp:Content>
