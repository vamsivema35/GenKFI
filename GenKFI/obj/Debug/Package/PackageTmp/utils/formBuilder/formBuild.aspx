<%@ Page Language="C#" MasterPageFile="~/forms.Master" AutoEventWireup="True" CodeBehind="formBuild.aspx.cs" Inherits="GenKFI.utils.formBuilder.FormBuild" %>

<asp:Content ID="headerContent" ContentPlaceHolderID="headerHolder" runat="server">
    <style type="text/css">
        .ddl100 {
            width: 100px;
        }
    </style>

    <!-- ************************************************** -->
    <!--  Header Controls, different controls here for the control generation -->
    <!-- ************************************************** -->

    <div id="divHeader" style="position: absolute; top: 0px; left: 0px; height: 72px; width: 100%;" runat="server">


        <table style="left: 325px; position: relative;">
            <tr>
                <td>
                    <asp:Label runat="server" ID="fileTypeLBL"  Width="75" Text="File Type:"></asp:Label></td>
                <td>
                    <asp:Label runat="server" ID="fileTypeTXT"  Width="75"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="taxYearLBL"  Width="75" Text="Tax Year:"></asp:Label></td>
                <td>
                    <asp:Label runat="server" ID="taxYearTXT"  Width="75"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="taxProgLBL"  Width="75" Text="Tax Program:"></asp:Label></td>
                <td>
                    <asp:Label runat="server" ID="taxProgTXT"  Width="75"></asp:Label></td>
            </tr>
        </table>

        <table style="top: 0px; left: 475px; height: 72px; position: absolute;">
            <tr>
                <td>
                    <asp:Label runat="server" ID="BatchLbl"  Width="75" Text="Batch:"></asp:Label></td>
                <td>
                    <asp:Label runat="server" ID="BatchTxt"  Width="75"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="SequenceLbl"  Width="75" Text="Sequence:"></asp:Label></td>
                <td>
                    <asp:Label runat="server" ID="SequenceTxt"  Width="75"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="FormLbl"  Width="75" Text="Tax Form:"></asp:Label></td>
                <td>
                    <asp:Label runat="server" ID="FormTxt"  Width="125"></asp:Label></td>
            </tr>
        </table>

        <table style="top: 0px; left: 700px; height: 72px; position: absolute;">
            <tr>
                <td>
                    <asp:Label runat="server" ID="BlkLbl"  Width="75" Text="Blk:"></asp:Label></td>
                <td>
                    <asp:Label runat="server" ID="BlkTxt"  Width="75"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="TableLbl"  Width="75" Text="Table:"></asp:Label></td>
                <td>
                    <asp:Label runat="server" ID="TableTxt"  Width="75"></asp:Label></td>
            </tr>
        </table>

        <asp:Button runat="server" ID="btnSub" Text="Done" Style="left: 860px; top: 13px; position: absolute; height: 30px; font-size:14px; font-weight: bold; z-index: 10;" OnClick="OnClick_btnSub" />
        <asp:Button runat="server" ID="OgdBtn" TabIndex="91" Text="41374" Visible="false" Style="left: 1020px; top: 8px; position: absolute; height: 17px; font-size: 13px; font-weight: bold;" OnClick="OnClick_OgdBtn" />
        <asp:Button runat="server" ID="O85Btn" TabIndex="92" Text="41285" Visible="false" Style="left: 1020px; top: 29px; position: absolute; height: 17px; font-size: 13px; font-weight: bold;" OnClick="OnClick_O85Btn" />
        <asp:Button runat="server" ID="O99Btn" TabIndex="93" Text="1099M" Visible="false" Style="left: 1020px; top: 50px; position: absolute; height: 17px; font-size: 13px; font-weight: bold;" OnClick="OnClick_O99Btn" />
        <asp:Button runat="server" ID="OirBtn" TabIndex="94" Text="InfRtn" Visible="false" Style="left: 1120px; top: 8px; position: absolute; height: 17px; font-size: 13px; font-weight: bold;" OnClick="OnClick_OirBtn" />
        <asp:Button runat="server" ID="OsfBtn" TabIndex="95" Text="SubFrm" Visible="false" Style="left: 1120px; top: 29px; position: absolute; height: 17px; font-size: 13px; font-weight: bold;" OnClick="OnClick_OsfBtn" />
        <asp:Button runat="server" ID="OsrBtn" TabIndex="96" Text="StmRec" Visible="false" Style="left: 1120px; top: 50px; position: absolute; height: 17px; font-size: 13px; font-weight: bold;" OnClick="OnClick_OsrBtn" />
        <asp:Button runat="server" ID="OasBtn" TabIndex="97" Text="AnnSum" Visible="false" Style="left: 1220px; top: 8px; position: absolute; height: 17px; font-size: 13px; font-weight: bold;" OnClick="OnClick_OasBtn" />


    </div>
