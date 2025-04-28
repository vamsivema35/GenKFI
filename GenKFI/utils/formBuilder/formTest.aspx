<%@ Page Language="C#" MasterPageFile="~/forms.Master" AutoEventWireup="True" CodeBehind="formTest.aspx.cs" Inherits="GenKFI.utils.formBuilder.FormTest" %>
	<asp:Content ID="headerContent" ContentPlaceHolderID="headerHolder" runat="server">
		<!-- ************************************************** -->
		<!--  Header Controls, different controls here for the control generation -->
		<!-- ************************************************** -->

		<div id="divHeader" style="position:absolute;top:0px;left:0px;height:72px;width:100%;" runat="server">

			<table style="left: 325px;position: relative;">
				<tr>
					<td><asp:Label runat="server" ID="fileTypeLBL" CssClass="headerInput" Width="75" Text="File Type:" ></asp:Label></td>
					<td><asp:Label runat="server" ID="fileTypeTXT" CssClass="headerInput" Width="75" ></asp:Label></td>
				</tr>
				<tr>
					<td><asp:Label runat="server" ID="taxYearLBL" CssClass="headerInput" Width="75" Text="Tax Year:" ></asp:Label></td>
					<td><asp:Label runat="server" ID="taxYearTXT" CssClass="headerInput" Width="75" ></asp:Label></td>
				</tr>
				<tr>
					<td><asp:Label runat="server" ID="taxProgLBL" CssClass="headerInput" Width="75" Text="Tax Program:" ></asp:Label></td>
					<td><asp:Label runat="server" ID="taxProgTXT" CssClass="headerInput" Width="75" ></asp:Label></td>
				</tr>
			</table>

			<asp:Button runat="server" ID="btnSub" Text="Done" style="left:700px; top:13px; position:absolute; height:45px; font-size:20px; font-weight:bold; z-index: 10;" OnClick="OnClick_btnSub" />

			<asp:Label runat="server" ID="titleLBL" style="left:800px; top:13px; position:absolute; height:45px; width:200px; font-size:20px; font-weight:bold;"></asp:Label>
 
			<asp:Label runat="server" ID="blockLBL" Width="20" style="left:505px;color:Black;background-color:#F0E7BB;top:13px;position:absolute;height:20px;width:50px;font-weight:bold;" Text="BLK:"></asp:Label>
			<asp:Label runat="server" ID="blockTXT" Width="20" style="left:555px;color:Black;background-color:#F0E7BB;top:13px;position:absolute;height:20px;width:50px;font-weight:bold;" Text=""></asp:Label>

			<asp:Label runat="server" ID="tableLBL" Width="20" style="left:505px;color:Black;background-color:#F0E7BB;top:36px;position:absolute;height:20px;width:50px;font-weight:bold;" Text="Table:"></asp:Label>
			<asp:Label runat="server" ID="tableTXT" style="left:555px;color:Black;background-color:#F0E7BB;top:36px;position:absolute;height:20px;width:78px; font-weight:bold;" Text=""></asp:Label>
		</div>
	</asp:Content>


	<asp:Content runat="server" ID="scriptingContent" ContentPlaceHolderID="scriptingHolder">
		<script type="text/javascript" src="<%= ResolveClientUrl( "~/scripts/jquery-1.8.2.min.js" ) %>"></script>
		<script type="text/javascript" src="<%= ResolveClientUrl( "~/scripts/jquery-ui-1.10.3.custom.min.js" ) %>"></script>

		<script type="text/javascript">
			var oTop = oLeft = 0;
			$(document).ready(function()
			{
				$('#divImageDrag').draggable();
				$('#divImageDrag').mousedown(function() { oTop = parseInt($('#divMarker').css('top').replace("px", "")); oLeft = parseInt($('#divMarker').css('left').replace("px", "")); });
				$('#divImageDrag').on("drag", function(event, ui){
					$('#divMarker').offset({ top: oTop + ui.position.top - ui.originalPosition.top, left: oLeft + ui.position.left - ui.originalPosition.left });
				});
				$("#divImageDrag").mouseover(function() { $("#divImageDrag").css("cursor", "move"); });
			});
			function saveTheVal(x) { };
		</script>
	</asp:Content>
	<asp:Content runat="server" ID="rightContent" ContentPlaceHolderID="rightHolder">
	</asp:Content>

	<asp:Content runat="server" ID="hiddenContent" ContentPlaceHolderID="hiddenHolder">
		<!-- ************************************************** -->
		<!-- Hidden Inputs, probably don't need these anymore -->
		<!-- ************************************************** -->

		<asp:HiddenField runat="server" ID="templateImgPath" />

	</asp:Content>
