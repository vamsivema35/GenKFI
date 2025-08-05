<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="DcUtility.aspx.cs" Inherits="GenKFI.utils.DcUtility" %>

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
            if (e.which == 13) {
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

        function SelectPickRow(strFormName) {
            $('#<%=hidFormName.ClientID %>').val(strFormName);
            FormPick.style.visibility = "hidden";
            $("#<%=hidPick.ClientID %>").val("N");
            $("#<%=formPickClick.ClientID %>").val("Y");
            document.getElementById("<%=ShowForms.ClientID %>").click();
        }
        function RegImg(strFormname, strPosInBatch, strCamera) {
            $('#<%=hidFormName.ClientID %>').val(strFormname);
            $('#<%=hidPosition.ClientID %>').val(strPosInBatch);
            $('#<%=hidCamera.ClientID %>').val(strCamera);         
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
            style="position: absolute; top: 0px; left: 0px; height: 100px; width: 100%; background-color: #e3f5f7; border: solid 1px black;">
            <asp:Label runat="server" TabIndex="92" Text="Utility" Style="left: 60px; top: 24px; position: absolute; height: 45px; font-size: 20px; font-weight: bold;" />
            <asp:Label runat="server" ID="Formnamelbl" Width="75" Style="left: 170px; top: 8px; font-size: 13px; color: black; position: absolute;" Text="Form Name:"></asp:Label>
            <asp:Label runat="server" ID="Formnametxt" Width="75" Style="left: 245px; top: 8px; font-size: 13px; color: black; position: absolute;" Text=""></asp:Label>
            <asp:Label runat="server" ID="Positionlbl" Width="75" Style="left: 170px; top: 29px; font-size: 13px; color: black; position: absolute;" Text="Position:"></asp:Label>
            <asp:Label runat="server" ID="Positiontxt" Width="75" Style="left: 245px; top: 29px; font-size: 13px; color: black; position: absolute;" Text=""></asp:Label>
            <asp:Label runat="server" ID="Cameralbl" Width="75" Style="left: 170px; top: 50px; font-size: 13px; color: black; position: absolute;" Text="Camera:"></asp:Label>
            <asp:Label runat="server" ID="Cameratxt" Width="75" Style="left: 245px; top: 50px; font-size: 13px; color: black; position: absolute;" Text=""></asp:Label>
            <asp:Label runat="server" ID="ImgSrclbl" Width="75" Style="left: 325px; top: 8px; font-size: 13px; color: black; position: absolute;" Text="Image Src:"></asp:Label>
            <asp:Label runat="server" ID="ImgSrctxt" Width="75" Style="left: 400px; top: 8px; font-size: 13px; color: black; position: absolute;" Text=""></asp:Label>
            <asp:Label runat="server" ID="Offsetlbl" Width="75" Style="left: 325px; top: 29px; font-size: 13px; color: black; position: absolute;" Text="Offset:"></asp:Label>
            <asp:Label runat="server" ID="Offsettxt" Width="75" Style="left: 400px; top: 29px; font-size: 13px; color: black; position: absolute;" Text=""></asp:Label>
            <asp:Label runat="server" ID="Sizelbl" Width="75" Style="left: 325px; top: 50px; font-size: 13px; color: black; position: absolute;" Text="Size:"></asp:Label>
            <asp:Label runat="server" ID="Sizetxt" Width="75" Style="left: 400px; top: 50px; font-size: 13px; color: black; position: absolute;" Text=""></asp:Label>

            <div id="divbuttons" runat="server"
                style="position: absolute; top: 5px; left: 50%; height: 40px; width: 100%; padding: 5px">               
                <asp:Button runat="server" ID="ShowForms" Text="SF" Style="height: 30px; font-size: 14px; font-weight: bold; visibility: hidden;" OnClick="OnClick_ShowForms" />
                <asp:Button runat="server" ID="ClearTxtBTN" Text="Clear Choices" Style="height: 30px; font-size: 14px; font-weight: bold;" OnClick="OnClick_ClearChoice" />
                <asp:Button runat="server" ID="DeleteBatchBTN" Text="Delete Batch" Style="height: 30px; font-size: 14px; font-weight: bold; right: 684px;" OnClick="OnClick_DeleteBatch" />
                <asp:Button runat="server" ID="UnDel" Text="Un-Delete" Style="height: 30px; font-size: 14px; font-weight: bold;" OnClick="OnClick_UnDelete" />
                <asp:Button runat="server" ID="GetFormBTN" Text="Get Forms" Style="height: 30px; font-size: 14px; font-weight: bold;" OnClick="OnClick_GetForms" />               
                <input id="BtnShowForms" tabindex="95" type="button" name="btnShowForms" value="Show All Forms"
                    style="height: 30px; font-size: 14px; font-weight: bold;"
                    onclick="ShowFormPick(this)" />               
                <asp:Button runat="server" ID="homeBTN" TabIndex="92" Text="Home" Style="height: 30px; font-size: 14px; font-weight: bold;" OnClick="OnClick_homeBTN" />
            </div>
        </div>

        <div id="FormPick"
            style="position: absolute; background-color: aqua; overflow: auto; visibility: hidden; z-index: 5; top: 180px; width: 300px; left: 26%;">

            <table id="tablePick" border="1" style="border-collapse: separate; border-spacing: 1px; padding: 1px; width: 240px; margin: 0 auto;">
                <thead>
                    <tr>
                        <th colspan="5">All Form Names of Selected Tax Program, Batch and Sequence</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Literal runat="server" ID="formListLIT" Mode="PassThrough"></asp:Literal>
                </tbody>
            </table>
        </div>
        <div id="divControls"
            style="position: absolute; overflow-x: hidden; overflow-y: scroll; -webkit-transform: translateZ(0); border: 1px solid #ccc; top: 105px; left: 22%; height: 90%; width: 75%; border: solid 1px black;">

            <asp:HiddenField runat="server" ID="maxScrl" Value="0" />
            <div id="ctrlSizer">
                <asp:Literal runat="server" ID="controlsLIT" Mode="PassThrough"></asp:Literal>
            </div>
            <!--	Table is Placed here for Controls / Entry  -->

        </div>
        <div id="divBotEntry"
            style="position: absolute; top: 105px; left: 1%; height: 20%; width: 20%; border: solid 1px black;">
            <table width="100%">
                <tr>
                    <td colspan="2"><b>Select the Tax Program, Batch, Sequence</b></td>
                </tr>
                <tr>
                    <td class="input_lbl">Tax Pgm: </td>
                    <td class="input_cmb">
                        <asp:DropDownList runat="server" ID="DdTaxPgm" TabIndex="11" Width="98%"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="input_lbl">Batch: </td>
                    <td class="input_txt">
                        <asp:TextBox runat="server" ID="BatchId" MaxLength="10" TabIndex="12" Text="" Width="98%"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="input_lbl">Sequence: </td>
                    <td class="input_txt">
                        <asp:TextBox runat="server" ID="SeqNbr" MaxLength="4" TabIndex="13" Text="" Width="98%"></asp:TextBox></td>
                </tr>
               <%-- <tr>
                    <td class="input_lbl">Mavro File: </td>
                    <td class="input_txt">
                        <asp:TextBox runat="server" ID="MavFile" MaxLength="15" TabIndex="14" Text="" Width="98%"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="input_lbl">Mavro Prev: </td>
                    <td class="input_txt">
                        <asp:TextBox runat="server" ID="MavPrev" MaxLength="15" TabIndex="15" Text="" Width="98%"></asp:TextBox></td>
                </tr>--%>
                <tr></tr>
                <tr>
                    <td class="input_lbl">Status: </td>
                    <td>
                        <asp:TextBox runat="server" ID="OpStatus" ReadOnly="true" Text="" Width="98%" Height="100%" TextMode="MultiLine"></asp:TextBox></td>
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
        <input type="hidden" id="divRepTopBot" name="divRepTopBot" value="0" />

    </form>
</body>
</html>