</asp:Content>


<asp:Content runat="server" ID="scriptingContent" ContentPlaceHolderID="scriptingHolder">
    <script type="text/javascript" src="../../scripts/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="../../scripts/jquery-ui-1.10.3.custom.min.js"></script>

    <script type="text/javascript">

        var oTop = oLeft = 0;
        var clipoTop = clipoLeft = 0;
        var locked = false;

        $(document).ready(function () {

            $('#divControls').scroll(function () {
                $("#<%= controlScrollTXT.ClientID%>").val($('#divControls').scrollTop());
                });
                $(function () {
                    $("#controlLink").click(function () {
                        $("#controlEdit").animate({ height: 'toggle' }, 500);
                        if ($("#isHidden").val() == '0')
                            $("#isHidden").val('1 ');
                        else
                            $("#isHidden").val('0');
                    });
                });

                $('#zoomInBTN').on('mouseup', function () {
                    $('#<%= zoomPercTXT.ClientID%>').val((foomZactor * 100).toFixed(3));
                });
                $('#zoomOutBTN').on('mouseup', function () {
                    $('#<%= zoomPercTXT.ClientID%>').val((foomZactor * 100).toFixed(3));
                });

            });

    </script>

    <div id="clipDIV" runat="server" style="position: absolute; background-color: red; opacity: 0; z-index: -1;"></div>
</asp:Content>

