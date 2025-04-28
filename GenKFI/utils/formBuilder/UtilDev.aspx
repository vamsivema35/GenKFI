<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UtilDev.aspx.cs" Inherits="GenKFI.utils.formBuilder.UtilDev" %>

<!DOCTYPE html>

<html>
<head>
<title></title>
	<script type="text/javascript" src="<%= ResolveClientUrl( "~/scripts/jquery-1.8.2.min.js" ) %>"></script>
	<script type="text/javascript" src="<%= ResolveClientUrl( "~/scripts/jquery-ui.min.js" ) %>"></script>
    <script type="text/javascript">
		    // check for enter key - use as tab unless it is the submit button
            // the space bar for checkbox (to stop checking next checkbox and fire the onclick event)
		    $(document).keydown(function (e) {
		        if (e.which == 9) {
		            if (e.shiftKey) {
		                var PrevInx = parseInt(e.target.tabIndex) - 1;
		                if (PrevInx > 10)                                   // Tab index starts at 11 for controls (skips labels and hidden fields)
		                {
		                        $('input[tabindex=' + PrevInx.toString() + ']').focus();
		                        $('input[tabindex=' + PrevInx.toString() + ']').select();
                        }
		                return false;
		            }
		            else {
		                return false;
		            }
		        }
		        if (e.which == 13)  {
		         //   e.which = 9;
		         //   return false;
		                var PrevInx = parseInt(e.target.tabIndex) + 1;
		                if (PrevInx > 10)                                   // Tab index starts at 11 for controls (skips labels and hidden fields)
		                {
		                        $('input[tabindex=' + PrevInx.toString() + ']').focus();
		                        $('input[tabindex=' + PrevInx.toString() + ']').select();
                        }
		                return false;
		        }
		        if ((e.which == 32) && (e.target.type == "checkbox")) {
		            e.which = 9;
		            return false;
		        }
		    });

			function ShowFormPick(curObj)
			{

				if( $("#<%=hidPick.ClientID %>").val() == "N")
				{
					$("#greyMe").css("display", "block");
					$("#greyMe").css("z-index", "99" );
					$("#FormPick").css( "z-index", "100");
					$("#greyMe").on( "click", function() {
						$("#greyMe").css("display", "none");
						$("#greyMe").css("z-index", "-1" );
						$("#FormPick").css( "z-index", "-1");
						FormPick.style.visibility = "hidden";
						$("#<%=hidPick.ClientID %>").val("N");
					});
					FormPick.style.visibility = "visible";
					$("#<%=hidPick.ClientID %>").val("Y");
				}
				else
				{
					$("#greyMe").css("display", "none");
					$("#greyMe").css("z-index", "-1" );
					$("#FormPick").css( "z-index", "-1");
					FormPick.style.visibility = "hidden";
					$("#<%=hidPick.ClientID %>").val("N");
				}
				return;
			}

        function SelectPickRow(strFormName) {
            $('#<%=hidFormName.ClientID %>').val(strFormName);
            FormPick.style.visibility = "hidden";
            $("#<%=hidPick.ClientID %>").val("N");
            $("#<%=formPickClick.ClientID %>").val("Y");
            document.getElementById("<%=PickForm.ClientID %>").click();
        }
        function RegImg(strFormname, strPosInBatch, strCamera) {
            $('#<%=hidFormName.ClientID %>').val(strFormname);
            $('#<%=hidPosition.ClientID %>').val(strPosInBatch);
            $('#<%=hidCamera.ClientID %>').val(strCamera);
            document.getElementById("<%=ShowImg.ClientID %>").click();
        }

        function ChgColor(tableRow, highlight) {
            if (highlight) {
                tableRow.style.background = "olive";
            }
            else {
                tableRow.style.background = "aqua";
            }
        }
        

    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div id="divHeaderBackground" runat="server" 
			style="position:absolute;
				   top:0px;
				   left:0px;
				   height:72px;
				   width:100%;
				   background-color:#F0E7BB;
				   border:solid 1px black;" > 
            <asp:Label runat="server" TabIndex="92" text="Utility" style="left:60px; top:24px; position:absolute; height:45px; font-size:20px; font-weight:bold;" />
			<asp:Label runat="server" ID="Formnamelbl"  Width="75" style="left:170px; top:8px; font-size:13px; color:black; position:absolute;" Text="Form Name:" ></asp:Label>
			<asp:Label runat="server" ID="Formnametxt"  Width="75" style="left:245px; top:8px; font-size:13px; color:black; position:absolute;" Text=""></asp:Label>
			<asp:Label runat="server" ID="Positionlbl"  Width="75" style="left:170px; top:29px; font-size:13px; color:black; position:absolute;" Text="Position:" ></asp:Label>
			<asp:Label runat="server" ID="Positiontxt"  Width="75" style="left:245px; top:29px; font-size:13px; color:black; position:absolute;" Text=""></asp:Label>
			<asp:Label runat="server" ID="Cameralbl"  Width="75" style="left:170px; top:50px; font-size:13px; color:black; position:absolute;" Text="Camera:" ></asp:Label>
			<asp:Label runat="server" ID="Cameratxt"  Width="75" style="left:245px; top:50px; font-size:13px; color:black; position:absolute;" Text=""></asp:Label>
			<asp:Label runat="server" ID="ImgSrclbl" Width="75" style="left:325px; top:8px; font-size:13px; color:black; position:absolute;" Text="Image Src:" ></asp:Label>
			<asp:Label runat="server" ID="ImgSrctxt" Width="75" style="left:400px; top:8px; font-size:13px; color:black; position:absolute;" Text=""></asp:Label>
			<asp:Label runat="server" ID="Offsetlbl" Width="75" style="left:325px; top:29px; font-size:13px; color:black; position:absolute;" Text="Offset:" ></asp:Label>
			<asp:Label runat="server" ID="Offsettxt" Width="75" style="left:400px; top:29px; font-size:13px; color:black; position:absolute;" Text=""></asp:Label>
			<asp:Label runat="server" ID="Sizelbl" Width="75" style="left:325px; top:50px; font-size:13px; color:black; position:absolute;" Text="Size:" ></asp:Label>
			<asp:Label runat="server" ID="Sizetxt" Width="75" style="left:400px; top:50px; font-size:13px; color:black; position:absolute;" Text=""></asp:Label>

            <asp:Button runat="server" ID="ShowImg" text="SI" style="left:450px; top:13px; position:absolute; height:45px; font-size:20px; font-weight:bold; visibility:hidden;" OnClick="OnClick_showImg" /> 
            <asp:Button runat="server" ID="PickForm" text="PF" style="left:500px; top:13px; position:absolute; height:45px; font-size:20px; font-weight:bold; visibility:hidden;" OnClick="OnClick_pickForm" /> 
            <asp:Button runat="server" ID="ClearTxtBTN" Text="Clear Choices" style="left:548px; top:13px; position:absolute; height:45px; font-size:20px; font-weight:bold;" OnClick="OnClick_ClearChoice" />
            <asp:Button runat="server" ID="GetRecBTN" Text="Get Rec" style="left:715px; top:13px; position:absolute; height:45px; font-size:20px; font-weight:bold;" OnClick="OnClick_GetRec" />
            <asp:Button runat="server" ID="UpdRecBTN" Text="Upd Rec" style="left:860px; top:13px; position:absolute; height:45px; font-size:20px; font-weight:bold;" OnClick="OnClick_UpdRec" />
        	<%--<asp:Button runat="server" ID="GetImageBTN" Text="Get Images" style="left:990px; top:13px; position:absolute; height:45px; font-size:20px; font-weight:bold;"  OnClick="OnClick_GetImages" />--%>
            <asp:Button runat="server" ID="ClearForm" Text="Clear Form" style="left:1122px; top:13px; position:absolute; height:45px; font-size:20px; font-weight:bold;" OnClick="OnClick_ClearForm" />
 			 <input id="BtnPick" tabindex="95" type="button" name="btnPick" value="Pick Form"
				 style="left:1332px; top:13px; position:absolute; height:45px; font-size:20px; font-weight:bold;"
				 onclick="ShowFormPick(this)" />
			<asp:button runat="server" id="SqlBTN" TabIndex="92" text="Sql" style="left:1454px; top:13px; position:absolute; height:45px; font-size:20px; font-weight:bold;" OnClick="OnClick_Sql" />
			<asp:button runat="server" id="homeBTN" TabIndex="92" text="Home" style="left:1600px; top:13px; position:absolute; height:45px; font-size:20px; font-weight:bold;" OnClick="OnClick_homeBTN" />
   	</div>
		<div id="FormPick"
			 style="position:absolute;
					background-color:aqua;
					overflow:auto;
					visibility: hidden;
					z-index:5;
					top:200px;
					width:500px;
					left:875px;" >
			
			<table id="tablePick" border="1" style="border-collapse:separate; border-spacing: 1px; padding: 1px; width: 240px; margin: 0 auto;">
				<thead>
					<tr><th colspan="5">Pick Form</th></tr>
					<tr>
						<th>FormName</th>
					</tr>
				</thead>
				<tbody>
					<asp:Literal runat="server" ID="formListLIT" Mode="PassThrough" ></asp:Literal>
				</tbody>
			</table>
		</div>
		<div 
			 id="divImage"
			 style="float:left;
					overflow:hidden;        
					position:absolute;
                    -webkit-transform: translateZ(0);
                    top:73px;
					left:0px;
					height:50%;
					width:50%;
                    border:solid 1px black;">

			<div id="divImageDrag" style="top:0px; left:0px;" >
				<asp:Image runat="server" ID="UdImage" Width="100%" />
			</div>

		</div>
		<div id="divControls"  
			 style="position:absolute; 
					overflow-x:hidden;
					overflow-y:scroll; 
                    -webkit-transform: translateZ(0);
					border:1px solid #ccc;
					top:73px;
					left:50%;
					height:50%;
					width:50%;
                    border:solid 1px black;" >

			<asp:HiddenField runat="server" ID="maxScrl" Value="0" />
			<div id="ctrlSizer">
				<asp:Literal runat="server" ID="controlsLIT" Mode="PassThrough" ></asp:Literal>
			</div>
			<!--	Table is Placed here for Controls / Entry  -->
			  
		</div>
        <div id="divleftEntry"
            style="position:absolute;
                   top:60%;
                   left:0%;
                   height:20%;
                   width:20%;
                   border:solid 1px black;" >
            <table>
        		<tr><td class="input_txt"><asp:TextBox runat="server" ID="Line1" MaxLength="50" TabIndex="21" Text="" ></asp:TextBox></td></tr>
        		<tr><td class="input_txt"><asp:TextBox runat="server" ID="Line2" MaxLength="50" TabIndex="22" Text="" ></asp:TextBox></td></tr>
        		<tr><td class="input_txt"><asp:TextBox runat="server" ID="Line3" MaxLength="50" TabIndex="23" Text="" ></asp:TextBox></td></tr>
        		<tr><td class="input_txt"><asp:TextBox runat="server" ID="Line4" MaxLength="50" TabIndex="24" Text="" ></asp:TextBox></td></tr>
        		<tr><td class="input_txt"><asp:TextBox runat="server" ID="Line5" MaxLength="50" TabIndex="25" Text="" ></asp:TextBox></td></tr>
        		<tr><td class="input_txt"><asp:TextBox runat="server" ID="Line6" MaxLength="50" TabIndex="26" Text="" ></asp:TextBox></td></tr>
        		<tr><td class="input_txt"><asp:TextBox runat="server" ID="Line7" MaxLength="50" TabIndex="27" Text="" ></asp:TextBox></td></tr>
            </table>
        </div>

        <div  id="divBotEntry"
			style="position:absolute;
				   top:60%;
				   left:40%;
				   height:20%;
				   width:20%;
				   border:solid 1px black;" > 
        	<table>
        		
		        	<tr><td class="input_lbl">Tax Pgm: </td>
        			<td class="input_cmb"><asp:DropDownList runat="server" ID="DdTaxPgm" TabIndex="11" ></asp:DropDownList></td></tr>
		        	<tr><td class="input_lbl">Batch: </td>
        			<td class="input_txt"><asp:TextBox runat="server" ID="BatchId" MaxLength="10" TabIndex="12" Text="" ></asp:TextBox></td></tr>	
		        	<tr><td class="input_lbl">BatchDate: </td>
        			<td class="input_txt"><asp:TextBox runat="server" ID="BatchDate" MaxLength="10" TabIndex="13" Text="" ></asp:TextBox></td></tr>	
		        	<tr><td class="input_lbl">Sequence: </td>
        			<td class="input_txt"><asp:TextBox runat="server" ID="SeqNbr" MaxLength="4" TabIndex="14" Text="" ></asp:TextBox></td></tr>
		        	<tr><td class="input_lbl">Img Table: </td>
        			<td class="input_txt"><asp:TextBox runat="server" ID="ImgTable" MaxLength="30" TabIndex="15" Text="" ></asp:TextBox></td></tr>
		        	<tr><td class="input_lbl">Rec Table: </td>
        			<td class="input_txt"><asp:TextBox runat="server" ID="RecTable" MaxLength="30" TabIndex="16" Text="" ></asp:TextBox></td></tr>
		        	<tr><td class="input_lbl">Tax Year: </td>
        			<td class="input_txt"><asp:TextBox runat="server" ID="TaxYear" MaxLength="15" TabIndex="17" Text="" ></asp:TextBox></td></tr>
                <tr></tr>

                
            </table>
        </div>
        <div id="divBotStatus"
				style="position:absolute;
					   top:82%;
					   left:40%;
					   height:6%;
					   width:20%;
					   border:solid 1px black;" > 
        	<table>
		        <tr>
        			<td class="input_lbl">Status: </td>
		        	<td><asp:TextBox runat="server" ID="OpStatus" ReadOnly="true" Text="" ></asp:TextBox></td>	
                </tr>
            </table>
        </div>
   		<!-- ************************************************** -->
		<!-- Hidden Inputs -->
		<!-- ************************************************** -->

		<asp:HiddenField runat="server" ID="formPickClick" Value="N" />
		<asp:HiddenField runat="server" ID="hidFormName" Value="" />
		<asp:HiddenField runat="server" ID="hidYYear" Value="" />
		<asp:HiddenField runat="server" ID="hidPosition" Value="" />
		<asp:HiddenField runat="server" ID="hidCamera" Value="" />

		<asp:HiddenField runat="server" ID="hidFormType" Value="" />
		<asp:HiddenField runat="server" ID="hidPick" Value="N" />

		<input type="hidden" id="imageOffsetHID" />
		<input type="hidden" id="divOffsetHID" />
        <input type="hidden" id="divRepTopBot" name="divRepTopBot" Value ="0"/>

    </form>
</body>

</html>
