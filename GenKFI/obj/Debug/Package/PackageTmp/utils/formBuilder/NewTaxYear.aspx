<%@ Page Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="NewTaxYear.aspx.cs" Inherits="GenKFI.utils.formBuilder.NewTaxYear" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
        <table style="left: 0px; position:relative;">
		<tr><th>ProgCodes File Update</th></tr>
		<tr><td><hr /></td></tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblProgCode" ForeColor="Maroon" Text="Tax Program: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtProgCode" Width="50"></asp:TextBox>
                    <asp:Label runat="server" ID="lblDesc" ForeColor="Maroon" Text="Desc: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtDesc" Width="150"></asp:TextBox>
                    <asp:Button runat="server" ID="btnProgCode" Text="Add ProgCode" OnClick="OnClick_ProgCode" ></asp:Button>
                </td>
            </tr>
        </table>

		<table style="left: 0px; position:relative;">
 		<tr><td><hr /></td></tr>
		<tr><th>Copy Last Year to This Year File Update</th></tr>
		<tr><td><hr /></td></tr>
           <tr>
                <td>
                    <asp:Label runat="server" ID="olblFileType" ForeColor="Maroon" Text="From FileType: "></asp:Label>
                    <asp:TextBox runat="server" ID="oFileType" Width="75"></asp:TextBox>
                    <asp:Label runat="server" ID="olblTaxYear" ForeColor="Maroon" Text="From Year: "></asp:Label>
                    <asp:TextBox runat="server" ID="oTaxYear" Width="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
    		        <asp:Label runat="server" ID="nlblFileType" ForeColor="Maroon" Text="To FileType: "></asp:Label>
                    <asp:TextBox runat="server" ID="nFileType" Width="75"></asp:TextBox>
    		        <asp:Label runat="server" ID="nlblTaxYear" ForeColor="Maroon"  Text="To Year:     "></asp:Label>
                    <asp:TextBox runat="server" ID="nTaxYear" Width="50"></asp:TextBox>
                    <asp:Button runat="server" ID="btnCopyNew" Text="Copy To" OnClick="OnClick_CopyTo" />
	           	</td>
            </tr>
        </table>

        <div style="overflow:scroll;">
		<table style="left: 0px; position:relative;">
		<tr><td><hr /></td></tr>
		<tr><th>Tax Pgm File Update</th></tr>
		<tr><td><hr /></td></tr>
		<tr><td>
            <asp:Label runat="server" ID="tplblFileType" ForeColor="Maroon" Text="File Type: "></asp:Label> 
            <asp:TextBox runat="server" ID="tptxtFileType" Width="75"></asp:TextBox>
            <asp:Button runat="server" ID="getTaxPgm" Text="Get TaxPgm" CommandName="eventType" CommandArgument="taxpgm" OnCommand="OnCommand_getTaxPgm" />
			<asp:Button runat="server" ID="saveTaxPgm" Text="Save Changes" CommandName="eventType" CommandArgument="taxpgm" OnCommand="OnCommand_saveTaxPgm" />
			<asp:GridView runat="server" ID="TaxPgmGDV" AutoGenerateColumns="false" AllowSorting="false" OnRowDataBound="OnRowDataBound_TaxPgm"  >
				<Columns>
					<asp:TemplateField HeaderText="FileType">
						<ItemTemplate>
							<asp:TextBox runat="server" ID="tpFileTypeTXT" Width="65px" Visible="true"></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="BatchType">
						<ItemTemplate>
							<asp:TextBox runat="server" ID="tpBatchTypeTXT" Width="65px" Visible="true"></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="JobId Dev">
						<ItemTemplate>
							<asp:TextBox runat="server" ID="tpJobIdDevTXT" Width="65px" Visible="true"></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="JobId Prod">
						<ItemTemplate>
							<asp:TextBox runat="server" ID="tpJobIdProdTXT" Width="65px" Visible="true"></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="FilingPeriod">
						<ItemTemplate>
							<asp:TextBox runat="server" ID="tpFilingPeriodTXT" Width="65px" Visible="true"></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Due Date">
						<ItemTemplate>
							<asp:TextBox runat="server" ID="tpDueDateTXT" Width="65px" Visible="true"></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Doc Ver">
						<ItemTemplate>
							<asp:TextBox runat="server" ID="tpDocVerTXT" Width="65px" Visible="true"></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
        </td></tr>
        </table>
        </div>

        <div style="overflow:scroll;">
		<table style="left: 0px; position:relative;">
		<tr><td><hr /></td></tr>
		<tr><th>Add Doc File Update</th></tr>
		<tr><td><hr /></td></tr>
		<tr><td>
            <asp:Label runat="server" ID="adlblFileType" ForeColor="Maroon" Text="File Type: "></asp:Label> 
            <asp:TextBox runat="server" ID="adtxtFileType" Width="75"></asp:TextBox>
            <asp:Button runat="server" ID="adgetAddDoc" Text="Get AddDoc" CommandName="eventType" CommandArgument="adddoc" OnCommand="OnCommand_getAddDoc" />
			<asp:Button runat="server" ID="adsaveAddDoc" Text="Save Changes" CommandName="eventType" CommandArgument="adddoc" OnCommand="OnCommand_saveAddDoc" />
			<asp:GridView runat="server" ID="AddDocGDV" AutoGenerateColumns="false" AllowSorting="false" OnRowDataBound="OnRowDataBound_AddDoc"  >
				<Columns>
					<asp:TemplateField HeaderText="FileType">
						<ItemTemplate>
							<asp:TextBox runat="server" ID="adFileTypeTXT" Width="65px" Visible="true"></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Doc Name">
						<ItemTemplate>
							<asp:TextBox runat="server" ID="adDocNameTXT" Width="65px" Visible="true"></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Value">
						<ItemTemplate>
							<asp:TextBox runat="server" ID="adValueTXT" Width="65px" Visible="true"></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Function">
						<ItemTemplate>
							<asp:TextBox runat="server" ID="adFunctionTXT" Width="65px" Visible="true"></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Active">
						<ItemTemplate>
							<asp:TextBox runat="server" ID="adActiveTXT" Width="65px" Visible="true"></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
        </td></tr>
        </table>
        </div>
        <div style="overflow:scroll;">
		<table style="left: 0px; position:relative;">
		<tr><td><hr /></td></tr>
		<tr><th>Load Template by BatchId, Sequence</th></tr>
		<tr><td><hr /></td></tr>
		<tr><td>
            <asp:Label runat="server" ID="chlblFileType" ForeColor="Maroon" Text="File Type: "></asp:Label> 
            <asp:TextBox runat="server" ID="chtxtFileType" Width="75"></asp:TextBox>
            <asp:Label runat="server" ID="chlblBatchId" ForeColor="Maroon" Text="Batch ID: "></asp:Label> 
            <asp:TextBox runat="server" ID="chtxtBatchId" Width="75"></asp:TextBox>
            <asp:Label runat="server" ID="chlblSequence" ForeColor="Maroon" Text="Sequence: "></asp:Label> 
            <asp:TextBox runat="server" ID="chtxtSequence" Width="75"></asp:TextBox>
            <asp:Button runat="server" ID="Button1" Text="Load" CommandName="eventType" CommandArgument="load" OnCommand="OnCommand_loadTemplate" />
        </td></tr>
        </table>
        </div>


</asp:Content>

