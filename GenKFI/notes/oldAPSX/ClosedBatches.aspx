<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="KFI_ClosedBatches, App_Web_wve1moyz" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <table style="width:800px;">
    <tr>
        <td>
            <center>
                <div id="divTitle">
                    <center><asp:Label ID="lblTitle" style="font-size:50px;text-align:center;" runat="server" Text="Closed Batches"></asp:Label></center>
                </div>
            </center>
        </td>
    </tr>
    <tr>
        <td id="tdSummary" runat="server">
            <center>
            <br />  
            <b>Summary</b>                                    
            <br />                                                                      
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
        <td>
            <center><br /><div id="divMsg" runat="server"></div><br /></center>
        </td>
    </tr>
    <tr>
        <td id="tdBatches" runat="server">
            <center><b>Batches</b></center>
            <asp:GridView ID="gdvBatches" runat="server" AutoGenerateColumns="False" 
                CellPadding="5" onselectedindexchanged="gdvBatches_SelectedIndexChanged" 
                CssClass="tblBorder" GridLines="None">
                <RowStyle Font-Bold="True" CssClass="tblBorder" />
                <Columns>                               
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
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkReopen" runat="server" onclick="lnkReopen_Click">Re-Open</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="tblHeader" />
                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
            </asp:GridView>
        </td>
    </tr>
</table>  
</asp:Content>

