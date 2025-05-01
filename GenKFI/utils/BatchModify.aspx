<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="BatchModify.aspx.cs" Inherits="GenKFI.utils.BatchModify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">

	<table>
		<tr>
			<td class="input_lbl">Batch Id</td>
			<td class="input_txt"><asp:TextBox runat="server" ID="BatchNo" MaxLength="8" ReadOnly="true" Text=""></asp:TextBox></td>
			<td class="input_lbl">Batch Date</td>
			<td class="input_txt"><asp:TextBox runat="server" ID="BatchDt" MaxLength="8" ReadOnly="true" Text="" ></asp:TextBox></td>	
			<td class="input_lbl">Image Source</td>
			<td class="input_txt"><asp:TextBox runat="server" ID="ImgSrc" MaxLength="4" ReadOnly="true" Text="" ></asp:TextBox></td>
			<td class="input_lbl">Batch Owner</td>
			<td class="input_cmb">
				<asp:DropDownList runat="server" ID="userCMB" ></asp:DropDownList>
				<asp:RequiredFieldValidator runat="server" ID="batchownerREQ" ControlToValidate="userCMB" Text="*" ValidationGroup="valGRP1" ErrorMessage="Batch Owner Cannot be Blank" ForeColor="Red" ></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr>
			<td class="input_lbl">Create Date</td>
			<td class="input_txt"><asp:TextBox runat="server" ID="CreateDate" MaxLength="10" ReadOnly="true" Text="" ></asp:TextBox></td>
			<td class="input_lbl">Received Date</td>
			<td class="input_txt">
				<asp:TextBox runat="server" ID="ReceivedDate" MaxLength="10" Text="" ></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ID="ReceivedDateREQ" ControlToValidate="ReceivedDate" ErrorMessage="Received Date cannot be empty" ValidationGroup="valGRP1" Text="*" ></asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator runat="server" ID="ReceivedDateREGEX" ControlToValidate="ReceivedDate" ValidationExpression="((\d{2})|(\d))\/((\d{2})|(\d))\/((\d{4})|(\d{2}))" ErrorMessage="Received Date is not a valid date (MM/DD/YYYY)" ValidationGroup="valGRP1" Text="*"></asp:RegularExpressionValidator>
			</td>
			<td class="input_lbl">Postmark Date</td>
			<td class="input_txt">
				<asp:TextBox runat="server" ID="PostmarkDate" MaxLength="10" Text="" ></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ID="PostmarkDateREQ" ControlToValidate="PostmarkDate" ErrorMessage="Postmark Date cannot be empty" ValidationGroup="valGRP1" Text="*" ></asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator runat="server" ID="PostmarkDateREGEX" ControlToValidate="PostmarkDate" ValidationExpression="((\d{2})|(\d))\/((\d{2})|(\d))\/((\d{4})|(\d{2}))" ErrorMessage="Postmark Date is not a valid date (MM/DD/YYYY)" ValidationGroup="valGRP1" Text="*"></asp:RegularExpressionValidator>
			</td>
			<td class="input_lbl">Deposit Date</td>
			<td class="input_txt">
				<asp:TextBox runat="server" ID="DepositDate" MaxLength="10" Text="" ></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ID="DepositDateREQ" ControlToValidate="DepositDate" ErrorMessage="Deposit Date cannot be empty" ValidationGroup="valGRP1" Text="*" ></asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator runat="server" ID="DepositDateREGEX" ControlToValidate="DepositDate" ValidationExpression="((\d{2})|(\d))\/((\d{2})|(\d))\/((\d{4})|(\d{2}))" ErrorMessage="Deposit Date is not a valid date (MM/DD/YYYY)" ValidationGroup="valGRP1" Text="*"></asp:RegularExpressionValidator>
			</td>
		</tr>
		<tr>
			<td class="input_lbl">Header Count</td>
			<td class="input_txt">
				<asp:TextBox runat="server" ID="BatchCount" MaxLength="3" Text="" ></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ID="BatchCountREQ" ControlToValidate="BatchCount" ErrorMessage="Header Count cannot be empty" ValidationGroup="valGRP1" Text="*" ></asp:RequiredFieldValidator>
			</td>
			<td class="input_lbl">Header Amount</td>
			<td class="input_txt">
				<asp:TextBox runat="server" ID="BatchAmount" MaxLength="14" Text="" ></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ID="BatchAmountREQ" ControlToValidate="BatchAmount" ErrorMessage="Header Amount cannot be empty" ValidationGroup="valGRP1" Text="*" ></asp:RequiredFieldValidator>
			</td>
			<td class="input_lbl">Item Count</td>
			<td class="input_txt"><asp:TextBox runat="server" ID="ItemCount" MaxLength="3" ReadOnly="true" Text=""></asp:TextBox></td>
			<td class="input_lbl">Item Amount</td>
			<td class="input_txt"><asp:TextBox runat="server" ID="ItemAmount" MaxLength="14" ReadOnly="true" Text="" ></asp:TextBox></td>
		</tr>
		<tr>
			<td class="input_lbl">Batch Type</td>
			<td class="input_txt">
				<asp:TextBox runat="server" ID="BatchType" MaxLength="8" Text="" ></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ID="BatchTypeREQ" ControlToValidate="BatchType" ErrorMessage="Batch Type cannot be empty" ValidationGroup="valGRP1" Text="*" ></asp:RequiredFieldValidator>
			</td>
			<td class="input_lbl">Form</td>
			<td class="input_txt">
				<asp:TextBox runat="server" ID="FormType" MaxLength="4" Text="" ></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ID="FormTypeREQ" ControlToValidate="FormType" ErrorMessage="Form Name cannot be empty" ValidationGroup="valGRP1" Text="*" ></asp:RequiredFieldValidator>
			</td>
			<td class="input_lbl">DLN</td>
			<td class="input_txt"><asp:TextBox runat="server" ID="DLN" MaxLength="15" Width="140px" ReadOnly="true" Text="" ></asp:TextBox></td>
			<td class="input_lbl">Timely Batch</td>
			<td class="input_txt">
				<asp:TextBox runat="server" ID="TimelyBatch" MaxLength="1" Width="15px" Text="" ></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ID="TimelyBatchREQ" ControlToValidate="TimelyBatch" ErrorMessage="Timely Batch cannot be empty" ValidationGroup="valGRP1" Text="*" ></asp:RequiredFieldValidator>
			</td>
		</tr>	
		<tr>
			<td class="input_lbl">Batch Status</td>
			<td class="input_txt">
				<asp:TextBox runat="server" ID="BatchStatus" MaxLength="1" Width="15px" Text="" ></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ID="BatchStatusREQ" ControlToValidate="BatchStatus" ErrorMessage="Batch Status cannot be empty" ValidationGroup="valGRP1" Text="*" ></asp:RequiredFieldValidator>
			</td>
		</tr>	
	</table>
	<asp:Panel runat="server" ID="batchModPNL" Visible="true">
		<table>
			<tr>
				<td>
					<asp:Button runat="server" ID="subBTN" OnClick="OnClick_subBTN" Text="Modify Batch" ValidationGroup="valGRP1" />
					<asp:ValidationSummary runat="server" ID="valSumm" ValidationGroup="valGRP1" ForeColor="Red" ShowMessageBox="true" />
				</td>
			</tr>
		</table>
	</asp:Panel>

	<asp:Literal runat="server" ID="infoLIT" Mode="PassThrough"></asp:Literal>
	<asp:Repeater runat="server" ID="batchRPT" Visible="true" OnItemDataBound="BatchRPT_ItemDataBound" >

		<HeaderTemplate>
			<table> 
				<tr>
					<th>Seq.</th>
					<th>PM Date</th>
					<th>Return Due</th>
					<th>Payment </th>
					<th>DLN</th>
					<th>Form Name</th>
					<th>UserID</th>
					<th>Status</th>
				</tr>
		</HeaderTemplate>

		<ItemTemplate>
				<tr <%#Eval( "fstrRowID" ) %>>
					<td><asp:Literal runat="server" ID="flngSequenceLIT" Mode="PassThrough"></asp:Literal></td>
					<td><%#Eval( "PostmarkDate" ).ToString() %></td>
					<td><%#Eval( "TotalDue" ).ToString() %></td>
					<td><%#Eval( "PaymentAmount" ).ToString() %></td>
					<td><%#Eval( "DLN" ).ToString() %></td>
					<td><%#Eval( "fstrFormName" ).ToString() %></td>
					<td><%#Eval( "lastWho" ).ToString() %></td>
					<td><%#Eval( "BatchStatus" ).ToString() %></td>
				</tr>
		</ItemTemplate>

		<FooterTemplate>
			</table>
		</FooterTemplate>
	</asp:Repeater>

	<asp:Panel runat="server" ID="noItemsPNL" Visible="false" >
		<table>
			<tr style="background: #e3f5f7">
				<td>No Items in the Batch!!</td>
			</tr>
		</table>
	</asp:Panel>
	<%--Hidden Fields--%>
	<asp:HiddenField runat="server" ID="LastOwner" Value="" />
	<asp:HiddenField runat="server" ID="BatchID" Value="" />
	<asp:HiddenField runat="server" ID="BatchDate" Value="" />
	<asp:HiddenField runat="server" ID="ImageSource" Value="" />
	<asp:HiddenField runat="server" ID="ProgCode" Value="" /> 
	<asp:HiddenField runat="server" ID="ReadStatus" Value="" />
	<asp:HiddenField runat="server" ID="BatchInfo" Value="" />
	<asp:HiddenField runat="server" ID="WhereFrom" Value="" />
	<asp:HiddenField runat="server" ID="BatchNext" Value="" />
	<%--Hidden Fields--%>
</asp:Content>
