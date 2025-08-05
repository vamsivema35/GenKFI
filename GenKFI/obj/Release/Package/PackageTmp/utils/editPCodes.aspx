<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editPCodes.aspx.cs" Inherits="GenKFI.utils.editPCodes" %>

<!DOCTYPE html>

<head runat="server">
	<title>Edit Program Codes</title>
	<link rel="Stylesheet" type="text/css" href="<%= ResolveClientUrl( "~/css/ApplicationStyle_001.css" ) %>" />
	<script type="text/javascript">
		function CloseDialog()
		{
			window.close()
		}
	</script>
	<base target="_self" />
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<table style="width: 300px; height: 150px;">
			<tr>
				<th style="width: 100px; height: 1px;">Codes</th>
				<th style="width: 150px; height: 1px;">Details</th>
			</tr>
			<tr>
				<td rowspan="4">
					<asp:ListBox runat="server" ID="codesLST" AutoPostBack="true" Width="100%" Height="100%" OnSelectedIndexChanged="OnSelectedIndexChanged_codesLST"></asp:ListBox>
				</td>
				<td>Code</td>
			</tr>
			<tr>
				<td>
					<asp:TextBox runat="server" ID="codeTXT"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					Description
				</td>
			</tr>
			<tr>
				<td>
					<asp:TextBox runat="server" ID="descTXT"></asp:TextBox>
				</td>
			</tr>
		</table>
		<table style="width: 300px;">
			<tr>
				<td>
					<asp:Button runat="server" ID="addBTN" Text="Add Code" OnClick="OnClick_addBTN" />
				</td>
				<td>
					<asp:Button runat="server" ID="editBTN" Text="Save Edit" OnClick="OnClick_editBTN" />
				</td>
				<td>
					<asp:Button runat="server" ID="remBTN" Text="Remove Code" OnClick="OnClick_remBTN" />
				</td>
			</tr>
		</table>
		<div style="text-align: center;">
			<input id="btnClose" type="button" value="Close" onclick="CloseDialog();" />
		</div>
	</div>
	</form>
</body>
