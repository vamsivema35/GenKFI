<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="GkInstall.aspx.cs" Inherits="GenKFI.utils.formBuilder.GkInstall" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
        <div style="Text-align:left; width: 60%; margin: auto;">
            For Tech Team: AF=Add Field REQ: Table, Column, DataType <br />
            For Tech Team: DF=Drop Field REQ: Table, Column <br />
            Script: LC=Load Control REQ: File Type, Table: rfrTaxPgm, rfrAddDoc, rfrReturnHeaders, rfrControlHeaders, rfrControls, tblAutoJavaComplete <br />
            Script: LD=Load Data REQ: Table: rfrTaxTable, rfrPitRcLic, rfrCrsLocation, rfrGrtRate, rfrCmpRate Filter PIT Tax Tables: fstrTaxYear=xxxx  <br /><br />
            <asp:Label runat="server" ID="lblInstName" ForeColor="Maroon" Text="InstName: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox runat="server" ID="txtInstName" Width="300"></asp:TextBox> 
            <span>Install Name as a Install group</span> 
            <br />
            <br />
            <asp:Label runat="server" ID="lblCmd" ForeColor="Maroon" Text="Command: "></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox runat="server" ID="txtCmd" Width="300"></asp:TextBox> 
            <span>Command (listed above) 
            <br />
            </span> <br />
            <asp:Label runat="server" ID="lblFileType" ForeColor="Maroon" Text="FileType: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox runat="server" ID="txtFileType" Width="300"></asp:TextBox> 
            <span>FileType Name</span> 
            <br />
            <br />
            <asp:Label runat="server" ID="lblTable" ForeColor="Maroon" Text="Table: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox runat="server" ID="txtTable" Width="300"></asp:TextBox> 
            <span>Table Name</span> 
            <br />
            <br />
            <asp:Label runat="server" ID="lblColumn" ForeColor="Maroon" Text="Column: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox runat="server" ID="txtColumn" Width="300"></asp:TextBox>
            <span>Column Name</span> 
            <br />
            <br />
            <asp:Label runat="server" ID="lblDataType" ForeColor="Maroon" Text="DataType: "></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox runat="server" ID="txtDataType" Width="300"></asp:TextBox>
            <span>money, tinyint, smallint, datetime, varchar(x)</span> 
            <br />
            <br />
            <asp:Label runat="server" ID="lblNull" ForeColor="Maroon" Text="NOT (Null): "></asp:Label>
            &nbsp;<asp:TextBox runat="server" ID="txtNull" Width="300" Text="NOT"></asp:TextBox>
            <span>NOT or blank for Null</span> 
            <br />
            <br />
            <asp:Label runat="server" ID="lblDefault" ForeColor="Maroon" Text="Default: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox runat="server" ID="txtDefault" Width="300"></asp:TextBox>
            <span>ZERO, BLANK, EMPTY, BATCH, GETDATE, HIGHDATE, or item 
            <br />
            </span> <br />
            <asp:Label runat="server" ID="lblFilter" ForeColor="Maroon" Text="Filter: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox runat="server" ID="txtFilter" Width="300"></asp:TextBox>
            <span>fstrField=xxxx</span> 
            <br />
            <br />
            <asp:Label runat="server" ID="lblOrderBy" ForeColor="Maroon" Text="OrderBy: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox runat="server" ID="txtOrderBy" Width="300"></asp:TextBox>
            <span>fstrField1, fstrField2</span> 
            <br />
            <br />
            <asp:Button runat="server" ID="btnAdd" Text="Add Entry" OnClick="OnClick_AddEntry" ></asp:Button> 
            <asp:Button runat="server" ID="btnTechTeam" Text="Tech Team" OnClick="OnClick_TechTeam" ></asp:Button> 
            <asp:Button runat="server" ID="btnScript" Text="Script" OnClick="OnClick_Script" ></asp:Button> 
            <asp:Button runat="server" ID="btnInstall" Text="Install" OnClick="OnClick_Install" ></asp:Button> 
            <asp:Button runat="server" ID="btnClear" Text="Clear File" OnClick="OnClick_Clear" ></asp:Button> 
            <asp:Button runat="server" ID="btnReLink" Text="Re-Link" OnClick="OnClick_ReLink" ></asp:Button> 
            <asp:Button runat="server" ID="btnNameLink" Text="Name-Link" OnClick="OnClick_NameLink" ></asp:Button> <br /> <br />

            <asp:Label runat="server" ID="LblPBatchId" ForeColor="Maroon" Text="Pull Batch: "></asp:Label>
            <asp:TextBox runat="server" ID="TxtPBatchId" Width="300"></asp:TextBox>
            <asp:Button runat="server" ID="BtnPBatchId" Text="Script Batch" OnClick="OnClick_PullBatch" ></asp:Button> <br /> <br />

            <asp:Label runat="server" ID="lblStatus" ForeColor="Maroon" Text="Status: "></asp:Label>
            <asp:Label runat="server" ID="lblOpStatus" ForeColor="Maroon" Text=" "></asp:Label>
        </div>

</asp:Content>
