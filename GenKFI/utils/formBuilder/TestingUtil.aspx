<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="TestingUtil.aspx.cs" Inherits="GenKFI.utils.formBuilder.TestingUtil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
        <table style="left: 0px; position:relative;">
		<tr><th>Testing Batch Utility</th></tr>
		<tr><td><hr /></td></tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblBatchId" ForeColor="Maroon" Text="Batch ID: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtBatchId" Width="50"></asp:TextBox>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
                <td>
                    <asp:Button runat="server" ID="btnReset" Text="Reset Batch" OnClick="OnClick_Reset" ></asp:Button>
                    <span>Reset - Batch to Extract again - Status = Open..</span>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
                <td>
                    <asp:Button runat="server" ID="btnClear" Text="Clear Batch" OnClick="OnClick_Clear" ></asp:Button>
                    <span>Clear - the Database for the Batch to Re-Enter..</span>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
                <td>
                    <asp:Button runat="server" ID="btnAmend" Text="Amend Batch" OnClick="OnClick_Amend" ></asp:Button>
                    <span>Copy Batch/Data to Batch+A for Amended Batch</span>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblStatus" ForeColor="Maroon" Text="Status:"></asp:Label>
                    <asp:Label runat="server" ID="lblMsg" ForeColor="MediumBlue" Text ="Begin Processing"></asp:Label>
                </td>
            </tr>
            <tr><td></td></tr>
        </table>
</asp:Content>
