<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="needSql.aspx.cs" Inherits="GenKFI.utils.formBuilder.needSql" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
	<div style="text-align: justify; width: 50%; margin: auto;">
		Before being able to use the form you just created and/or edited, the Database will need to be updated.
		Unless you have sufficient rights on the Database, you will need to contact a DBA and give them this info.
		They will then be able to edit/create the tables needed for the form to work and store it's data.
		<br />
		Alternatively, you can enter an email address and click the button at the bottom of the page to email this info.
		To send several emails, enter the addresses separated by commas.
		<br />
		<span style="font-weight:bold">Do we have an email server on here?</span>
		<br />
		<br />
		<div style="margin: auto; text-align: center;"><asp:HyperLink runat="server" ID="backBBLNK" Text="Back to Form/Block List"></asp:HyperLink></div>
	</div>
	<div style="text-align: center;">
		<br />
		<asp:TextBox runat="server" ID="sqlTXT" ReadOnly="true" TextMode="MultiLine" Width="50%" Height="300px"></asp:TextBox>
		<br />
		<asp:TextBox runat="server" ID="emailsTXT" TextMode="SingleLine"></asp:TextBox><asp:Button runat="server" ID="sendEmailBTN" Text="Email Info" OnClick="OnClick_sendEmailBTN" />
	</div>
</asp:Content>
