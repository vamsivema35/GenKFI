<%@ page language="C#" autoeventwireup="true" inherits="KFI_PITEDCR, App_Web_fkdcgdlj" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!-- Mimic Internet Explorer 8 -->    
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />

    <title>Untitled</title>
    <link href="Styles.css" rel="stylesheet" type="text/css" />
    <script src="Validate.js" type="text/javascript"></script>  
</head>
<body onload="setFocus();windowSize();" style="overflow: hidden;">
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
        style="left:0px;position:absolute;height:45px;font-size:30px;" 
        UseSubmitBehavior="false" onclick="btnSubmit_Click" />
    <asp:Label ID="lblBatchID" runat="server" style="font-size:14px;left:150px;color:Black;position:relative;"></asp:Label><br />
    <asp:Label ID="lblItemNo" runat="server" style="font-size:14px;left:150px;color:Black;position:relative;"></asp:Label><br />
    <asp:Label ID="lblBatchDate" runat="server" style="font-size:14px;left:150px;color:Black;position:relative;"></asp:Label>

    <asp:DropDownList ID="ddlForms" runat="server" 
        style="font-size:30px;top:0px;left:315px;color:Black;position:absolute;" 
        AutoPostBack="True" onselectedindexchanged="ddlForms_SelectedIndexChanged">
        </asp:DropDownList>    
        
    <asp:Button ID="btnHome" runat="server" Text="Home" UseSubmitBehavior="false" PostBackUrl="~/Default.aspx"
        style="left:575px;
               top:0px;
               position:absolute;
               font-size:20px;
               z-index:1;
               font-weight:bold;
               background-color:White;"
             />    
    <asp:Button ID="btnDetails" runat="server" Text="Batch Details" 
        UseSubmitBehavior="false"
        style="left:800px;
               top:0px;
               position:absolute;
               font-size:20px;
               z-index:1;
               font-weight:bold;
               background-color:White;" onclick="btnDetails_Click"
             />
</div>

<!--**************************************************-->
<!--Image-->
<!--**************************************************-->
<div runat="server" 
     id="divImage"
     style="visibility:hidden;width:800px;"> 	       
    <asp:Image ID="imgImage" runat="server" />
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
	        text-align:left;
	        left:810px;
	        width:100%;"></div>
	        
<!--**************************************************-->
<!--Hidden Inputs-->
<!--**************************************************-->
<input type="hidden" id="hidLeft" value="0" />
<input type="hidden" id="hidTop" value="0" />
<input type="hidden" id="hidCurrentDepNum" value="0" />
<input type="hidden" id="hidDepNum" value="0" />
<input type="hidden" id="hidFormType" runat="server" />
<input type="hidden" id="hidServerImagePath" runat="server" />

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


</form>
</body>
</html>