<asp:Content runat="server" ID="rightContent" ContentPlaceHolderID="rightHolder">
    <!-- ************************************************** -->
    <!-- Control Options -->
    <!-- ************************************************** -->
    <!-- might need this
			http://stackoverflow.com/questions/13694341/accordion-script-does-not-work-in-ajax-update-panel -->

    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>

    <div id="menubar" style="position: absolute; top: 50px; left: 1%; width: 100px; background: lightgrey; margin: auto; text-align: center; z-index: 99;">
        <a href="#" id="controlLink">Show Controls</a>
    </div>
    <asp:HiddenField runat="server" ID="isHidden" Value="1" />

    <asp:UpdatePanel runat="server" ID="controlInfoUPD" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="float: right; overflow: hidden; position: absolute; border: 1px solid #ccc; width: 25%; bottom: 0%; left: 1%; top: 8%; z-index: 99;">
                <div id="controlEdit">
                    <h3>Block Options</h3>
                    <div id="addControl" style="overflow: scroll;">
                        <table>
                            <tr>
                                <td>Type: </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="typeDDL">
                                        <asp:ListItem Text="TextBox" Value="txt"></asp:ListItem>
                                        <asp:ListItem Text="CheckBox" Value="chk"></asp:ListItem>
                                        <asp:ListItem Text="Text Only" Value="lbl"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button runat="server" ID="addBTN" Text="Add Control" OnClick="OnClick_addBTN" /></td>
                                <td>
                                    <asp:Button runat="server" ID="moveUpBTN" Text="Move Control Up" OnClick="OnClick_moveUpBTN" /></td>
                                <td>
                                    <asp:Button runat="server" ID="testBTN" Text="Test Page" OnClick="OnClick_testBTN" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button runat="server" ID="removeBTN" Text="Remove Control" OnClick="OnClick_removeBTN" /></td>
                                <td>
                                    <asp:Button runat="server" ID="moveDnBTN" Text="Move Control Down" OnClick="OnClick_moveDnBTN" /></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>ID Clipping Area</td>
                                <td>X</td>
                                <td>Y</td>
                            </tr>
                            <tr>
                                <td>Top Left</td>
                                <td>
                                    <asp:TextBox runat="server" ID="clipTopTXT" Width="75"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="clipLeftTXT" Width="75"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Bot Right</td>
                                <td>
                                    <asp:TextBox runat="server" ID="clipBotTXT" Width="75"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="clipRightTXT" Width="75"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="button" id="useValsClip" value="Apply Clip Values" /></td>
                                <td>
                                    <input type="button" id="showClip" value="Show Clip Rect" />
                                </td>
                                <td>
                                    <asp:Button runat="server" ID="IDclipBTN" Text="Save Clip Values" OnClick="OnClick_IDclipBTN" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>Zoom Percent
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="zoomPercTXT"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button runat="server" ID="saveZoomPercBTN" Text="Save Zoom" OnClick="OnClick_saveZoomPercBTN" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <hr />
                                </td>
                            </tr>
                            <asp:Panel runat="server" ID="repeaterSetPNL">
                                <tr>
                                    <td>Offset To Next Block</td>
                                    <td>
                                        <asp:TextBox runat="server" ID="blockOffsetTXT" Width="75"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Button runat="server" ID="saveOffsetBTN" Text="Save Offset" OnClick="OnClick_saveOffsetBTN" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Row Header Label starts (default 0)</td>
                                    <td>
                                        <asp:TextBox runat="server" ID="headerNumberStartsTXT" Width="75"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Button runat="server" ID="Button1" Text="Save Label Start" OnClick="OnClick_saveHeaderNumberStartsBTN" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <hr />
                                    </td>
                                </tr>
                            </asp:Panel>
                        </table>
                    </div>
                    <h3>Control Options</h3>
                    <div id="controlOptions" style="overflow: scroll;">
                        <table>
                            <tr>
                                <th></th>
                                <td>
                                    <asp:CheckBox runat="server" ID="lockMoveCKB" Text="Lock Movement Values" />
                                </td>
                            </tr>
                            <tr>
                                <td>Label: </td>
                                <td>
                                    <asp:TextBox runat="server" ID="labelTXT" Width="200"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="lookupCKB" Text="Do Lookup?" /></td>
                                <td>
                                    <asp:CheckBox runat="server" ID="vertSkipCKB" AutoPostBack="true" Text="2nd Column" /></td>
                            </tr>
                            <tr>
                                <td>Control ID: </td>
                                <td>
                                    <asp:TextBox runat="server" ID="inputIDTXT" Width="200"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Max/Display Length: </td>
                                <td>
                                    <asp:TextBox runat="server" ID="maxLenTXT" Width="100"></asp:TextBox><asp:TextBox runat="server" ID="dispLenTXT" Width="75"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>KFI Column: </td>
                                <td>
                                    <asp:TextBox runat="server" ID="columnIDTXT" Width="200"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>GenTax Field: </td>
                                <td>
                                    <asp:TextBox runat="server" ID="gentaxFieldTXT" Width="200"></asp:TextBox></td>
                            </tr>
                            <tr id="imgMove" class="moveRow">
                                <td>Image Scrolling (X, Y): </td>
                                <td>
                                    <asp:TextBox runat="server" ID="imageXTXT" Width="100"></asp:TextBox><asp:TextBox runat="server" ID="imageYTXT" Width="100"></asp:TextBox></td>
                            </tr>
                            <tr id="markerMove" class="moveRow">
                                <td>Marker Position (X, Y): </td>
                                <td>
                                    <asp:TextBox runat="server" ID="markerXTXT" Width="100"></asp:TextBox><asp:TextBox runat="server" ID="markerYTXT" Width="100"></asp:TextBox></td>
                            </tr>
                            <tr id="controlMove" class="moveRow">
                                <td>Control Scroll Position</td>
                                <td>
                                    <asp:TextBox runat="server" ID="controlScrollTXT" Width="200"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Data Type (Formatting/Type): </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="dataTypeDDL" Width="100">
                                    </asp:DropDownList>
                                    <asp:DropDownList runat="server" ID="varTypeDDL" Width="100">
                                        <asp:ListItem Text="String" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="DateTime" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="Boolean" Value="11"></asp:ListItem>
                                        <asp:ListItem Text="Currency" Value="14"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>CKB Translate String</td>
                                <td>
                                    <asp:TextBox runat="server" ID="ckbTransTXT" Width="200"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Next Control: </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="nextControlDDL" Width="200"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="hiddenCKB" Text="Hidden" /></td>
                                <td>
                                    <asp:CheckBox runat="server" ID="requiredCKB" Text="Required to Submit?" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button runat="server" ID="saveOptionsBTN" Text="Save Options" OnClick="OnClick_saveOptionsBTN" /></td>
                            </tr>
                        </table>
                        <span>NOTE: All postmark controls must be have an id of txtPostMarkDate, and a KFI column of fdtmPostMarkDate.</span><br />
                        <span>NOTE: All spacer or label controls must have an EMPTY column field.</span>
                    </div>
                    <h3>Auto-calculation Options</h3>
                    <div id="autoCalc" style="overflow: scroll;">
                        <table>
                            <tr>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <th>OnFocus Functions</th>
                            </tr>
                            <tr>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <asp:Button runat="server" ID="saveJSBTNfocus" Text="Save Changes" CommandName="eventType" CommandArgument="focus" OnCommand="OnCommand_saveJSBTN" />
                                    <br />
                                    <asp:GridView runat="server" ID="jsAutoGDVfocus" AutoGenerateColumns="false" AllowSorting="false" OnRowDataBound="OnRowDataBound_jsAutoGDVfocus" OnRowCommand="OnRowCommand_jsAutoGDVfocus" DataKeyNames="idCol,flngOrder">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Field 1">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="field1DDL" CssClass="ddl100" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedIndexChanged_field1DDL">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Field 2">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="field2DDL" CssClass="ddl100">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Name 1">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="name1DDL" CssClass="ddl100">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Name 2">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="name2DDL" CssClass="ddl100">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="(Constant)">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="constantTXT" Width="65px" Visible="false"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Function">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="funcDDL">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:ButtonField ButtonType="Button" CommandName="removeROW" HeaderText="Remove" Text="Remove" />

                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                    <table>
                                        <tr>
                                            <th>Input 1</th>
                                            <th>Input 2</th>
                                            <th>Function</th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList runat="server" ID="newField1DDLfocus" CssClass="ddl100"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="newField2DDLfocus" CssClass="ddl100"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="newFuncDDLfocus" CssClass="ddl100"></asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="text-align: right;">
                                                <asp:Button runat="server" ID="addRowBTNfocus" Text="Add Row" CommandName="eventType" CommandArgument="focus" OnCommand="OnCommand_addRowBTN" />
                                            </td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <th>OnBlur Functions</th>
                            </tr>
                            <tr>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <asp:Button runat="server" ID="saveJSBTNblur" Text="Save Changes" CommandName="eventType" CommandArgument="blur" OnCommand="OnCommand_saveJSBTN" />
                                    <br />
                                    <asp:GridView runat="server" ID="jsAutoGDVblur" AutoGenerateColumns="false" AllowSorting="false" OnRowDataBound="OnRowDataBound_jsAutoGDVblur" OnRowCommand="OnRowCommand_jsAutoGDVblur" DataKeyNames="idCol,flngOrder">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Field 1">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="field1DDL" CssClass="ddl100" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedIndexChanged_field1DDL">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Field 2">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="field2DDL" CssClass="ddl100">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Name 1">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="name1DDL" CssClass="ddl100">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Name 2">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="name2DDL" CssClass="ddl100">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="(Constant)">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="constantTXT" Width="65px" Visible="false"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Function">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" ID="funcDDL">
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:ButtonField ButtonType="Button" CommandName="removeROW" HeaderText="Remove" Text="Remove" />

                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                    <table>
                                        <tr>
                                            <th>Input 1</th>
                                            <th>Input 2</th>
                                            <th>Function</th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList runat="server" ID="newField1DDLblur" CssClass="ddl100"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="newField2DDLblur" CssClass="ddl100"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="newFuncDDLblur" CssClass="ddl100"></asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="text-align: right;">
                                                <asp:Button runat="server" ID="addRowBTNblur" Text="Add Row" CommandName="eventType" CommandArgument="blur" OnCommand="OnCommand_addRowBTN" />
                                            </td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <asp:Button runat="server" ID="hiddenBTN" OnClick="OnClick_hiddenBTN" Style="display: none;" />
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="saveOptionsBTN" />
            <asp:PostBackTrigger ControlID="addBTN" />
            <asp:PostBackTrigger ControlID="moveUpBTN" />
            <asp:PostBackTrigger ControlID="testBTN" />
            <asp:PostBackTrigger ControlID="removeBTN" />
            <asp:PostBackTrigger ControlID="moveDnBTN" />
            <asp:AsyncPostBackTrigger ControlID="hiddenBTN" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content runat="server" ID="hiddenContent" ContentPlaceHolderID="hiddenHolder">
    <!-- ************************************************** -->
    <!-- Hidden Inputs, probably don't need these anymore -->
    <!-- ************************************************** -->
    <input type="hidden" id="divOffsetHID" />

    <asp:HiddenField runat="server" ID="templateImgPath" />
    <asp:HiddenField runat="server" ID="controlEditActive" />
</asp:Content>
