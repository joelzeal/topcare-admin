<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TimePickerWebUserControl_New.ascx.cs" Inherits="TopCareWebApplication.UserControls.TimePickerWebUserControl_New" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/themes/redmond/jquery-ui.css" />

<!-- Plugin files below -->
<style type="text/css">
    body{border:none;background:none}
</style>
<link rel="stylesheet" type="text/css" href="jquery.ptTimeSelect.css" />
<script type="text/javascript" src="jquery.ptTimeSelect.js"></script>
<div id="sample1" class="ui-widget-content" style="border:none;">
    <asp:TextBox ID="txtTime" Width="130px" CssClass="txtinput"  runat="server" 
        ontextchanged="txtTime_TextChanged" />
    <asp:MaskedEditExtender ID="txtTime_MaskedEditExtender" runat="server" 
        CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
        Mask="99:99" MaskType="Time" TargetControlID="txtTime" AutoCompleteValue="99:00">
    </asp:MaskedEditExtender>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        // find the input fields and apply the time select to them.
        $('#sample1 input').ptTimeSelect();
    });
</script>