<%@ Page Language="C#" MasterPageFile="~/forms.Master" AutoEventWireup="True" CodeBehind="KeyEntry.aspx.cs" Inherits="GenKFI.utils.entry.KeyEntry" %>

<asp:Content ID="headerContent" ContentPlaceHolderID="headerHolder" runat="server">
    <!-- ************************************************** -->
    <!--  Header Controls -->
    <!-- ************************************************** -->

    <div id="divHeader" style="position: absolute; top: 0px; left: 0px; height: 72px; width: 100%;" runat="server">

        <table style="left: 325px; position: relative;">
            <tr>
                <td>
                    <asp:Label runat="server" ID="batchIDLBL" CssClass="headerInput" Width="75" Text="Batch ID:"></asp:Label></td>
                <td>
                    <asp:Label runat="server" ID="batchIDTXT" CssClass="headerInput" Width="75"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="batchDateLBL" CssClass="headerInput" Width="75" Text="Batch Date:"></asp:Label></td>
                <td>
                    <asp:Label runat="server" ID="batchDateTXT" CssClass="headerInput" Width="75"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="itemNoLBL" CssClass="headerInput" Width="75" Text="Item No:"></asp:Label></td>
                <td>
                    <asp:Label runat="server" ID="itemNoTXT" CssClass="headerInput" Width="75"></asp:Label></td>
            </tr>
        </table>

        <asp:Label runat="server" ID="ImgSrclbl" Width="75" Style="left: 480px; top: 8px; font-size:14px; color: black; position: absolute;" Text="Image Src:"></asp:Label>
        <asp:Label runat="server" ID="ImgSrctxt" Width="75" Style="left: 555px; top: 8px; font-size:14px; color: black; position: absolute;" Text=""></asp:Label>
        <asp:Label runat="server" ID="Titlelbl" Width="75" Style="left: 480px; top: 29px; font-size:14px; color: black; position: absolute;" Text="Title:"></asp:Label>
        <asp:Label runat="server" ID="Titletxt" Width="75" Style="left: 555px; top: 29px; font-size:14px; color: black; position: absolute;" Text=""></asp:Label>
        <asp:Label runat="server" ID="Blocklbl" Width="75" Style="left: 480px; top: 50px; font-size:14px; color: black; position: absolute;" Text="Blk:"></asp:Label>
        <asp:Label runat="server" ID="Blocktxt" Width="75" Style="left: 555px; top: 50px; font-size:14px; color: black; position: absolute;" Text=""></asp:Label>

        <asp:Label runat="server" ID="DocNbrlbl" Width="75" Style="left: 640px; top: 8px; font-size:14px; color: black; position: absolute;" Text="Doc No."></asp:Label>
        <asp:Label runat="server" ID="DocNbrtxt" Width="75" Style="left: 715px; top: 8px; font-size:14px; color: black; position: absolute;" Text=""></asp:Label>
        <asp:Label runat="server" ID="Offsetlbl" Width="75" Style="left: 640px; top: 29px; font-size:14px; color: black; position: absolute;" Text="Offset:"></asp:Label>
        <asp:Label runat="server" ID="Offsettxt" Width="75" Style="left: 715px; top: 29px; font-size:14px; color: black; position: absolute;" Text=""></asp:Label>
        <asp:Label runat="server" ID="Sizelbl" Width="75" Style="left: 640px; top: 50px; font-size:14px; color: black; position: absolute;" Text="Size:"></asp:Label>
        <asp:Label runat="server" ID="Sizetxt" Width="75" Style="left: 715px; top: 50px; font-size:14px; color: black; position: absolute;" Text=""></asp:Label>

        <asp:Label runat="server" ID="TaxPgmlbl" Width="75" Style="left: 800px; top: 8px; font-size:14px; color: black; position: absolute;" Text="Tax Pgm:"></asp:Label>
        <asp:Label runat="server" ID="TaxPgmtxt" Width="75" Style="left: 875px; top: 8px; font-size:14px; color: black; position: absolute;" Text=""></asp:Label>
        <asp:Label runat="server" ID="PymTypelbl" Width="75" Style="left: 800px; top: 29px; font-size:14px; color: black; position: absolute;" Text="Pym Type:"></asp:Label>
        <asp:Label runat="server" ID="PymTypetxt" Width="75" Style="left: 875px; top: 29px; font-size:14px; color: black; position: absolute;" Text=""></asp:Label>
        <asp:Label runat="server" ID="Timelylbl" Width="75" Style="left: 800px; top: 50px; font-size:14px; color: black; position: absolute;" Text="Timely:"></asp:Label>
        <asp:Label runat="server" ID="Timelytxt" Width="75" Style="left: 875px; top: 50px; font-size:14px; color: black; position: absolute;" Text=""></asp:Label>

        <asp:Button runat="server" ID="CountryChk" TabIndex="1" Text="Country" Visible="false" Style="left: 5%; top: 38px; position: absolute; height: 30px; width: 120px; font-size: 14px; font-weight: bold;" OnClick="CallLoadCountryName" />

        <asp:Button runat="server" ID="btnSub" TabIndex="81" Text="Submit" Style="left: 950px; top: 10px; position: absolute; height: 30px; font-size: 14px; font-weight: bold;" OnClientClick="if(!checkRequired()) return false;" OnClick="OnClick_btnSub" />

        <asp:Button runat="server" ID="homeBTN" TabIndex="82" Text="Home" Style="left: 1050px; top: 10px; position: absolute; height: 30px; font-size:14px; font-weight: bold;" OnClick="OnClick_homeBTN" />

        <asp:Button runat="server" ID="TimelyBTN" TabIndex="83" Text="Timely" Style="left: 1130px; top: 10px; position: absolute; height: 30px; font-size:14px; font-weight: bold;" OnClick="OnClick_TimelyBTN" />

        <input id="BtnPick" tabindex="85" type="button" name="btnPick" value="Show Forms"
            style="left: 1220px; top: 10px; position: absolute; height: 30px; font-size:14px; font-weight: bold;"
            onclick="ShowFormPick(this)" />

        <asp:Button runat="server" ID="OgdBtn" TabIndex="91" Text="41374" Visible="false" Style="left: 1320px; top: 8px; position: absolute; height: 17px; font-size:14px; font-weight: bold;" OnClick="OnClick_OgdBtn" />
        <asp:Button runat="server" ID="O85Btn" TabIndex="92" Text="41285" Visible="false" Style="left: 1320px; top: 29px; position: absolute; height: 17px; font-size:14px; font-weight: bold;" OnClick="OnClick_O85Btn" />
        <asp:Button runat="server" ID="O99Btn" TabIndex="93" Text="1099  " Visible="false" Style="left: 1320px; top: 50px; position: absolute; height: 17px; font-size:14px; font-weight: bold;" OnClick="OnClick_O99Btn" />
        <asp:Button runat="server" ID="OirBtn" TabIndex="94" Text="InfRtn" Visible="false" Style="left: 1420px; top: 8px; position: absolute; height: 17px; font-size:14px; font-weight: bold;" OnClick="OnClick_OirBtn" />
        <asp:Button runat="server" ID="OsfBtn" TabIndex="95" Text="SubFrm" Visible="false" Style="left: 1420px; top: 29px; position: absolute; height: 17px; font-size:14px; font-weight: bold;" OnClick="OnClick_OsfBtn" />
        <asp:Button runat="server" ID="OsrBtn" TabIndex="96" Text="StmRec" Visible="false" Style="left: 1420px; top: 50px; position: absolute; height: 17px; font-size:14px; font-weight: bold;" OnClick="OnClick_OsrBtn" />
        <asp:Button runat="server" ID="OasBtn" TabIndex="97" Text="AnnSum" Visible="false" Style="left: 1520px; top: 8px; position: absolute; height: 17px; font-size:14px; font-weight: bold;" OnClick="OnClick_OasBtn" />

        <asp:Label runat="server" ID="adminKeyModeLBL" Text="Key Mode<br />Click HOME To Return" Visible="false" Style="left: 1620px; top: 12px; position: absolute; height: 30px; font-size: 16px; font-weight: bold; color: red;"></asp:Label>

    </div>
