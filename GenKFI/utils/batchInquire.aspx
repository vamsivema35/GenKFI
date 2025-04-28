<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="batchInquire.aspx.cs" Inherits="GenKFI.utils.BatchInquire" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
	<script type="text/javascript">
		function fmtDate(currObj, focObj)
		{
			var strValue = currObj.value;
			var objRegExp;
			strValue = $.trim(strValue).replace(/ /g, "");
			objRegExp = new RegExp('([0-9]{2})([0-9]{2})([0-9]{2})');
			if(objRegExp.test(strValue))
			{
				strValue = strValue.replace(objRegExp, '$1/$2/$3');
				currObj.value = strValue;
				return true;
			}
			else
				return false;
		}

	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
	<table style="width:50%;">
		<tr>
			<td class="input_lbl">
				Batch ID [ like ]
			</td>
			<td class="input_txt">
				<asp:TextBox runat="server" ID="batchIDTXT" CssClass="txt" MaxLength="6"></asp:TextBox>
			</td>
			<td class="input_lbl">
				Batch Date [ equals ]
			</td>
			<td class="input_txt">
				<asp:TextBox runat="server" ID="batchDateTXT" CssClass="txt" MaxLength="10"></asp:TextBox>
			</td>
			<td class="input_lbl">
				Date Opened [ equals ]
			</td>
			<td class="input_txt">
				<asp:TextBox runat="server" ID="openedDateTXT" CssClass="txt" MaxLength="10"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td colspan="8">
				<asp:Button runat="server" ID="subBTN" CssClass="btn" Text="Inquire Batch"  OnClick="OnClick_subBTN" />
			</td>
		</tr>
	</table>

	<asp:Repeater runat="server" ID="batchRPT">
		<HeaderTemplate>
			<table style="width:85%;">
				<tr>
					<th>Tax Program</th>
					<th>Batch ID</th>
					<th>Batch Date</th>
					<th>Image Source</th>
					<th>Batch Type</th>
					<th>Header Count</th>
					<th>Header Amount</th>
					<th>Item Count</th>
					<th>Item Amount</th>
					<th>Batch Status</th>
					<th>Batch User</th>
					<th>Date Opened</th>
					<th>Date Extracted</th>
				</tr>
		</HeaderTemplate>

		<ItemTemplate>
				<tr>
					<td><%#Eval( "TaxProgram" ).ToString() %></td>
					<td><a href="BatchModify.aspx?Batch=<%#Eval( "batchLink" ).ToString() %>"><%#Eval( "BatchID" ).ToString() %></a></td>
					<td><%#Eval( "BatchDate" ).ToString() %></td>
					<td><%#Eval( "ImageSource" ).ToString() %></td>
					<td><%#Eval( "BatchType" ).ToString() %></td>
					<td><%#Eval( "HeaderCount" ).ToString() %></td>
					<td><%#Eval( "HeaderAmount" ).ToString() %></td>
					<td><%#Eval( "ItemCount" ).ToString() %></td>
					<td><%#Eval( "ItemAmount" ).ToString() %></td>
					<td><%#Eval( "BatchStatus" ).ToString() %></td>
					<td><%#Eval( "BatchUser" ).ToString() %></td>
					<td><%#Eval( "DateOpened" ).ToString() %></td>
					<td><%#Eval( "DateExtracted" ).ToString() %></td>
				</tr>
		</ItemTemplate>

		<FooterTemplate>
			</table>
		</FooterTemplate>
	</asp:Repeater>

	<asp:Panel runat="server" ID="overallSummaryPNL" Visible="true" >
		<hr />
		<table style="width:50%;">
			<tr>
				<td>Summary</td>
			</tr>
		</table>
		<br />
		<table style="width:30%;">
			<tr>
				<td style="width:135px">Batch Count: </td>
				<td style="width:170px"><asp:Literal runat="server" ID="overallSummarybatchCountLIT"></asp:Literal></td>
				<td style="width:150px">Header Count: </td>
				<td style="width:170px"><asp:Literal runat="server" ID="overallSummaryheaderTotalLIT"></asp:Literal></td>
				<td style="width:125px">Item Count: </td>
				<td style="width:170px"><asp:Literal runat="server" ID="overallSummaryItemTotalLIT"></asp:Literal></td>
			</tr>
		</table>

		<br />
		<asp:Repeater runat="server" ID="overallSummarydetailRPT">
			<HeaderTemplate>
				<table style="width:50%;"> 
					<tr>
						<th>Tax Year</th>
						<th>Image Source</th>
						<th>Batch Type</th>
						<th>Batch Count</th>
						<th>Header Count</th>
					</tr>
			</HeaderTemplate>

			<ItemTemplate>
					<tr>
						<td><%#Eval( "TaxYear" ).ToString() %></td>
						<td><%#Eval( "ImageSource" ).ToString() %></td>
						<td><%#Eval( "BatchType" ).ToString() %></td>
						<td><%#Eval( "BatchCount" ).ToString() %></td>
						<td><%#Eval( "HeaderCount" ).ToString() %></td>
					</tr>
			</ItemTemplate>

			<FooterTemplate>
				</table>
			</FooterTemplate>
		</asp:Repeater>
	</asp:Panel>



</asp:Content>
