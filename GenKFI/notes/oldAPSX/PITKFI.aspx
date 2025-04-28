<%@ page language="C#" autoeventwireup="true" inherits="KFI_PITKFI, App_Web_fkdcgdlj" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <!-- Mimic Internet Explorer 8 -->    
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />

    <title>Untitled</title>
    <link href="Styles.css" rel="stylesheet" type="text/css" />
    <script src="Validate.js" type="text/javascript"></script>          
</head>
<body onload="setFocus();windowSize();fncSetRotation();" style="overflow: hidden;">
<form id="form1" runat="server">

<!--**************************************************-->
<!--Address Message Box-->
<!--**************************************************-->
<div id="divAddressChange" runat="server"
     style="float:right;
	        position:absolute; 
	        top:350px;
	        height:100px;
	        width:800px;
	        text-align:left;
	        left:810px;
	        z-index:2;
	        border: solid 5px black;
	        visibility:hidden;
	        background-color:White;">
    <center style="margin:20px 20px;font-weight:bold;font-size:35px;">
    <input id="tmpAddressChanged" type="text" maxlength="1" value="N"
            style="width:18px;border:solid black 1px;height:45px;font-size:30px;"
            onkeyup="AddressChange();" />
    
    Address Changed ("Y" or "N") ? 
        
    </center>
</div>

<div id="divAddress" runat="server"
     style="float:right;
	        position:absolute; 
	        top:450px;
	        height:275px;
	        width:800px;
	        text-align:left;
	        left:810px;
	        z-index:2;
	        border: solid 5px black;
	        visibility:hidden;
	        background-color:White;
	        font-size:30px;
	        overflow:scroll;">	        
</div>

<!--**************************************************-->
<!--Header-->
<!--**************************************************-->
<div id="divHeader" style="position:absolute;left:812px;height:45px;width:2000px;" runat="server">

    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
        style="left:0px;position:absolute;height:45px;font-size:30px;z-index:3;" 
        UseSubmitBehavior="false" onclick="btnSubmit_Click" />
    <asp:Label ID="lblBatchID" runat="server" style="font-size:13px;left:150px;color:Black;position:relative;z-index:3;"></asp:Label><br />
    <asp:Label ID="lblItemNo" runat="server" style="font-size:13px;left:150px;color:Black;position:relative;z-index:3;"></asp:Label><br />
    <asp:Label ID="lblBatchDate" runat="server" style="font-size:13px;left:150px;color:Black;position:relative;z-index:3;"></asp:Label>
    
    <asp:Button ID="btnHome" runat="server" Text="Home" UseSubmitBehavior="false" PostBackUrl="~/Default.aspx"
        style="left:290px;
               top:0px;
               position:absolute;
               font-size:20px;
               z-index:3;
               font-weight:bold;" /> 
               
    <asp:Button ID="btnDetails" runat="server" Text="Batch Details" 
        UseSubmitBehavior="false"
        style="left:365px;
               top:0px;
               position:absolute;
               font-size:20px;
               z-index:3;
               font-weight:bold;" onclick="btnDetails_Click" />                    
</div>

<!--**************************************************-->
<!--Header Background-->
<!--**************************************************-->
<div id="divHeaderBackground" runat="server" 
    style="position:absolute;
           top:0px;
           left:0px;
           height:72px;
           width:100%;
           z-index:2;
           background-color:#F0E7BB;
           border:solid 1px black;" >
</div>

<!--**************************************************-->
<!--Image-->
<!--**************************************************-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.js"></script>
<script type="text/javascript">
    $(document).ready(function(){    
        $('#divImageDrag').draggable();        
        $("#divImageDrag").mouseover(function(){$("#divImageDrag").css("cursor","move");});         
    });
</script>
<div runat="server" 
     id="divImage"
     style="float:left;
	        margin:.5em 10px .5em 0;
	        overflow:hidden; 
	        position:absolute; 
	        border:1px solid #ccc;
	        width:790px;"> 	   
	<div id="divImageDrag" onclick="disableScroll();">     
    <asp:Image ID="imgImage" runat="server" style="position:absolute;left:0;" /> 
    </div>    

    <input type="button" id="btnRotate" onclick="fncImageRotate();"
        style="left:75px;
               top:0px;
               position:absolute;
               font-size:20px;
               z-index:3;
               font-weight:bold;" value="Rotate 90" />  
             
    <asp:Button ID="btnReject" runat="server" Text="Reject" 
        UseSubmitBehavior="false"
        style="left:370px;
               top:0px;
               position:absolute;
               font-size:20px;
               z-index:3;
               font-weight:bold;" onclick="btnReject_Click" />                 
               
    <asp:DropDownList ID="ddlForms" runat="server" 
        style="font-size:30px;top:0px;left:525px;color:Black;position:absolute;z-index:3;" 
        AutoPostBack="True" onselectedindexchanged="ddlForms_SelectedIndexChanged">
        </asp:DropDownList>    