</asp:Content>

<asp:Content runat="server" ID="scriptingContent" ContentPlaceHolderID="scriptingHolder">
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
            if ((e.which == 13) && !(e.target.type == "submit")) {
                e.which = 9;
                return false;
            }
            if ((e.which == 32) && (e.target.type == "checkbox")) {
                e.which = 9;
                return false;
            }
        });
        // a function to do the lookup for a TP's info, set on a flag in the DB, and the page adds the appropriate function call in the onCheck
        function rtnLookUp(Id, IdType, callerName, AcctType, boolIfFound) {
            var IdHoldType = IdType;
            // using jQuery, get the search page
            $.post("<%= ResolveClientUrl( "~/noFront/DoLookup.ashx" ) %>" + "?id=" + Id + "&idtype=" + IdType + "&accttype=" + AcctType,
                    function (data) {
                        // check if boolIfFound was passed
                        boolIfFound = (typeof boolIfFound === 'undefined' ? '' : boolIfFound);

                        // if this is a closed batch, don't do anything
                        if (data != "NoInfo" && data != "" && $('#<%= btnSub.ClientID %>').attr("disabled") == null) {
                            var pData = data['primary'];
                            var sData = data['secondary'];

                            // check for a repeater index
                            var repeaterIndex = callerName.substring(callerName.length - 1);
                            if (isNaN(repeaterIndex))
                                repeaterIndex = '';

                            // match the ID to PSSN or SSSN, if there, otherwise just continue as usual
                            if ($('#txtPSSN' + repeaterIndex).length != 0) {
                                if ($.trim($('#txtPSSN' + repeaterIndex).val().replace(/-/g, '')) == data['primary']['fstrID']) {
                                    pData = data['primary'];
                                    sData = data['secondary'];
                                }
                                else {
                                    pData = data['secondary'];
                                    sData = data['primary'];
                                }
                            }

                            // if something was returned, check the box, if needed
                            if (boolIfFound != '') {
                                if (pData['fstrID'] != '')
                                    $('#' + boolIfFound).val('1');
                                else
                                    $('#' + boolIfFound).val('0');
                            }

                            // put values in regardless of existing
                            // primary
                            // if no primary ID, don't fill
                            // if tax program is PIT and the caller is the primary SSN, then fill primary
                            // if tax program is not PIT, just fill
                            if (pData['fstrID'] != '' && (($("#<%=taxProgHID.ClientID %>").val() == 'PIT' && callerName == 'txtPSSN' + repeaterIndex) || ($("#<%=taxProgHID.ClientID %>").val() != 'PIT'))) {
                            // replace values if: keying PIT, field is already empty, IdType is FEIN
//								if($('#txtName' + repeaterIndex).length != 0 && ($("#<%=taxProgHID.ClientID %>").val() == 'PIT' || $('#txtName' + repeaterIndex).val() == '') || IdType == 'EIN')
                                if ($('#txtName' + repeaterIndex).length != 0 && $('#txtName' + repeaterIndex).val() == '')
                                    $('#txtName' + repeaterIndex).val(pData['fstrListFormatName']);

//								if($('#txtPFirst' + repeaterIndex).length != 0 && ($("#<%=taxProgHID.ClientID %>").val() == 'PIT' || $('#txtPFirst' + repeaterIndex).val() == '') || IdType == 'EIN')
                                if ($('#txtPFirst' + repeaterIndex).length != 0 && $('#txtPFirst' + repeaterIndex).val() == '')
                                    $('#txtPFirst' + repeaterIndex).val(pData['fstrFirstName']);

//								if($('#txtPMiddle' + repeaterIndex).length != 0 && ($("#<%=taxProgHID.ClientID %>").val() == 'PIT' || $('#txtPMiddle' + repeaterIndex).val() == '') || IdType == 'EIN')
                                if ($('#txtPMiddle' + repeaterIndex).length != 0 && $('#txtPMiddle' + repeaterIndex).val() == '')
                                    $('#txtPMiddle' + repeaterIndex).val(pData['fstrMiddleName']);

//								if($('#txtPLast' + repeaterIndex).length != 0 && ($("#<%=taxProgHID.ClientID %>").val() == 'PIT' || $('#txtPLast' + repeaterIndex).val() == '') || IdType == 'EIN')
                                if ($('#txtPLast' + repeaterIndex).length != 0 && $('#txtPLast' + repeaterIndex).val() == '')
                                    $('#txtPLast' + repeaterIndex).val(pData['fstrFamilyName']);

//								if($('#txtPSuffix' + repeaterIndex).length != 0 && ($("#<%=taxProgHID.ClientID %>").val() == 'PIT' || $('#txtPSuffix' + repeaterIndex).val() == '') || IdType == 'EIN')
                                if ($('#txtPSuffix' + repeaterIndex).length != 0 && $('#txtPSuffix' + repeaterIndex).val() == '')
                                    $('#txtPSuffix' + repeaterIndex).val(pData['fstrSuffix']);

//								if($('#txtStreet' + repeaterIndex).length != 0 && ($("#<%=taxProgHID.ClientID %>").val() == 'PIT' || $('#txtStreet' + repeaterIndex).val() == '') || IdType == 'EIN')
                                if ($('#txtStreet' + repeaterIndex).length != 0 && $('#txtStreet' + repeaterIndex).val() == '')
                                    $('#txtStreet' + repeaterIndex).val(pData['fstrStreet']);

//								if($('#txtCity' + repeaterIndex).length != 0 && ($("#<%=taxProgHID.ClientID %>").val() == 'PIT' || $('#txtCity' + repeaterIndex).val() == '') || IdType == 'EIN')
                                if ($('#txtCity' + repeaterIndex).length != 0 && $('#txtCity' + repeaterIndex).val() == '')
                                    $('#txtCity' + repeaterIndex).val(pData['fstrCity']);

//								if($('#txtState' + repeaterIndex).length != 0 && ($("#<%=taxProgHID.ClientID %>").val() == 'PIT' || $('#txtState' + repeaterIndex).val() == '') || IdType == 'EIN')
                                if ($('#txtState' + repeaterIndex).length != 0 && $('#txtState' + repeaterIndex).val() == '')
                                    $('#txtState' + repeaterIndex).val(pData['fstrState']);

//								if($('#txtZipCode' + repeaterIndex).length != 0 && ($("#<%=taxProgHID.ClientID %>").val() == 'PIT' || $('#txtZipCode' + repeaterIndex).val() == '') || IdType == 'EIN')
                                if ($('#txtZipCode' + repeaterIndex).length != 0 && $('#txtZipCode' + repeaterIndex).val() == '')
                                    $('#txtZipCode' + repeaterIndex).val(pData['fstrZip']);

//								if($('#txtCountry' + repeaterIndex).length != 0 && ($("#<%=taxProgHID.ClientID %>").val() == 'PIT' || $('#txtCountry' + repeaterIndex).val() == '') || IdType == 'EIN')
                                if ($('#txtCountry' + repeaterIndex).length != 0 && $('#txtCountry' + repeaterIndex).val() == '')
                                    $('#txtCountry' + repeaterIndex).val(pData['fstrCountry']);
                            }
                            if (IdHoldType == 'FIS' && ($('#txtFisIdType' + repeaterIndex.length != 0))) {
                                $('#txtFisIdType' + repeaterIndex).val(pData['fstrRealIdType']);
                                $('#txtTpName' + repeaterIndex).val(pData['fstrListFormatName']);
                                $('#txtBusName' + repeaterIndex).val(pData['fstrListFormatName']);
                            }
                            if (IdHoldType == 'OGT' && ($('#txtOgtIdType' + repeaterIndex.length != 0))) {
                                $('#txtOgtIdType' + repeaterIndex).val(pData['fstrRealIdType']);
                                $('#txtBusName' + repeaterIndex).val(pData['fstrListFormatName']);
                                if ($('#txtTpName' + repeaterIndex).val() == '')
                                    $('#txtTpName' + repeaterIndex).val(pData['fstrListFormatName']);
                                //                                $('#txtTpName' + repeaterIndex).val(pData['fstrListFormatName']);
                            }
                            // secondary
                            if ($('#txtSpSSN' + repeaterIndex).length != 0 && sData['fstrID'].length != 0) {
                                $('#txtSpSSN' + repeaterIndex).val(sData['fstrID']);
                                fmtSsn($('#txtSpSSN' + repeaterIndex).get()[0]);
                            }
                            /* this is hidden on PIT, only need to set once above
                            on all others, this is clearing it, so it was removed
                            if($('#txtName').length != 0)
                                $('#txtName').val(sData['fstrListFormatName']);
                            */
                            if ($('#txtSFirst' + repeaterIndex).length != 0 && $('#txtSFirst' + repeaterIndex).val() == '')
                                $('#txtSFirst' + repeaterIndex).val(sData['fstrFirstName']);

                            if ($('#txtSMiddle' + repeaterIndex).length != 0 && $('#txtSMiddle' + repeaterIndex).val() == '')
                                $('#txtSMiddle' + repeaterIndex).val(sData['fstrMiddleName']);

                            if ($('#txtSLast' + repeaterIndex).length != 0 && $('#txtSLast' + repeaterIndex).val() == '')
                                $('#txtSLast' + repeaterIndex).val(sData['fstrFamilyName']);

                            if ($('#txtSSuffix' + repeaterIndex).length != 0 && $('#txtSSuffix' + repeaterIndex).val() == '')
                                $('#txtSSuffix' + repeaterIndex).val(sData['fstrSuffix']);

                        }
                    });
        }

        var oTop = oLeft = 0;
        $(document).ready(function () {
            $('#<%=btnSub.ClientID %>').blur(function () {
                    $('#<%=btnSub.ClientID %>').css('background-color', '');
                });
            });

        function ShowFormPick(curObj) {

            if ($("#<%=hidPick.ClientID %>").val() == "N") {
                    $("#greyMe").css("display", "block");
                    $("#greyMe").css("z-index", "99");
                    $("#FormPick").css("z-index", "100");
                    $("#greyMe").on("click", function () {
                        $("#greyMe").css("display", "none");
                        $("#greyMe").css("z-index", "-1");
                        $("#FormPick").css("z-index", "-1");
                        FormPick.style.visibility = "hidden";
                        $("#<%=hidPick.ClientID %>").val("N");
                    });
                    FormPick.style.visibility = "visible";
                    $("#<%=hidPick.ClientID %>").val("Y");
                }
                else {
                    $("#greyMe").css("display", "none");
                    $("#greyMe").css("z-index", "-1");
                    $("#FormPick").css("z-index", "-1");
                    FormPick.style.visibility = "hidden";
                    $("#<%=hidPick.ClientID %>").val("N");
            }
            return;
        }

        function SelectPickRow(strDln, lngBlock, strTitle, strFormName) {
            $('#<%=hidFormName.ClientID %>').val(strFormName);
                $('#<%=hidTitle.ClientID %>').val(strTitle);
                $('#<%=hidBlock.ClientID %>').val(lngBlock);
                $('#<%=hidDln.ClientID %>').val(strDln);
                FormPick.style.visibility = "hidden";
                $("#<%=hidPick.ClientID %>").val("N");
                $("#<%=formPickClick.ClientID %>").val("Y");
            document.forms[0].submit();
        }

        // this function will save the values of the passed control in 'theVals' for processing later on Submit
        function saveTheVal(currObj) {
            // [controlName]{controlData}&[controlName]{controlData}&
            var theVals = $("#<%= theVals.ClientID %>").val();
                var cName = "[" + currObj.id + "]";
                var cVal = "{" + currObj.value + "}";
                // if we have neither the name nor the value
                if (theVals.indexOf(cName + cVal) == -1) {
                    // if we only have the name
                    if (theVals.indexOf(cName) != -1) {
                        // remove the name and old value
                        var start = theVals.indexOf(cName);
                        var end = theVals.indexOf("}&", start) + 2;
                        theVals = theVals.replace(theVals.substring(start, end), "");
                    }
                    // add both
                    $("#<%= theVals.ClientID %>").val(theVals + cName + cVal + "&");
            }
            // otherwise do nothing
        }
        function SaveTheFocus(currObj) {
            // Save OnFocus location for Mavro Image Move
            var ccName = currObj.id;
            $("#<%= ( (HiddenField)Master.FindControl("hidSaveFocus")).ClientID%>").val(ccName);
                var repinx = currObj.id.substring(currObj.id.length - 1);
                if (isNaN(repinx))
                    repinx = '';
                $("#<%=((HiddenField)Master.FindControl("keCountryHID")).ClientID %>").val("txtCountry" + repinx);
        }

        // Required Field been Touched - Saved for DropDown of Country

        function AddTouch(currObj) {

            var arTotStr = $("#<%= ( (HiddenField)Master.FindControl("hidTouchName")).ClientID%>").val();
                var arTName = $("#<%= ( (HiddenField)Master.FindControl("hidTouchName")).ClientID%>").val().split(';');
                var FindIt = "No";
                var strValue = currObj.id + "Touched";

                if (arTName.length > 1) {
                    for (var i = 0; i < arTName.length - 1; i++) {
                        if (strValue == arTName[i]) {
                            FindIt = "Yes";
                            break;
                        }
                    }
                    if (FindIt == "No") {
                        arTotStr += strValue + ";";
                        $("#<%= ( (HiddenField)Master.FindControl("hidTouchName")).ClientID%>").val(arTotStr.toString());
                    }
                }
                else {
                    arTotStr += strValue + ";";
                    $("#<%= ( (HiddenField)Master.FindControl("hidTouchName")).ClientID%>").val(arTotStr.toString());
            }
        }

        // check the required names for content
        // if at least one is empty, return false

        function checkRequired() {
            // if we are in view mode, no need to check
            // though this will probably never get called, since the submit button will already be disabled
            // Find what Called - Previous Field
            //			    event.returnValue = false;

            if ($("#<%= ( (HiddenField)Master.FindControl( "typeHID" ) ).ClientID %>").val() == "view")
                    return true;

                var names = $("#<%= requiredNamesHID.ClientID %>").val().split(';');
            // last one is empty by construction
            if (names.length > 1) {

                for (var i = 0; i < names.length - 1; i++) {
                    /* @@@ 2015-05-04
                    note this will also fail a required field with a legitimate value of zero
                    we'll have to deal with that later, if it ever comes up
                    currently the only required fields are ID numbers and filing status on PIT
                    which are all positive, non-zero values, so it should be okay for now
                    @@@ */
                    // at least one still empty, fail
                    // at least one value field has default value
                    // at least one not touched (touched still has default value), fail
                    if ($.trim($('#' + names[i]).val()) == "" ||
                        $.trim($('#' + names[i]).val()) == "0" ||
                        $.trim($('#' + names[i] + "Touched").val()) == "-1") {
                        alert("Not all Required Fields are filled!");
                        return false;
                    }
                }
                // didn't return false, so all must be okay, carry on
                return true;
            }
            // nothing in the list, just return true
            return true;
        }

    </script>
