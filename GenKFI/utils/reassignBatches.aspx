<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="reassignBatches.aspx.cs" Inherits="GenKFI.utils.ReassignBatches" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
	<script type="text/javascript">
		function checkAll()
		{
			if($('#assignMeAll').attr('checked') == 'checked')
				$('.assignMe').attr('checked', 'checked');
			else
				$('.assignMe').attr('checked', null);
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">

	<table style="width: auto;">
		<tr>
			<td>Select a user to view their assigned batches: </td>
			<td><asp:DropDownList runat="server" ID="usersFROMDDL" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedIndexChanged_usersFROMDDL" ></asp:DropDownList></td>
			<td rowspan="2"><asp:Button runat="server" ID="assignBTN" Text="RE-Assign Batches" OnClick="OnClick_reassignBTN" /></td>
		</tr>
		<tr>
			<td>Select a user to re-assign the batches to:</td>
			<td><asp:DropDownList runat="server" ID="userTODDL" ></asp:DropDownList></td>
		</tr>
	</table>

	<table style="width:50%;">
		<tr>
			<td style="width:135px">Batch Count: </td>
			<td style="width:170px"><asp:Literal runat="server" ID="batchCountLIT"></asp:Literal></td>
			<td style="width:150px">Header Count: </td>
			<td style="width:170px"><asp:Literal runat="server" ID="headerTotalLIT"></asp:Literal></td>
			<td style="width:125px">Item Count: </td>
			<td style="width:170px"><asp:Literal runat="server" ID="ItemTotalLIT"></asp:Literal></td>
		</tr>
	</table>

	<asp:Repeater runat="server" ID="batchRPT">
		<HeaderTemplate>
			<table>
				<tr>
					<th><input type="checkbox" id="assignMeAll" onclick="checkAll();" /></th>
					<th>Tax Program</th>
					<th>Batch ID</th>
					<th>Batch Date</th>
					<th>Image Source</th>
					<th>Batch Type</th>
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
					<td><input type="checkbox" name="assignMe" class="assignMe" value="<%#Eval( "ckbVal" ).ToString() %>" /></td>
					<td><%#Eval( "TaxProgram" ).ToString() %></td>
					<td><a href="BatchModify.aspx?Where=UNASSIGNED&Batch=<%#Eval( "batchLink" ).ToString() %>"><%#Eval( "BatchID" ).ToString() %></a></td>
					<td><%#Eval( "BatchDate" ).ToString() %></td>
					<td><%#Eval( "ImageSource" ).ToString() %></td>
					<td><%#Eval( "BatchType" ).ToString() %></td>
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

	<asp:Panel runat="server" ID="noBatchPNL">
		<table>
			<tr style="background-color: yellow;">
				<td>
					<asp:Label runat="server" ID="noBatchLBL"></asp:Label>
				</td>
			</tr>
		</table>
	</asp:Panel>
</asp:Content>
