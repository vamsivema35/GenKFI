<%@ Page Title="" Language="C#" MasterPageFile="~/GenKFI.Master" AutoEventWireup="true" CodeBehind="MavImgView.aspx.cs" Inherits="GenKFI.utils.MavImgView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headHolder" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="bodyHolder" runat="server">
	<asp:Button runat="server" ID="btnMavImg" TabIndex="15" Text="Mav" Visible="true" 
        style="left:1280px; top:13px; position:absolute; height:2px; font-size:2px; font-weight:bold;" OnClick="Load_Detail" />

	<asp:Table runat="server" ID="batchCntTBL" Width="50%">
		<asp:TableRow>
			<asp:TableCell runat="server" Width="125">Batch:</asp:TableCell>
			<asp:TableCell runat="server" ID="BatchId" Width="170"></asp:TableCell>
			<asp:TableCell runat="server" Width="125">Batch Date:</asp:TableCell>
			<asp:TableCell runat="server" ID="BatchDate" Width="170"></asp:TableCell>
			<asp:TableCell runat="server" Width="125">Image Source:</asp:TableCell>
			<asp:TableCell runat="server" ID="ImageSource" Width="170"></asp:TableCell>
			<asp:TableCell runat="server" Width="125">Tax Pgm:</asp:TableCell>
			<asp:TableCell runat="server" ID="TaxPgm" Width="170"></asp:TableCell>
			<asp:TableCell runat="server" Width="125">Header Count:</asp:TableCell>
			<asp:TableCell runat="server" ID="HdrCount" Width="170"></asp:TableCell>
			<asp:TableCell runat="server" Width="125">Item Count:</asp:TableCell>
			<asp:TableCell runat="server" ID="ItemCount" Width="170"></asp:TableCell>
			<asp:TableCell runat="server" Width="125">Item Amount:</asp:TableCell>
			<asp:TableCell runat="server" ID="ItemAmount" Width="170"></asp:TableCell>
			<asp:TableCell runat="server" Width="125">Pym Amount:</asp:TableCell>
			<asp:TableCell runat="server" ID="PymAmount" Width="170"></asp:TableCell>
			<asp:TableCell runat="server" ID="PymTbl" Width="170"></asp:TableCell>
			<asp:TableCell runat="server" ID="SeqTop" Width="170"></asp:TableCell>
			<asp:TableCell runat="server" ID="SeqBot" Width="170"></asp:TableCell>
		</asp:TableRow>
	</asp:Table>
	<br />
    <div style="width:100%; left:200px;">
    	    <asp:Button runat="server" ID="btnMavPrv" Text="< Prev" Visible="true" 
                 style  ="left:290px; position:absolute; height:26px; width:50px; font-size:12px; font-weight:bold;" OnClick="Load_Prev" />
            <asp:Label runat="server" ID="lblInfo" Text="" 
                 style = "left:390px; position:absolute; height:26px; width:100px; font-size:12px; font-weight:bold;" />
	        <asp:Button runat="server" ID="btnMavNxt" Text="> Next" Visible="true" 
                 style="left:490px; position:absolute; height:26px; width:50px; font-size:12px; font-weight:bold;" OnClick="Load_Next" />
    <div style="width:70%; text-align:right;">
         <asp:Literal runat="server" ID="RtnModify" Mode="PassThrough"></asp:Literal>
        <asp:Label runat="server" ID="lblEnter" Text="&nbsp;&nbsp;&nbsp;&nbsp; Key Entry Sequence: " />
        <asp:Literal runat="server" ID="ToEntry" Mode="PassThrough"></asp:Literal>
    </div>
    </div>
	<br />
         <div>
          <asp:Table runat="server" ID="Table1" Height="100%" Width="100%">
              <asp:TableRow>
                  <asp:TableCell Width="20%" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                      <asp:Label runat="server" ID="Label2" Text="*Sequence/Payment" Font-Size="Small"/><br />
                      <asp:PlaceHolder runat="server" ID="MavImgAmt" />       
                  </asp:TableCell>
                  <asp:TableCell Width="30%" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                      <asp:Label runat="server" ID="Label1" Text="*Click to view details" Font-Size="Small"/><br />
                      <asp:PlaceHolder runat="server" ID="MavImgStub" />       
                  </asp:TableCell>
                   <asp:TableCell Width="50%" BorderColor="Blue" BorderStyle="dashed" BorderWidth="1">
                      <asp:Label runat="server" ID="SeqHld" Text="*Seq" Font-Size="Small"/><br />
                      <asp:PlaceHolder runat="server" ID="MavImgDetail" /><br />
                 </asp:TableCell>
              </asp:TableRow>
          </asp:Table>
      </div>
 
		<script type="text/javascript" src="<%= ResolveClientUrl( "~/scripts/jquery-1.8.2.min.js" ) %>"></script>
		<script type="text/javascript" src="<%= ResolveClientUrl( "~/scripts/jquery-ui.min.js" ) %>"></script>

      <script type="text/javascript">
          function Load_It(SeqKey) {
              $("#<%= ( (HiddenField)Master.FindControl("hidSeqKey")).ClientID%>").val(SeqKey);
              document.getElementById("<%=btnMavImg.ClientID%>").click();
          }
      </script>
 
</asp:Content>

