<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="EmailSettings.aspx.cs" Inherits="TopCareWebApplication.topcare.admin.EmailSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            width: 345px;
        }
        .style5
        {
            width: 127px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>SMTP Configuration</h1>
<hr />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="CompanyID" 
        DataSourceID="CompanyProfileSqlDataSource" DefaultMode="Edit">
        <EditItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td class="style5">
                        SMTP Server:</td>
                    <td class="style4">
                        <asp:TextBox ID="SmtpServerTextBox" runat="server" CssClass="txtinput" 
                            style="margin-left: 0px" Text='<%# Bind("SmtpServer") %>' />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="SmtpServerTextBox" 
                            ErrorMessage="SMTP server IP Address/name is required" style="color: #FF0000"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        SMTP Port:</td>
                    <td class="style4">
                        <asp:TextBox ID="smtpPortTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("smtpPort") %>' />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="smtpPortTextBox" ErrorMessage="SMTP Port is required" 
                            style="color: #FF0000"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        SMTP Email Address:</td>
                    <td class="style4">
                        <asp:TextBox ID="SmtpEmailAddressTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("SmtpEmailAddress") %>' />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="SmtpEmailAddressTextBox" 
                            ErrorMessage="Email Address is required" style="color: #FF0000"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        SMTP Password:</td>
                    <td class="style4">
                        <asp:TextBox ID="SmtpPasswordTextBox" runat="server" CssClass="txtinput" 
                            Text='<%# Bind("SmtpPassword") %>' TextMode="Password" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="SmtpPasswordTextBox" ErrorMessage="Password is required" 
                            style="color: #FF0000"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        Verify Password:</td>
                    <td class="style4">
                        <asp:TextBox ID="VerifyPasswordTexBox" runat="server" CssClass="txtinput" 
                            TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="SmtpPasswordTextBox" ControlToValidate="VerifyPasswordTexBox" 
                            ErrorMessage="Passwords do not match." style="color: #FF0000"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;</td>
                    <td class="style4">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" CssClass="buttonGreen" Text="Save" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" CssClass="buttonRed" 
                            Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            CompanyName:
            <asp:TextBox ID="CompanyNameTextBox" runat="server" 
                Text='<%# Bind("CompanyName") %>' />
            <br />
            SmtpServer:
            <asp:TextBox ID="SmtpServerTextBox" runat="server" 
                Text='<%# Bind("SmtpServer") %>' />
            <br />
            smtpPort:
            <asp:TextBox ID="smtpPortTextBox" runat="server" 
                Text='<%# Bind("smtpPort") %>' />
            <br />
            SmtpEmailAddress:
            <asp:TextBox ID="SmtpEmailAddressTextBox" runat="server" 
                Text='<%# Bind("SmtpEmailAddress") %>' />
            <br />
            SmtpPassword:
            <asp:TextBox ID="SmtpPasswordTextBox" runat="server" 
                Text='<%# Bind("SmtpPassword") %>' />
            <br />
            SubscriptionFeeToBeCharged:
            <asp:TextBox ID="SubscriptionFeeToBeChargedTextBox" runat="server" 
                Text='<%# Bind("SubscriptionFeeToBeCharged") %>' />
            <br />
            DefaultEmailMessage:
            <asp:TextBox ID="DefaultEmailMessageTextBox" runat="server" 
                Text='<%# Bind("DefaultEmailMessage") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            CompanyID:
            <asp:Label ID="CompanyIDLabel" runat="server" Text='<%# Eval("CompanyID") %>' />
            <br />
            CompanyName:
            <asp:Label ID="CompanyNameLabel" runat="server" 
                Text='<%# Bind("CompanyName") %>' />
            <br />
            SmtpServer:
            <asp:Label ID="SmtpServerLabel" runat="server" 
                Text='<%# Bind("SmtpServer") %>' />
            <br />
            smtpPort:
            <asp:Label ID="smtpPortLabel" runat="server" Text='<%# Bind("smtpPort") %>' />
            <br />
            SmtpEmailAddress:
            <asp:Label ID="SmtpEmailAddressLabel" runat="server" 
                Text='<%# Bind("SmtpEmailAddress") %>' />
            <br />
            SmtpPassword:
            <asp:Label ID="SmtpPasswordLabel" runat="server" 
                Text='<%# Bind("SmtpPassword") %>' />
            <br />
            SubscriptionFeeToBeCharged:
            <asp:Label ID="SubscriptionFeeToBeChargedLabel" runat="server" 
                Text='<%# Bind("SubscriptionFeeToBeCharged") %>' />
            <br />
            DefaultEmailMessage:
            <asp:Label ID="DefaultEmailMessageLabel" runat="server" 
                Text='<%# Bind("DefaultEmailMessage") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="CompanyProfileSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        DeleteCommand="DELETE FROM [CompanyProfile] WHERE [CompanyID] = @CompanyID" 
        InsertCommand="INSERT INTO [CompanyProfile] ([CompanyName], [SmtpServer], [smtpPort], [SmtpEmailAddress], [SmtpPassword], [SubscriptionFeeToBeCharged], [DefaultEmailMessage]) VALUES (@CompanyName, @SmtpServer, @smtpPort, @SmtpEmailAddress, @SmtpPassword, @SubscriptionFeeToBeCharged, @DefaultEmailMessage)" 
        SelectCommand="SELECT * FROM [CompanyProfile]" 
        UpdateCommand="UPDATE [CompanyProfile] SET [CompanyName] = @CompanyName, [SmtpServer] = @SmtpServer, [smtpPort] = @smtpPort, [SmtpEmailAddress] = @SmtpEmailAddress, [SmtpPassword] = @SmtpPassword, [SubscriptionFeeToBeCharged] = @SubscriptionFeeToBeCharged, [DefaultEmailMessage] = @DefaultEmailMessage WHERE [CompanyID] = @CompanyID">
        <DeleteParameters>
            <asp:Parameter Name="CompanyID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="SmtpServer" Type="String" />
            <asp:Parameter Name="smtpPort" Type="Int32" />
            <asp:Parameter Name="SmtpEmailAddress" Type="String" />
            <asp:Parameter Name="SmtpPassword" Type="String" />
            <asp:Parameter Name="SubscriptionFeeToBeCharged" Type="Decimal" />
            <asp:Parameter Name="DefaultEmailMessage" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="SmtpServer" Type="String" />
            <asp:Parameter Name="smtpPort" Type="Int32" />
            <asp:Parameter Name="SmtpEmailAddress" Type="String" />
            <asp:Parameter Name="SmtpPassword" Type="String" />
            <asp:Parameter Name="SubscriptionFeeToBeCharged" Type="Decimal" />
            <asp:Parameter Name="DefaultEmailMessage" Type="String" />
            <asp:Parameter Name="CompanyID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
