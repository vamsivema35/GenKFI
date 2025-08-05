<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="errView.aspx.cs" Inherits="GenKFI.utils.ErrView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
	<style type="text/css">
		.myne {
			border-spacing: 0px;
		}
		.myne td{
			text-align: left;
			vertical-align: top;
			border-width: 1px;
			border-style: solid;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
	<div style="width: 75%; margin: auto;">
		If you're reading this and understand what all this means, and you think you 
		can fix any unresolved errors, then you probably already have access to the 
		DataBase. Go in there change the flag and enter some comments about what 
		you did to resolve the error.
	</div>
	<asp:Repeater runat="server" ID="errListRPT" >

		<HeaderTemplate>
			<table class="myne">
				<tr>
					<th>Resolved</th>
					<th style="width: 400px;">Resolved Message</th>
					<th style="width: 175px;">Date/Time</th>
					<th>Error Message</th>
					<th>Caused By</th>
					<th style="width: 175px;">Call Stack Info</th>
				</tr>
		</HeaderTemplate>

		<ItemTemplate>
			<tr style="background-color: aquamarine">
				<td rowspan="3"><%# Eval( "fblnResolved" ) %></td>
				<td rowspan="3"><%# Eval( "fstrResolveMsg" ) %></td>
				<td rowspan="3"><%# Eval( "fdtmWhen" ) %></td>
				<td rowspan="3"><%# Eval( "fstrWhat" ) %></td>
				<td rowspan="3"><%# Eval( "fstrWho" ) %></td>
				<%# Eval( "whereTD" ) %>
			</tr>
		</ItemTemplate>

		<FooterTemplate>
			</table>
		</FooterTemplate>

	</asp:Repeater>
</asp:Content>
