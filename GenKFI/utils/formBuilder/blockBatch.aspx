<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="blockBatch.aspx.cs" Inherits="GenKFI.utils.formBuilder.blockBatch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
<script type="text/javascript">
	$(document).ready(
	function()
	{
		$("#<%= newFormTXT.ClientID%>").focus(function()
		{
			if($("#<%= newFormTXT.ClientID%>").val() == "Tax Form Name")
				$("#<%= newFormTXT.ClientID%>").attr("value", "");
		});
		$("#<%= tableNameTXT.ClientID%>").focus(function()
		{
			if($("#<%= tableNameTXT.ClientID%>").val() == "Tax Form Table Name")
				$("#<%= tableNameTXT.ClientID%>").attr("value", "");
		});
	}
	);
</script></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
	
	<table>
        <tr>
			<td colspan="3">General Settings (applies to all forms and blocks within a batch)</td>
		</tr>
		<tr>
			<th>
				Tax Program
			</th>
			<th>
				Tax Year
			</th>
			<th>
				File Type
			</th>
		</tr>
		<tr>
			<td>
				<asp:Literal runat="server" ID="taxProgLIT"></asp:Literal>
			</td>
			<td>
				<asp:DropDownList runat="server" ID="taxYearDDL"></asp:DropDownList>
			</td>
			<td>
				<asp:TextBox runat="server" ID="fileTypeTXT"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<asp:Button runat="server" ID="saveHeaderBTN" Text="Save Header Values" OnClick="OnClick_saveHeaderBTN" />
			</td>
		</tr>
	</table>
	<hr />
	<div>Below enter the individual tax forms. Within each form there can be several "blocks" of data. Make sure the names of the tax forms are identical to the names the scans are given. (NOTE: Block Zero(0) is header information only. It can contain no controls. After adding a new form, you must add Block One(1) before adding controls.)
		A star indicates the Database does not yet have the table for that form or block, or the table is missing required data columns. When starting completely new forms, make sure the first form is called 'page 1' to make sure it shows up at the top of the Batch list.
		<br />
		NOTE: The removal links will remove the Blocks. If used on the header Block, it will remove all Blocks for that form. If there are no Blocks, it will remove the form.</div>
	<br />
	<h2>Existing Tables and Forms</h2>
	<asp:Table runat="server" ID="taxFormsTBL">
		<asp:TableHeaderRow ID="headerROW">
			<asp:TableHeaderCell>Tax Form</asp:TableHeaderCell>
			<asp:TableHeaderCell><asp:Button runat="server" ID="saveTableNameBTN" Text="Save Table Changes" OnClick="OnClick_saveTableNameBTN" /><br />DB Table Name</asp:TableHeaderCell>
			<asp:TableHeaderCell>Block</asp:TableHeaderCell>
			<asp:TableHeaderCell>Form Type</asp:TableHeaderCell>
			<asp:TableHeaderCell ColumnSpan="2">Editor Functions</asp:TableHeaderCell>
		</asp:TableHeaderRow>
	</asp:Table>
	<div style="text-align: center">
		<asp:Button runat="server" ID="newFormBTN" Text="New Tax Form" OnClick="OnClick_newFormBTN" ValidationGroup="valGRP1" />

		<asp:TextBox runat="server" ID="newFormTXT" Text="Tax Form Name"></asp:TextBox>
		<asp:RequiredFieldValidator runat="server" ID="formNameREQ" ValidationGroup="valGRP1" ControlToValidate="newFormTXT" InitialValue="Tax Form Name" ErrorMessage="Please Enter a Name for the new tax form" Text="*"></asp:RequiredFieldValidator>

		<asp:TextBox runat="server" ID="tableNameTXT" Text="Tax Form Table Name" ></asp:TextBox>
		<asp:RequiredFieldValidator runat="server" ID="tableNameREQ" ValidationGroup="valGRP1" ControlToValidate="tableNameTXT" InitialValue="Tax Form Table Name" ErrorMessage="Please Enter a Table Name for the new tax form" Text="*"></asp:RequiredFieldValidator>

		<br />
		<span>Note, repeated forms must be put into new tables, due to the dynamic nature of their data, even if they are on the same physical forms.</span>
		<asp:ValidationSummary runat="server" ID="ValidationSummary1" DisplayMode="BulletList" ValidationGroup="valGRP1" ShowMessageBox="true" />
	</div>
</asp:Content>
