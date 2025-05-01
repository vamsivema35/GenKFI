<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="closedBatches.aspx.cs" Inherits="GenKFI.utils.ClosedBatches" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">

	<table style="width:50%;">
		<tr>
			<td colspan="135">Batch Count: </td>
			<td colspan="170"><asp:Literal runat="server" ID="batchCountLIT"></asp:Literal></td>
			<td colspan="150">Header Count: </td>
			<td colspan="170"><asp:Literal runat="server" ID="headerTotalLIT"></asp:Literal></td>
			<td colspan="125">Item Count: </td>
			<td colspan="170"><asp:Literal runat="server" ID="ItemTotalLIT"></asp:Literal></td>
		</tr>
	</table>
	<br />

	<asp:Panel runat="server" ID="batchPNL">

		<asp:Repeater runat="server" ID="batchRPT">

			<HeaderTemplate>
				<table>
					<tr>
						<th>Select Batch</th>
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
						<td><input type="checkbox" name="ClosedBatches" value="<%#Eval( "Checkbox" ).ToString() %>" /></td>
						<td><%#Eval( "TaxProgram" ).ToString() %></td>
						<td><a href="BatchModify.aspx?Batch=<%#Eval( "batchLink" ).ToString() %>"><%#Eval( "BatchID" ).ToString() %></a></td>
						<td><%#Eval( "BatchDate" ).ToString() %></td>
						<td><%#Eval( "ImageSource" ).ToString() %></td>
						<td><%#Eval( "BatchType" ).ToString() %></td>
						<td><%#Eval( "PostmarkDate" ).ToString() %></td>
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

	</asp:Panel>
	<asp:Panel runat="server" ID="noBatchPNL">
		<table>
			<tr style="background-color: #e3f5f7;">
				<td>
					<asp:Literal runat="server" ID="noBatchLIT"></asp:Literal>
				</td>
			</tr>
		</table>
	</asp:Panel>

	<asp:Panel runat="server" ID="detailPNL">
		<table>
			<tr>
				<td>
					<asp:Button runat="server" ID="subBTN" Text="Open Batch(es)" OnClick="OnClick_subBTN" />
				</td>
			</tr>
		</table>
	</asp:Panel>

</asp:Content>
