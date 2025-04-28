<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="existForms.aspx.cs" Inherits="GenKFI.utils.formBuilder.existForms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
	<div>Below are listed all existing forms, by year and tax program. Click the link to edit an existing form, or the button for a new form. Note new forms will be restricted to existing tax programs. To edit the existing tax programs, update the tables tblTaxProg and progCodes in the GenKFI database.</div>
	<div>Click the 'Copy Forms' to copy that years forms to another year. This will then take you to the Edit Forms page, where you can select the new year and make any changes needed for that year.</div>
	<div>NOTE: Removing a form/year will also remove all related controls. Keep this in mind.</div>

			<table style="left: 0px; position:relative;">
                <tr>
                    <td>
                        <a href="NewTaxYear.aspx">New Tax Year</a><br />
                        <a href="GkInstall.aspx">Gk Install</a><br />
                        <a href="TestingUtil.aspx">Testing Util</a><br />
                        <a href="UtilDev.aspx">Gk UtilDev</a><br />
	            	</td>
                </tr>
            </table>

	<asp:Repeater runat="server" ID="existFormsRPT" OnItemDataBound="OnItemDataBound_existFormsRPT">

		<HeaderTemplate>

			<table style="width: 500px;">

				<tr>
					<th></th>
					<th>
						Tax Program
					</th>
					<th>
						Tax Year
					</th>
					<th>
						File Type
					</th>
					<th></th>
					<th></th>
				</tr>
		</HeaderTemplate>

		<ItemTemplate>
				<tr>
					<td>
						<%# Request.QueryString[ "tp" ] %>
					</td>
					<td>
						<%#Eval( "flngTaxYear" ).ToString() %>
					</td>
					<td>
						<%#Eval( "fstrFileType" ).ToString() %>
					</td>
					<td>
						<asp:HyperLink runat="server" ID="editLNK" Text="Edit Form" ></asp:HyperLink>
					</td>
				</tr>
		</ItemTemplate>

		<FooterTemplate>
			</table>
		</FooterTemplate>

	</asp:Repeater>
	<hr />
	<table style="width: 500px;">
		<tr>
			<td>
				<asp:Literal runat="server" ID="taxCodeLIT"></asp:Literal>
			</td>
			<td>
				<asp:DropDownList runat="server" ID="taxYearDDL" ></asp:DropDownList>
				<asp:RequiredFieldValidator runat="server" ID="yearREQ" ErrorMessage="Please select a Tax Year." Text="*" InitialValue="-1" ValidationGroup="valGRP1" ControlToValidate="taxYearDDL" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>
			</td>
			<td>
				<asp:TextBox runat="server" ID="fileTypeTXT" ></asp:TextBox>
				<asp:RequiredFieldValidator runat="server" ID="fileTypeREQ" ErrorMessage="Please enter a File Type." Text="*" ValidationGroup="valGRP1" ControlToValidate="fileTypeTXT" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>
			</td>
			<td>
				<asp:Button runat="server" ID="newBTN" Text="New KFI Form" OnClick="OnClick_newBTN" ValidationGroup="valGRP1" />
			</td>
		</tr>
	</table>
	<asp:ValidationSummary runat="server" ID="valSum1" ValidationGroup="valGRP1" ForeColor="Red" ShowMessageBox="true" DisplayMode="BulletList" />
	
</asp:Content>
