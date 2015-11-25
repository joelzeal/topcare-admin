<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TimePickerWebUserControl.ascx.cs"
    Inherits="UserControls_TimePickerWebUserControl" %>

    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/themes/redmond/jquery-ui.css" />
<!-- Plugin files below -->
<style type="text/css">
    body{border:none}
</style>
<link rel="stylesheet" type="text/css" href="UserControls/jquery.ptTimeSelect.css" />
<script type="text/javascript" src="UserControls/jquery.ptTimeSelect.js"></script>
<div id="sample1" class="ui-widget-content" style="border:none;margin-left:15px">
    <asp:TextBox ID="txtTime" Width="130px" CssClass="txtinput"  runat="server" 
        ontextchanged="txtTime_TextChanged" />
    <%-- <asp:TextBoxWatermarkExtender WatermarkCssClass="italics txtinput" ID="TextBoxWatermarkExtender4" 
                              runat="server" Enabled="True" TargetControlID="txtTime" 
                               WatermarkText="Event start time">
                          </asp:TextBoxWatermarkExtender>--%>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        // find the input fields and apply the time select to them.
        $('#sample1 input').ptTimeSelect();
    });
</script>
