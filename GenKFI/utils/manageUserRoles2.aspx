<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="manageUserRoles2.aspx.cs" Inherits="GenKFI.utils.ManageUserRoles2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
	<script type="text/javascript">
		function ShowDialog()
		{
			$("#greyMe").css("display", "block");
			var rtvalue = window.showModalDialog("editPCodes.aspx", "", "resizable: no; scroll: no; status: no; unadorned: yes;");
			__doPostBack( 'codes', 'codes' );
			}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
	<div id="greyMe" style="height: 100%; width: 100%; top: 0px; left: 0px; position: fixed; display: none; background-color: black; opacity: 0.5; z-index: 99;">
		<div style="top: 50%; background-color: black; color: white; font-size: x-large; text-align: center">
			Editing Program Codes
		</div>
	</div>
	<asp:ScriptManager runat="server" ID="ScriptManager1" ></asp:ScriptManager>
	<asp:UpdatePanel runat="server" ID="userUPD">
		<ContentTemplate>
			<asp:Repeater runat="server" ID="userListRPT" >
				<HeaderTemplate>
					<table style="margin: auto; width: 400px; height: 400px;">
						<tr>
							<td></td>
							<th>Users (* expired)<br />(<asp:Literal runat="server" ID="countLIT" Mode="PassThrough" ></asp:Literal> Users)</th>
							<th>Roles</th>
						</tr>
				</HeaderTemplate>

				<ItemTemplate>
						<tr>
							<td><input type="checkbox" name="checkUser" class="checkUser" value="<%#Eval( "ckbVal" ).ToString() %>" /></td>
							<td><%#Eval( "UserName" ).ToString() %></td>
							<td><%#Eval( "Role" ).ToString() %></td>
						</tr>
				</ItemTemplate>

				<FooterTemplate>
					</table>
				</FooterTemplate>
			</asp:Repeater>

			<hr />
			<table style="margin: auto; width: 300px">
				<tr>
					<td colspan="2">
						<asp:TextBox runat="server" ID="searchTXT" Width="100%" ></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						<asp:Button runat="server" ID="doSearchBTN" Text="Search Usernames" Width="100%" OnClick="OnClick_doSearchBTN" />
					</td>
					<td>
						<asp:Button runat="server" ID="clearSearchBTN" Text="Clear Search" Width="100%" OnClick="OnClick_clearSearchBTN" />
					</td>
				</tr>
				<tr>
					<td>
						<asp:Button runat="server" ID="updateUserBTN" Text="Update User Role" Width="100%" OnClick="OnClick_updateUserBTN" />
					</td>
					<td>
						<asp:Button runat="server" ID="invalidateUserBTN" Text="(Un)Expire User" Width="100%" OnClick="OnClick_invalidateUserBTN" />
					</td>
                    <td>
                        <asp:Button runat="server" ID="AddUserBTN" Text ="Add User"  Width="100%" OnClick="OnClick_AddUserBTN" />
                    </td>
				</tr>
				<tr>
					<td style="text-align:right">New Role : </td>
					<td>
						<asp:DropDownList runat="server" ID="updateRoleDDL" Width="100%"></asp:DropDownList>
					</td>
				</tr>
			</table>
		</ContentTemplate>
		<Triggers>
			<asp:AsyncPostBackTrigger ControlID="doSearchBTN" EventName="Click" />
			<asp:AsyncPostBackTrigger ControlID="updateUserBTN" EventName="Click" />
			<asp:AsyncPostBackTrigger ControlID="invalidateUserBTN" EventName="Click" />
			<asp:AsyncPostBackTrigger ControlID="AddUserBTN" EventName="Click" />
		</Triggers>
	</asp:UpdatePanel>

	<br />
	<hr />
	<table style="width: 480px; margin: auto;">
		<tr style="width: 120px;">
			<th colspan="4" style="text-align:center">Filter User List</th>
		</tr>
		<tr style="width: 120px;">
			<td style="text-align:right">
				Show All:
			</td>
			<td style="text-align:left">
				<asp:CheckBox runat="server" ID="expiredCKB" Text="include expired" />
			</td>
			<td>
				<asp:Button runat="server" ID="clearFilterBTN" Text="Clear Filters" Width="100%" OnClick="OnClick_clearFiltersBTN" />
			</td>
			<td>
				<asp:Button runat="server" ID="applyFilterBTN" Text="Apply Filters" Width="100%" OnClick="OnClick_applyFiltersBTN" />
			</td>
		</tr>
		<tr style="width: 120px;">
			<td style="text-align:right">
				Role:
			</td>
			<td style="text-align:left">
				<asp:DropDownList runat="server" ID="roleDDL" Width="100%"></asp:DropDownList>
			</td>
		</tr>
	</table>
	<div style="text-align:center; display: none;" >
		<input id="opencodeEditBTN" type="button" value="Edit program codes" onclick="ShowDialog()" />
	</div>
</asp:Content>
