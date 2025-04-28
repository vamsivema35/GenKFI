<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="KFI_Search_Batches, App_Web_wve1moyz" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divTitle">
    <center><asp:Label ID="lblTitle" style="font-size:50px;text-align:center;" runat="server" Text="Search Batch(es)"></asp:Label></center>
</div>

<div id="divBatches" runat="server">

    <div id="divMsg" runat="server">
        <br />
        <table style="width:1000px;" align="center">
            <tr><td><asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label></td></tr>
        </table>
        <br />
    </div>
                                                        
    <div id="divBatchInfo" runat="server">
        <table align="center" style="width:1000px;">
            <tr><td colspan="2">                                          
                <asp:GridView ID="gdvBatches"  style="width:1000px;" runat="server" AutoGenerateColumns="False" 
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
                        <asp:BoundField DataField="fcurHeaderAmount" HeaderText="Header Amount" 
                            SortExpression="fcurHeaderAmount" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fcurbatchAmount" HeaderText="Batch Amount" 
                            SortExpression="fcurbatchAmount" >
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
                    </Columns>
                    <HeaderStyle CssClass="tblHeader" />
                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
                <br />
            </td></tr>                                              
        </table>
    </div>
</div>

</asp:Content>

