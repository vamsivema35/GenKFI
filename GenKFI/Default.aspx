<%@ Page Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GenKFI.Default" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">

	<div style="text-align: center;">
		<asp:Table runat="server" ID="tasksTBL">
			<asp:TableHeaderRow>
				<asp:TableHeaderCell>
					<h2>Batch Tasks</h2>
				</asp:TableHeaderCell>
			</asp:TableHeaderRow>
			<asp:TableRow ID="keyModeROW">
				<asp:TableCell>
					<asp:Button runat="server" ID="keyModeBTN" OnClick="OnClick_keyModeBTN" Text="Key Mode" />
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow ID="blankROW">
				<asp:TableCell>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow ID="openBatchesROW">
				<asp:TableCell>
					<a href="utils/OpenBatches.aspx">View Open Batches</a>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow ID="unassignedBatchesROW">
				<asp:TableCell>
					<a href="utils/UnAssignedBatches.aspx">UnAssigned Batches</a>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow ID="reassignBatchesROW">
				<asp:TableCell>
					<a href="utils/reassignBatches.aspx">Reassign Batches</a>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow ID="closedBatchesROW">
				<asp:TableCell>
					<a href="utils/ClosedBatches.aspx">View Closed Batches</a>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow ID="batchInquireROW">
				<asp:TableCell>
					<a href="utils/BatchInquire.aspx">Inquire Returns &amp; Payments</a>
				</asp:TableCell>
			</asp:TableRow>

			<asp:TableRow ID="adminHeadROW">
				<asp:TableHeaderCell>
					<h2>Admin/Supervisor Tasks</h2>
				</asp:TableHeaderCell>
			</asp:TableRow>

			<asp:TableRow ID="userStatsROW">
				<asp:TableCell>
					<a href="utils/UserStats.aspx">User Statistics</a>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow ID="manageUsersROW">
				<asp:TableCell>
					<a href="utils/manageUserRoles2.aspx">Manage Users</a>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow ID="DcUtilityROW">
				<asp:TableCell>
					<a href="utils/DcUtility.aspx">DC Utility</a>
				</asp:TableCell>
			</asp:TableRow>

			<asp:TableRow ID="devHeadROW">
				<asp:TableHeaderCell>
					<h2>Dev Tasks</h2>
				</asp:TableHeaderCell>
			</asp:TableRow>
			<asp:TableRow ID="ICToolsROW">
			    <asp:TableCell>
					<a href="utils/formBuilder/TestingUtil.aspx">IC Tools</a>
			    </asp:TableCell>
			</asp:TableRow>
			<asp:TableRow ID="jsEditROW">
				<asp:TableCell>
					<a href="utils/formBuilder/editJSauto.aspx">Edit JS Auto-Complete Functions</a>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow ID="errorROW">
				<asp:TableCell>
					<a href="utils/errView.aspx">View App Errors</a>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow ID="formTemplatesROW">
				<asp:TableCell>
					<asp:LinkButton runat="server" ID="editLNK" OnClick="OnClick_editLNK">Manage Form Templates</asp:LinkButton>
				</asp:TableCell>
			</asp:TableRow>
			<asp:TableRow ID="Test">
	<asp:TableCell>
		<asp:LinkButton runat="server" ID="LnkTest1" >Test</asp:LinkButton>
	</asp:TableCell>
</asp:TableRow>
		</asp:Table>
		
	</div>
		
</asp:Content>