</div>

<!--**************************************************-->
<!--Control Marker-->
<!--**************************************************-->
<div style="position:absolute;
            z-index:2;
            background-color:Green;
            height:49px;
            width:10px;
            top:454px;
            left:800px;">
</div>
          
<!--**************************************************-->
<!--Controls-->
<!--**************************************************-->                
<div id="divControls" runat="server"
     class="bodyNewReturn"
     style="float:right;
	        margin:.5em 10px .5em 0;
	        overflow:scroll; 
	        position:absolute; 
	        border:1px solid #ccc;
	        top:45px;
	        height:50%;
	        text-align:left;">	        	
</div>

<!--**************************************************-->
<!--Hidden Inputs-->
<!--**************************************************-->
<input type="hidden" id="hidLeft" value="0" />
<input type="hidden" id="hidTop" value="0" />
<input type="hidden" id="hidCurrentDepNum" value="0" />
<input type="hidden" id="hidDepNum" value="0" />
<input type="hidden" id="hidFormType" runat="server" />
<input type="hidden" id="hidServerImagePath" runat="server" />
<input type="hidden" id="hidRotate" value="0" runat="server" />

<input type="hidden" id="hidPSSN" runat="server" />
<input type="hidden" id="hidPFirstName" runat="server" />
<input type="hidden" id="hidPMiddleInitial" runat="server" />
<input type="hidden" id="hidPLastName" runat="server" />
<input type="hidden" id="hidPGenSuffix" runat="server" />
<input type="hidden" id="hidSFirstName" runat="server" />
<input type="hidden" id="hidSMiddleInitial" runat="server" />
<input type="hidden" id="hidSLastName" runat="server" />
<input type="hidden" id="hidSGenSuffix" runat="server" />
<input type="hidden" id="hidAddress" runat="server" />
<input type="hidden" id="hidCity" runat="server" />
<input type="hidden" id="hidState" runat="server" />
<input type="hidden" id="hidZip" runat="server" />
<input type="hidden" id="hidCountry" runat="server" />

<!--**************************************************-->
<!--Image Position-->
<!--**************************************************-->
<div id="divScroll" style="position:absolute;z-index:3;">
<img id="imgScroll" src="Images/ImgScroll.png" usemap="#Image-Map" width="57" height="53" alt="" />
<map id="_Image-Map" name="Image-Map">
<area shape="rect" coords="20,0,37,20" alt="Up" title="Up"
    href="javascript:"
    onmousedown="startMove('up');"
    onmouseup="stopMove();"
    onmouseout="stopMove();this.blur();" />
<area shape="rect" coords="20,32,35,50" alt="Down" title="Down"
    href="javascript:"
    onmousedown="startMove('down');"
    onmouseup="stopMove();"
    onmouseout="stopMove();this.blur();" />
<area shape="rect" coords="37,20,54,34" alt="Right" title="Right"
    href="javascript:"
    onmousedown="startMove('right');"
    onmouseup="stopMove();"
    onmouseout="stopMove();this.blur();" />
<area shape="rect" coords="0,20,18,34"alt="Left" title="Left"
    href="javascript:"
    onmousedown="startMove('left');"
    onmouseup="stopMove();"
    onmouseout="stopMove();this.blur();" />
</map>
</div>

<div id="divMsg" style="position:absolute;width:100%;height:100%;background-color:Gray;z-index:1;visibility:hidden;-ms-filter: 'progid:DXImageTransform.Microsoft.Alpha(Opacity=50)';">
    <table style="width:100%;height:100%;"><tr style="vertical-align:middle;"><td style="text-align:center;font-size:40px;">                
    <asp:Image ID="imgLoad" ImageUrl="Images/Warning.png" style="position:relative;" runat="server" />            
    </td></tr></table>
</div>
 
</form>
</body>
</html>
