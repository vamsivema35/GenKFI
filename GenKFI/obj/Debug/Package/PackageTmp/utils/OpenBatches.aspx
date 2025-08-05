<%@ Page Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="OpenBatches.aspx.cs" Inherits="GenKFI.utils.OpenBatches" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
	<script type="text/javascript">
		function checkAll()
		{
			if($('#checkMeAll').attr('checked') == 'checked')
				$('.OpenBatches').attr('checked', 'checked');
			else
				$('.OpenBatches').attr('checked', null);
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">

	<asp:Table runat="server" ID="batchCountTBL" Width="50%">
		<asp:TableRow>
			<asp:TableCell runat="server" Width="135">Batch Count:</asp:TableCell>
			<asp:TableCell runat="server" ID="batchTD" Width="170"></asp:TableCell>
			<asp:TableCell runat="server" Width="150">Header Count:</asp:TableCell>
			<asp:TableCell runat="server" ID="headerTD" Width="170"></asp:TableCell>
			<asp:TableCell runat="server" Width="125">Item Count:</asp:TableCell>
			<asp:TableCell runat="server" ID="itemTD" Width="170"></asp:TableCell>
		</asp:TableRow>
	</asp:Table>
	<br />

	<asp:Repeater runat="server" ID="batchesRPT">
		
		<HeaderTemplate>
			<table>
				<tr> <% if( !GenKFI.MyUserRole.IsUserInRole( "USER" ) )
			{ %>
					<th>Select Batch<br /><input type="checkbox" id="checkMeAll" onclick="checkAll();" />Check All</th> <% } %>
					<th>Tax Program</th>
					<th>Batch ID</th>
					<th>Batch Date</th>
					<th>Image Source</th>
					<th>Batch Type</th>
					<th>PostMark Date</th>
					<th>Hdr Count</th>
					<th>Hdr Amount</th>
					<th>Item Count</th>
					<th>Item Amount</th>
					<th>Pym Count</th>
					<th>Pym Amount</th>
					<th>Batch Status</th>
					<th>Batch User</th>
					<th>Date Opened</th>
				</tr>
		</HeaderTemplate>

		<ItemTemplate>
			<tr>
				<tr> <% if( !GenKFI.MyUserRole.IsUserInRole( "USER" ) )
			{ %>
					<td><%#Eval( "Checkbox" ).ToString().Replace( "~1", "<input type=\"checkbox\" name=\"OpenBatches\" class=\"OpenBatches\" value=\"" ).Replace( "~2", "\" />" ) %></td> <% } %>
					<td><%#Eval( "TaxProgram" ).ToString() %></td>
					<td><a href="BatchModify.aspx?Batch=<%#Eval( "batchLink" ).ToString() %>"><%#Eval( "BatchID" ).ToString() %></a></td>
					<td><%#Eval( "BatchDate" ).ToString() %></td>
					<td><%#Eval( "ImageSource" ).ToString() %></td>
					<td><%#Eval( "BatchType" ).ToString() %></td>
					<td><%#Eval( "PostMarkDate" ).ToString() %></td>
					<td><%#Eval( "HeaderCount" ).ToString() %></td>
					<td><%#Eval( "HeaderAmount" ).ToString() %></td>
					<td><%#Eval( "ItemCount" ).ToString() %></td>
					<td><%#Eval( "ItemAmount" ).ToString() %></td>
					<td><%#Eval( "PymCount" ).ToString() %></td>
					<td><%#Eval( "PymAmount" ).ToString() %></td>
					<td><%#Eval( "BatchStatus" ).ToString() %></td>
					<td><%#Eval( "BatchUser" ).ToString() %></td>
					<td><%#Eval( "DateOpened" ).ToString() %></td>
			</tr>

		</ItemTemplate>

		<FooterTemplate>
			</table>
		</FooterTemplate>
	</asp:Repeater>

	<asp:Table runat="server" ID="noBatchesTBL" Visible="false" >
		<asp:TableRow runat="server" ID="noneTR" BackColor="#e3f5f7">
			<asp:TableCell runat="server" ID="noneTD"></asp:TableCell>
		</asp:TableRow>
	</asp:Table>

	<div style="text-align: center;">
		<asp:Button runat="server" ID="submitMeBTN" OnClick="OnClick_submitMeBTN" Text="Close Batch(es)" />
	</div>

</asp:Content>
