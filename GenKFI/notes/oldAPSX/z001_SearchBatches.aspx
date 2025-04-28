<%@ page language="C#" masterpagefile="~/z001_MasterPage.master" autoeventwireup="true" inherits="KFI_OpenBatches, App_Web_wve1moyz" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <div id="divBatches" runat="server">               
        <table style="width:1000px;"> 
            <tr>
                <td>
                    <div id="divTitle" style="width:100%;text-align:center;">
                        <center><asp:Label ID="lblTitle" style="font-size:50px;text-align:center;" runat="server" Text="Open Batches"></asp:Label></center>
                    </div>
                </td>
            </tr>
            <tr>
                <td id="tdSummary" style="text-align:center;width:100%;" runat="server">
                    <br />  
                    <b>Summary</b>                                    
                    <br />
                    <center>                                                          
                        <asp:GridView ID="gdvSummary" runat="server" AutoGenerateColumns="False"
                            CellPadding="5" onselectedindexchanged="gdvBatches_SelectedIndexChanged" 
                            CssClass="tblBorder" GridLines="None">
                            <RowStyle Font-Bold="True" CssClass="tblBorder" />
                            <Columns>                               
                                <asp:BoundField DataField="fstrForm" HeaderText="Year" 
                                    SortExpression="fstrForm" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="fstrBatchSource" HeaderText="Source" 
                                    SortExpression="fstrBatchSource" 
                                    HtmlEncode="False" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="fstrBatchType" HeaderText="Type" 
                                    SortExpression="fstrBatchType" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="flngBatchCount" HeaderText="Batch Count" 
                                    SortExpression="flngBatchCount" >
                                    <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="fintHeaderTotal" HeaderText="Header Count" >
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="fintBatchCount" HeaderText="Item Count" />
                            </Columns>
                            <HeaderStyle CssClass="tblHeader" />
                            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                        </asp:GridView>
                    </center>
                </td>            
            </tr>
            <tr>
                <td style="text-align:center;"><div id="divMsg" runat="server"></div><br /></td>
            </tr> 
            <tr><td id="tdBatches" runat="server">   
                <table style="width:100%;">
                    <tr>
                        <td style="text-align:left;width:33%;"><asp:Button ID="btnCheckAll" runat="server" Text="Check All" onclick="btnCheckAll_Click" UseSubmitBehavior="False" /></td>
                        <td style="text-align:center;width:34%;"><b>Batches</b></td>
                        <td style="text-align:right;width:33%;"><asp:Button ID="btnSubmit" runat="server" Text="Close Batches" onclick="btnSubmit_Click" UseSubmitBehavior="False" /></td>
                    </tr>
                </table>                                       
                <asp:GridView ID="gdvBatches"   runat="server" AutoGenerateColumns="False" 
                    CellPadding="5" onselectedindexchanged="gdvBatches_SelectedIndexChanged" 
                    CssClass="tblBorder" GridLines="None">
                    <RowStyle Font-Bold="True" CssClass="tblBorder" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkBatches" AutoPostBack="true" runat="server" 
                                    oncheckedchanged="chkBatches_CheckedChanged" />
                            </ItemTemplate>
                        </asp:TemplateField>                                
                        <asp:CommandField SelectText="View" ShowSelectButton="True" />                                
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
                                <asp:DropDownList ID="ddlOwners" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="ddlOwners_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                    <HeaderStyle CssClass="tblHeader" />
                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
                <br />
            </td></tr>                                              
        </table>        
</div>  
</asp:Content>

