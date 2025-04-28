<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="userStats.aspx.cs" Inherits="GenKFI.utils.userStats" %>
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
			<td>
				Begin Date [ lower bound ]
			</td>
			<td>
				End Date [ upper bound ]
			</td>
			<td>
				Batch Owner [ equals ]
			</td>
		</tr>
		<tr>
			<td>
				<asp:TextBox runat="server" ID="beginDateTXT"></asp:TextBox>
			</td>
			<td>
				<asp:TextBox runat="server" ID="endDateTXT"></asp:TextBox>
			</td>
			<td>
				<asp:DropDownList runat="server" ID="userCMB" ></asp:DropDownList>
			</td>
		</tr>
		<tr>
			<td colspan="3" style="text-align:center">
				<asp:Button runat="server" ID="subBTN" Text="Inquire Stats" EnableViewState="true" OnClick="OnClick_subBTN" />
			</td>
		</tr>
	</table>

	<asp:Repeater runat="server" ID="usersRPT" OnItemDataBound="OnItemDataBound_usersRPT">

		<HeaderTemplate>
			<table style="width:50%;">
				<tr>
					<th>Tax Program</th>
					<th>Returns Keyed</th>
					<th>
						<asp:Label runat="server" ID="batchOwnerLBL"></asp:Label>
					</th>
				</tr>

		</HeaderTemplate>

		<ItemTemplate>
				<tr>
					<td><%#Eval( "taxProg" ).ToString() %></td>
					<td><%#Eval( "ReturnsKeyed" ).ToString() %></td>
					<td>
						<asp:LinkButton runat="server" ID="uNameLNK" OnCommand="OnCommand_uNameLNK"></asp:LinkButton>
					</td>
				</tr>
		</ItemTemplate>

		<FooterTemplate>
			</table>
		</FooterTemplate>

	</asp:Repeater>

	<asp:Panel runat="server" ID="noUserPNL" Visible="false">
		<table style="width:50%;">
			<tr style="background-color: yellow;">
				<td>
					<asp:Label runat="server" ID="noBatchLBL" ></asp:Label>
				</td>
			</tr>
		</table> 
	</asp:Panel>

</asp:Content>
