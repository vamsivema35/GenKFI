<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="KFI_Default, App_Web_wve1moyz" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:1000px;">
    <tr>
        <td>
            <div id="divTitle">
                <center><asp:Label ID="Label1" style="font-size:50px;" runat="server" Text="Personal Income Tax - KFI Home"></asp:Label></center>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <center><div id="divMsg" runat="server"></div></center>
        </td>
    </tr>
    <tr>
        <td>
            <center><asp:Label ID="lblGridviewMsg" runat="server" Text="Label"></asp:Label></center>
        </td>
    </tr>
    <tr>
        <td>
            <center>
                <asp:GridView ID="gdvSummary" runat="server" AutoGenerateColumns="False" 
                    CellPadding="5" CssClass="tblBorder" GridLines="None">
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
                        <asp:BoundField DataField="fintHeaderTotal" HeaderText="Item Count" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="tblHeader" />
                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
            </center>
        </td>
    </tr>
</table>



</asp:Content>

