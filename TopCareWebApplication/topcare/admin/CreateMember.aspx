<%@ Page Title="" Language="C#" MasterPageFile="~/topcare/Site.Master" AutoEventWireup="true" CodeBehind="CreateMember.aspx.cs" Inherits="TopCareWebApplication.admin.CreateMember" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register src="../UserControls/MemberToolbarUserControl1.ascx" tagname="MemberToolbarUserControl1" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 242px;
        }
        .style3
        {
            width: 13px;
        }
        .style4
        {
            width: 40px;
        }
        .style6
        {
            width: 102px;
        }
        .style7
        {
            width: 291px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td><h1>New Member<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    </h1>
            </td>
            <td align="right">
                <uc1:MemberToolbarUserControl1 ID="MemberToolbarUserControl11" runat="server" />
            </td>
        </tr>
    </table>
    <hr />
    <%-- <asp:HyperLink runat="server" ID="hplAttendanceHistory" CssClass="button">Attendance History</asp:HyperLink> &nbsp;
    <asp:HyperLink runat="server" ID="HyperLink1" CssClass="button">Subscription Fee Payment History</asp:HyperLink>
            --%>
   
    <br />
    <asp:FormView runat="server" DataKeyNames="MemberID" ID="MemberDetailsFormView"
        DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="100%">
     <ItemTemplate>MemberID:
         <asp:Label ID="MemberIDLabel" runat="server" Text='<%# Eval("MemberID") %>' />
         <br />
         FirstName:
         <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
         <br />
         LastName:
         <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
         <br />
         DOB:
         <asp:Label ID="DOBLabel" runat="server" Text='<%# Bind("DOB") %>' />
         <br />
         Address:
         <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
         <br />
         Postcode:
         <asp:Label ID="PostcodeLabel" runat="server" Text='<%# Bind("Postcode") %>' />
         <br />
         NationalityID:
         <asp:Label ID="NationalityIDLabel" runat="server" 
             Text='<%# Bind("NationalityID") %>' />
         <br />
         DietaryRequirements:
         <asp:Label ID="DietaryRequirementsLabel" runat="server" 
             Text='<%# Bind("DietaryRequirements") %>' />
         <br />
         NextOfKin_Name:
         <asp:Label ID="NextOfKin_NameLabel" runat="server" 
             Text='<%# Bind("NextOfKin_Name") %>' />
         <br />
         NextOfKin_Address:
         <asp:Label ID="NextOfKin_AddressLabel" runat="server" 
             Text='<%# Bind("NextOfKin_Address") %>' />
         <br />
         NextOfKin_Postcode:
         <asp:Label ID="NextOfKin_PostcodeLabel" runat="server" 
             Text='<%# Bind("NextOfKin_Postcode") %>' />
         <br />
         NextOfKin_PhoneNumber:
         <asp:Label ID="NextOfKin_PhoneNumberLabel" runat="server" 
             Text='<%# Bind("NextOfKin_PhoneNumber") %>' />
         <br />
         PhoneNumber1:
         <asp:Label ID="PhoneNumber1Label" runat="server" 
             Text='<%# Bind("PhoneNumber1") %>' />
         <br />
         PhoneNumber2:
         <asp:Label ID="PhoneNumber2Label" runat="server" 
             Text='<%# Bind("PhoneNumber2") %>' />
         <br />
         PhoneNumber3:
         <asp:Label ID="PhoneNumber3Label" runat="server" 
             Text='<%# Bind("PhoneNumber3") %>' />
         <br />
         <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
             CommandName="Edit" Text="Edit" />
         &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
             CommandName="Delete" Text="Delete" />
         &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
             CommandName="New" Text="New" />
        </ItemTemplate>
       <InsertItemTemplate  >
        
           <table style="width:100%;">
               <tr>
                   <td class="style2">
                       First Name:</td>
                   <td class="style3">
                       <asp:TextBox ID="FirstNameTextBox" CssClass="txtinput" runat="server" 
                           Text='<%# Bind("FirstName") %>' />
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       Transport Type:</td>
                   <td>
                       <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                           DataSourceID="TransportTypesSqlDataSource" DataTextField="Description" 
                           DataValueField="TransportationOptionID" 
                           onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                           SelectedValue='<%# Bind("TransportationOptionID") %>'>
                       </asp:DropDownList>
                       <asp:SqlDataSource ID="TransportTypesSqlDataSource" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                           SelectCommand="SELECT * FROM [TransportationOptions] ORDER BY [Description]">
                       </asp:SqlDataSource>
                   </td>
               </tr>
               <tr>
                   <td class="style2">
                       Last Name:
                   </td>
                   <td class="style3">
                       <asp:TextBox ID="LastNameTextBox" CssClass="txtinput" runat="server" 
                           Text='<%# Bind("LastName") %>' />
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       Transport Membership ID:
                   </td>
                   <td>
                       <asp:TextBox ID="TextBox1" runat="server" CssClass="txtinput" 
                           Text='<%# Bind("MemberTransportationID") %>'></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="style2">
                       DOB:</td>
                   <td class="style3">
                       <asp:TextBox ID="DOBTextBox" runat="server" CssClass="txtinput" 
                           Text='<%# Bind("DOB", "{0:d}") %>' />
                       <asp:CalendarExtender ID="DOBTextBox_CalendarExtender" Format="dd-MMM-yyyy" runat="server" 
                           TargetControlID="DOBTextBox">
                       </asp:CalendarExtender>
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td class="style2" valign="top">
                       Address:
                   </td>
                   <td class="style3" valign="top">
                       <asp:TextBox ID="AddressTextBox" runat="server" CssClass="txtinput" 
                           Text='<%# Bind("Address") %>' Height="100px" TextMode="MultiLine" />
                   </td>
                   <td class="style4" valign="top">
                       &nbsp;</td>
                   <td class="style7" valign="top">
                       Remarks:</td>
                   <td valign="top">
                       <asp:TextBox ID="TextBox2" runat="server" CssClass="txtinput" Height="100px" 
                           Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="style2">
                       Postcode:
                   </td>
                   <td class="style3">
                       <asp:TextBox ID="PostcodeTextBox" runat="server"  CssClass="txtinput"
                           Text='<%# Bind("Postcode") %>' />
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td class="style2">
                       Email:</td>
                   <td class="style3">
                       <asp:TextBox ID="PostcodeTextBox08" runat="server" CssClass="txtinput" 
                           Text='<%# Bind("EmailAddress") %>' />
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
              <%-- <tr>
                   <td class="style2">
                       Nationality:
                   </td>
                   <td>
                       <asp:TextBox ID="NationalityIDTextBox" runat="server" CssClass="txtinput"
                           Text='<%# Bind("NationalityID") %>' />
                   </td>
               </tr>--%>
               <tr>
                   <td class="style2">
                       Phone Number 1:</td>
                   <td class="style3">
                       <asp:TextBox ID="PhoneNumber1TextBox" runat="server" CssClass="txtinput"
                           Text='<%# Bind("PhoneNumber1") %>' />
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td class="style2">
                       Phone Number 2:
                   </td>
                   <td class="style3">
                       <asp:TextBox ID="PhoneNumber2TextBox" runat="server" CssClass="txtinput"
                           Text='<%# Bind("PhoneNumber2") %>' />
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td class="style2">
                       Phone Number 3:
                   </td>
                   <td class="style3">
                       <asp:TextBox ID="PhoneNumber3TextBox" runat="server" CssClass="txtinput"
                           Text='<%# Bind("PhoneNumber3") %>' />
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td class="style2">
                       Dietary Requirements:
                   </td>
                   <td class="style3">
                       <asp:TextBox ID="DietaryRequirementsTextBox" runat="server" CssClass="txtinput"
                           Text='<%# Bind("DietaryRequirements") %>' />
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td colspan="2">
                       &nbsp;</td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td colspan="2">
                       <strong style="font-size:16px">Next of Kin</strong></td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td class="style2">
                       Next Of Kin Name:
                   </td>
                   <td class="style3">
                       <asp:TextBox ID="NextOfKin_NameTextBox" runat="server" CssClass="txtinput"
                           Text='<%# Bind("NextOfKin_Name") %>' />
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td class="style2">
                       Next Of Kin Address:</td>
                   <td class="style3">
                       <asp:TextBox ID="NextOfKin_AddressTextBox" runat="server" CssClass="txtinput"
                           Text='<%# Bind("NextOfKin_Address") %>' />
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td class="style2">
                       Next Of Kin Postcode:</td>
                   <td class="style3">
                       <asp:TextBox ID="NextOfKin_PostcodeTextBox" runat="server" CssClass="txtinput"
                           Text='<%# Bind("NextOfKin_Postcode") %>' />
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td class="style2">
                       Next Of Kin PhoneNumber:
                   </td>
                   <td class="style3">
                       <asp:TextBox ID="NextOfKin_PhoneNumberTextBox" runat="server" CssClass="txtinput"
                           Text='<%# Bind("NextOfKin_PhoneNumber") %>' />
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               
               <tr>
                   <td class="style2">
                       &nbsp;</td>
                   <td class="style3">
                       &nbsp;</td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td class="style2">
                       &nbsp;</td>
                   <td class="style3">
                       <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CssClass="buttonGreen"
                           CommandName="Insert" Text="Save" />
                       &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CssClass="buttonRed"
                           CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                   </td>
                   <td class="style4">
                       &nbsp;</td>
                   <td class="style7">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
           </table>

       </InsertItemTemplate>
      <EditItemTemplate>
          <table style="width:100%;">
              <tr>
                  <td class="style2">
                      First Name:</td>
                  <td>
                      <asp:TextBox ID="FirstNameTextBox0" runat="server" CssClass="txtinput" 
                          Text='<%# Bind("FirstName") %>' />
                  </td>
                  <td>
                      Transport Type:</td>
                  <td class="style6">
                      <asp:DropDownList ID="DropDownList2" runat="server" 
                          DataSourceID="TransportationTypesSqlDataSource1" DataTextField="Description" 
                          DataValueField="TransportationOptionID" 
                          SelectedValue='<%# Bind("TransportationOptionID") %>'>
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="TransportationTypesSqlDataSource1" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
                          SelectCommand="SELECT * FROM [TransportationOptions] ORDER BY [Description]">
                      </asp:SqlDataSource>
                  </td>
              </tr>
              <tr>
                  <td class="style2">
                      Last Name:
                  </td>
                  <td>
                      <asp:TextBox ID="LastNameTextBox0" runat="server" CssClass="txtinput" 
                          Text='<%# Bind("LastName") %>' />
                  </td>
                  <td>
                      Transport Membership ID:</td>
                  <td class="style6">
                      <asp:TextBox ID="TextBox3" runat="server" CssClass="txtinput" 
                          Text='<%# Bind("MemberTransportationID") %>'></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td class="style2">
                      DOB:</td>
                  <td>
                      <asp:TextBox ID="DOBTextBox0" runat="server"  CssClass="txtinput" 
                          Text='<%# Bind("DOB", "{0:d}") %>' />
                      <asp:CalendarExtender ID="DOBTextBox0_CalendarExtender" Format="dd-MMM-yyyy" runat="server" 
                          TargetControlID="DOBTextBox0">
                      </asp:CalendarExtender>
                  </td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style2" valign="top">
                      Address:
                  </td>
                  <td valign="top">
                      <asp:TextBox ID="AddressTextBox0" runat="server" CssClass="txtinput" 
                          Height="100px" Text='<%# Bind("Address") %>' TextMode="MultiLine" />
                  </td>
                  <td valign="top">
                      Remarks:</td>
                  <td class="style6" valign="top">
                      <asp:TextBox ID="TextBox4" runat="server" CssClass="txtinput" Height="100px" 
                          Text='<%# Bind("Remarks") %>' TextMode="MultiLine"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <td class="style2">
                      Postcode:
                  </td>
                  <td>
                      <asp:TextBox ID="PostcodeTextBox0" runat="server" CssClass="txtinput" 
                          Text='<%# Bind("Postcode") %>' />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style2">
                      Email:</td>
                  <td>
                      <asp:TextBox ID="NationalityIDTextBox123" runat="server" CssClass="txtinput" 
                          Text='<%# Bind("EmailAddress") %>' />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
             <%-- <tr>
                  <td class="style2">
                      Nationality:
                  </td>
                  <td>
                      <asp:TextBox ID="NationalityIDTextBox0" runat="server" CssClass="txtinput" 
                          Text='<%# Bind("NationalityID") %>' />
                  </td>
              </tr>--%>
              <tr>
                  <td class="style2">
                      Phone Number 1:</td>
                  <td>
                      <asp:TextBox ID="PhoneNumber1TextBox0" runat="server" CssClass="txtinput" 
                          Text='<%# Bind("PhoneNumber1") %>' />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style2">
                      Phone Number 2:
                  </td>
                  <td>
                      <asp:TextBox ID="PhoneNumber2TextBox0" runat="server" CssClass="txtinput" 
                          Text='<%# Bind("PhoneNumber2") %>' />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style2">
                      Phone Number 3:
                  </td>
                  <td>
                      <asp:TextBox ID="PhoneNumber3TextBox0" runat="server" CssClass="txtinput" 
                          Text='<%# Bind("PhoneNumber3") %>' />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style2">
                      Dietary Requirements:
                  </td>
                  <td>
                      <asp:TextBox ID="DietaryRequirementsTextBox0" runat="server" 
                          CssClass="txtinput" Text='<%# Bind("DietaryRequirements") %>' />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td colspan="2">
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td colspan="2">
                      <strong style="font-size:16px">Next of Kin</strong></td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style2">
                      Next Of Kin Name:
                  </td>
                  <td>
                      <asp:TextBox ID="NextOfKin_NameTextBox0" runat="server" CssClass="txtinput" 
                          Text='<%# Bind("NextOfKin_Name") %>' />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style2">
                      Next Of Kin Address:</td>
                  <td>
                      <asp:TextBox ID="NextOfKin_AddressTextBox0" runat="server" CssClass="txtinput" 
                          Text='<%# Bind("NextOfKin_Address") %>' />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style2">
                      Next Of Kin Postcode:</td>
                  <td>
                      <asp:TextBox ID="NextOfKin_PostcodeTextBox0" runat="server" CssClass="txtinput" 
                          Text='<%# Bind("NextOfKin_Postcode") %>' />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style2">
                      Next Of Kin PhoneNumber:
                  </td>
                  <td>
                      <asp:TextBox ID="NextOfKin_PhoneNumberTextBox0" runat="server" 
                          CssClass="txtinput" Text='<%# Bind("NextOfKin_PhoneNumber") %>' />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style2">
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
              <tr>
                  <td class="style2">
                      &nbsp;</td>
                  <td>
                      <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                          CommandName="Update" CssClass="buttonGreen" Text="Save" />
                      &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                          CausesValidation="False" CommandName="Cancel" CssClass="buttonRed" Text="Cancel" />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td class="style6">
                      &nbsp;</td>
              </tr>
          </table>
        </EditItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TopCareConnectionString %>" 
        DeleteCommand="DELETE FROM [Members] WHERE [MemberID] = @MemberID" 
        InsertCommand="INSERT INTO Members(FirstName, LastName, DOB, Address, Postcode, NationalityID, DietaryRequirements, NextOfKin_Name, NextOfKin_Address, NextOfKin_Postcode, NextOfKin_PhoneNumber, PhoneNumber1, PhoneNumber2, PhoneNumber3, EmailAddress, MemberTransportationID, TransportationOptionID, Remarks) VALUES (@FirstName, @LastName, @DOB, @Address, @Postcode, @NationalityID, @DietaryRequirements, @NextOfKin_Name, @NextOfKin_Address, @NextOfKin_Postcode, @NextOfKin_PhoneNumber, @PhoneNumber1, @PhoneNumber2, @PhoneNumber3, @EmailAddress, @MemberTransportationID, @TransportationOptionID, @Remarks)" 
        SelectCommand="SELECT MemberID, FirstName, LastName, DOB, Address, Postcode, NationalityID, DietaryRequirements, NextOfKin_Name, NextOfKin_Address, NextOfKin_Postcode, NextOfKin_PhoneNumber, PhoneNumber1, PhoneNumber2, PhoneNumber3, EmailAddress, Remarks, TransportationOptionID, MemberTransportationID FROM Members WHERE (MemberID = @MemberID)" 
        
        
        
        
        
        UpdateCommand="UPDATE Members SET FirstName = @FirstName, LastName = @LastName, DOB = @DOB, Address = @Address, Postcode = @Postcode, NationalityID = @NationalityID, DietaryRequirements = @DietaryRequirements, NextOfKin_Name = @NextOfKin_Name, NextOfKin_Address = @NextOfKin_Address, NextOfKin_Postcode = @NextOfKin_Postcode, NextOfKin_PhoneNumber = @NextOfKin_PhoneNumber, PhoneNumber1 = @PhoneNumber1, PhoneNumber2 = @PhoneNumber2, PhoneNumber3 = @PhoneNumber3, EmailAddress = @EmailAddress, MemberTransportationID = @MemberTransportationID, TransportationOptionID = @TransportationOptionID, Remarks = @Remarks WHERE (MemberID = @MemberID)">
        <DeleteParameters>
            <asp:Parameter Name="MemberID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter DbType="Date" Name="DOB" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Postcode" Type="String" />
            <asp:Parameter Name="NationalityID" Type="Int32" />
            <asp:Parameter Name="DietaryRequirements" Type="String" />
            <asp:Parameter Name="NextOfKin_Name" Type="String" />
            <asp:Parameter Name="NextOfKin_Address" Type="String" />
            <asp:Parameter Name="NextOfKin_Postcode" Type="String" />
            <asp:Parameter Name="NextOfKin_PhoneNumber" Type="String" />
            <asp:Parameter Name="PhoneNumber1" Type="String" />
            <asp:Parameter Name="PhoneNumber2" Type="String" />
            <asp:Parameter Name="PhoneNumber3" Type="String" />
            <asp:Parameter Name="EmailAddress" />
            <asp:Parameter Name="MemberTransportationID" />
            <asp:Parameter Name="TransportationOptionID" />
            <asp:Parameter Name="Remarks" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="MemberID" QueryStringField="mid" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter DbType="Date" Name="DOB" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Postcode" Type="String" />
            <asp:Parameter Name="NationalityID" Type="Int32" />
            <asp:Parameter Name="DietaryRequirements" Type="String" />
            <asp:Parameter Name="NextOfKin_Name" Type="String" />
            <asp:Parameter Name="NextOfKin_Address" Type="String" />
            <asp:Parameter Name="NextOfKin_Postcode" Type="String" />
            <asp:Parameter Name="NextOfKin_PhoneNumber" Type="String" />
            <asp:Parameter Name="PhoneNumber1" Type="String" />
            <asp:Parameter Name="PhoneNumber2" Type="String" />
            <asp:Parameter Name="PhoneNumber3" Type="String" />
            <asp:Parameter Name="MemberID" Type="Int32" />
            <asp:Parameter Name="EmailAddress" />
            <asp:Parameter Name="MemberTransportationID" />
            <asp:Parameter Name="TransportationOptionID" />
            <asp:Parameter Name="Remarks" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
