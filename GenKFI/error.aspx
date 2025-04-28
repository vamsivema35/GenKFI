<%@ Page Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="GenKFI.utils.Error" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
	<title>GenKFI Tax Programs</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
	<p style="text-align: center;"><span style="color: Red; font-size: 3;"><asp:Literal runat="server" ID="errorLIT" Mode="PassThrough"></asp:Literal></span></p>

	<p style="text-align: center;"> You can use the Back Button in the Browser Tool Bar to verify the data and Submit again</p> 
	<p style="text-align: center;">
		<input id="home" style="width: 100px; height: 24px; text-align: center" type="button" value="Home" name="home" onclick="window.location='Default.aspx'" />
	</p>        
</asp:Content>