</asp:Content>

<asp:Content runat="server" ID="rightContent" ContentPlaceHolderID="rightHolder">
    <!-- ************************************************ -->
    <!-- Pick Form from Table -->
    <!-- ************************************************ -->
    <div id="greyMe" style="height: 100%; width: 100%; top: 0px; left: 0px; position: fixed; display: none; background-color: black; opacity: 0.5;">
    </div>

    <div id="FormPick" style="position: absolute; background-color: aqua; overflow: auto; visibility: hidden; z-index: 5; top: 10px; width: 500px; left: 1400px;">

        <table id="tablePick" border="1" style="border-collapse: separate; border-spacing: 1px; padding: 1px; width: 480px; margin: 0 auto;">
            <thead>
                <tr>
                    <th colspan="7">Pick Form</th>
                </tr>
                <tr>
                    <th>Form</th>
                    <th>Title</th>
                    <th>Block</th>
                    <th>Status</th>
                    <th>Changed</th>
                    <th>DLN</th>
                    <th>DocId</th>
                </tr>
            </thead>
            <tbody>
                <asp:Literal runat="server" ID="formListLIT" Mode="PassThrough"></asp:Literal>
            </tbody>
        </table>
    </div>
</asp:Content>


<asp:Content runat="server" ID="hiddenContent" ContentPlaceHolderID="hiddenHolder">
    <!-- ************************************************** -->
    <!-- Hidden Inputs -->
    <!-- ************************************************** -->

    <asp:HiddenField runat="server" ID="formPickClick" Value="N" />
    <asp:HiddenField runat="server" ID="hidFormName" Value="" />
    <asp:HiddenField runat="server" ID="hidTitle" Value="" />
    <asp:HiddenField runat="server" ID="hidBlock" Value="" />
    <asp:HiddenField runat="server" ID="hidDln" Value="" />
    <asp:HiddenField runat="server" ID="hidDocNumber" Value="" />
    <asp:HiddenField runat="server" ID="hidRec" Value="" />
    <asp:HiddenField runat="server" ID="theVals" Value="" />
    <asp:HiddenField runat="server" ID="hidTableName" Value="" />
    <asp:HiddenField runat="server" ID="hidYYear" Value="" />
    <asp:HiddenField runat="server" ID="requiredNamesHID" Value="" />

    <asp:HiddenField runat="server" ID="hidFormType" Value="" />
    <asp:HiddenField runat="server" ID="hidPick" Value="N" />
    <asp:HiddenField runat="server" ID="taxProgHID" EnableViewState="true" />
    <asp:HiddenField runat="server" ID="buffHID" />

    <input type="hidden" id="tableOffsetNameHID" />
    <input type="hidden" id="markerOffsetHID" />
    <input type="hidden" id="imageOffsetHID" />
    <input type="hidden" id="divOffsetHID" />
    <input type="hidden" id="divRepTopBot" name="divRepTopBot" value="0" />
</asp:Content>
