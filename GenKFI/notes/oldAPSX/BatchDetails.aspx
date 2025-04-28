<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="KFI_BatchDetails, App_Web_wve1moyz" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script language="javascript" type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table>
    <tr>
        <td>            
            <div id="divTitle">
            <center><asp:Label ID="lblTitle" style="font-size:50px;text-align:center;" runat="server" Text="Batch Details"></asp:Label></center>
            </div>
        </td>
    <tr>
        <td>  
            <center> 
                <asp:GridView ID="gdvHeader" runat="server" AutoGenerateColumns="False" 
                    CellPadding="5"
                    CssClass="tblBorder" GridLines="None">
                    <RowStyle Font-Bold="True" CssClass="tblBorder" />
                    <Columns>                               
                        <asp:BoundField DataField="fstrBatchID" HeaderText="Batch ID" 
                            SortExpression="fstrBatchID" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fdtmBatchDate" HeaderText="Batch Date" 
                            SortExpression="fdtmBatchDate" DataFormatString="{0:d}" 
                            HtmlEncode="False" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fstrBatchSource" HeaderText="Source" 
                            SortExpression="fstrBatchSource" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fstrBatchType" HeaderText="Type" 
                            SortExpression="fstrBatchType" >
                            <ItemStyle HorizontalAlign="Center" Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fstrForm" HeaderText="Tax Year" />
                        <asp:BoundField DataField="fdtmPostmarkDate" HeaderText="PM Date" 
                            SortExpression="fdtmPostmarkDate" DataFormatString="{0:d}" 
                            HtmlEncode="False" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fintHeaderCount" HeaderText="Header Count" 
                            SortExpression="fintHeaderCount" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fintbatchCount" HeaderText="Batch Count" 
                            SortExpression="fintbatchCount" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fstrBatchStatus" HeaderText="Batch Status" 
                            SortExpression="fstrBatchStatus" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fdtmBatchCreated" HeaderText="Date Created" 
                            SortExpression="fdtmBatchCreated" DataFormatString="{0:d}" 
                            HtmlEncode="False" >                                        
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>                                        
                         <asp:BoundField DataField="fstrBatchUser" HeaderText="Owner" 
                            SortExpression="fstrBatchUser" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>                                        
                        <asp:TemplateField HeaderText="Change Owner">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlOwners" runat="server" 
                                    onselectedindexchanged="ddlOwners_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="tblHeader" />
                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:GridView>            
                <br /><br />        
            </center>               
        </td>
    </tr>
    <tr>
        <td>
            <center><div id="divMsg" runat="server"></div></center>
        </td>
    </tr>
    <tr>
        <td>
            <center><table><tr><td>                                                              
                <asp:GridView ID="gdvItems"  style="width:1300px;" runat="server" AutoGenerateColumns="False" 
                    CellPadding="5" onselectedindexchanged="gdvItems_SelectedIndexChanged" 
                    CssClass="tblBorder" GridLines="None">
                    <RowStyle Font-Bold="True" CssClass="tblBorder" />
                    <Columns>                               
                        <asp:CommandField SelectText="View" ShowSelectButton="True" />                                
                        <asp:BoundField DataField="fintSequence" HeaderText="Seq." 
                            SortExpression="fintSequence" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>                    
                        <asp:BoundField DataField="fstrPSSN" HeaderText="ID" />
                        <asp:BoundField DataField="fdtmPostmarkDate" DataFormatString="{0:d}" 
                            HeaderText="PM Date" />
                        <asp:BoundField DataField="fcurTotalDue" DataFormatString="{0:C}" 
                            HeaderText="Total Due" >
                            <ItemStyle HorizontalAlign="Right" Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fstrWho" HeaderText="Owner" />
                        <asp:BoundField DataField="fstrStatus" HeaderText="Status" />
                    </Columns>
                    <HeaderStyle CssClass="tblHeader" />
                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
            </td></tr> </table></center>
        </td>
    </tr>
</table>


    
<div id="divErrors" align="center" runat="server">
    <table align="center">
        <tr><td colspan="2" align="center">                                          
            <asp:GridView ID="gdvErrors" runat="server" AutoGenerateColumns="False" 
                CellPadding="5" onselectedindexchanged="gdvErrors_SelectedIndexChanged" 
                CssClass="tblBorder" GridLines="None" >
                <RowStyle Font-Bold="True" CssClass="tblBorder" />
                <Columns>                               
                    <asp:BoundField DataField="fstrImagePath" />
                    <asp:CommandField SelectText="Modify" ShowSelectButton="True" />
                    <asp:BoundField DataField="flngSequence" HeaderText="Seq." 
                        SortExpression="flngSequence" >
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>                    
                    <asp:BoundField DataField="fstrDLN" HeaderText="DLN" />
                    <asp:BoundField DataField="fstrFormName" HeaderText="Form Name" />
                    <asp:BoundField DataField="fstrReason" HeaderText="Reason" >
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="fstrImagePath" >
                        <ControlStyle CssClass="gdvErrorsPath" Width="1px" />
                        <FooterStyle CssClass="gdvErrorsPath" />
                        <HeaderStyle CssClass="gdvErrorsPath" />
                        <ItemStyle CssClass="gdvErrorsPath" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle CssClass="tblHeader" />
                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
            </asp:GridView>
        </td></tr>                                              
    </table>
</div>

<div id="divClose" runat="server" style="position:absolute;z-index:1;top:0px;left:200px;background-color:White;border:solid 1px black;">
    <table style="width:100%;">
        <tr>
            <td align="left">
                <asp:DropDownList ID="ddlForms" runat="server">
                    <asp:ListItem>PIT-1, page 1</asp:ListItem>
                    <asp:ListItem>PIT-1, page 2</asp:ListItem>
                    <asp:ListItem>PIT-S, page 1</asp:ListItem>
                    <asp:ListItem>PIT-ADJ, page 1</asp:ListItem>
                    <asp:ListItem>PIT-RC, page 1</asp:ListItem>
                    <asp:ListItem>PIT-RC, page 2</asp:ListItem>
                    <asp:ListItem>PIT-B, page 1</asp:ListItem>
                    <asp:ListItem>PIT-B, page 2</asp:ListItem>
                    <asp:ListItem>PIT-D, page 1</asp:ListItem>
                    <asp:ListItem>PIT-CR, page 1</asp:ListItem>
                    <asp:ListItem>*Unidentified</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnChangeForm" runat="server" Text="Change Form" 
                    onclick="btnChangeForm_Click" />
            </td>
            <td align="right">
                <asp:LinkButton ID="lnkClose" runat="server" Text="Close X" 
                    onclick="lnkClose_Click" style="text-align:right;"></asp:LinkButton>
            </td>            
        </tr>
    </table>
    
    <img id="imgDivForm" src="" runat="server" alt="" style="height:800px;" onclick="return imgDivForm_onclick()" />
    
</div>
</asp:Content>

