<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="KFI_UserStats, App_Web_wve1moyz" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width:1000px;">
    <tr>
        <td>
            <center><asp:Label ID="lblTitle" style="font-size:50px;text-align:center;" runat="server" Text="User Statistics"></asp:Label></center>
        </td>
    </tr>
    <tr>
        <td>
            <div id="divSearch">
                <table width="100%" align="center">
                    <tr>
                        <td align="left" valign="top"><b>From:</b><asp:TextBox ID="txtFrom" runat="server" 
                                AutoPostBack="True" ontextchanged="txtFrom_TextChanged"></asp:TextBox>
                            <asp:ImageButton ID="imgFrom" runat="server" 
                                ImageUrl="~/Images/Calendar.bmp" onclick="imgFrom_Click" />
                            <asp:Calendar ID="cldFrom" Visible="False" runat="server" BackColor="White" 
                                BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
                                onselectionchanged="cldFrom_SelectionChanged" Width="200px">
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            </asp:Calendar>
                        </td>
                        <td align="center" valign="top"><b>To:</b><asp:TextBox ID="txtTo" runat="server" 
                                AutoPostBack="True" ontextchanged="txtTo_TextChanged"></asp:TextBox>
                            <asp:ImageButton ID="imgTo" runat="server" ImageUrl="~/Images/Calendar.bmp" 
                                onclick="imgTo_Click" />
                            <asp:Calendar ID="cldTo" runat="server" BackColor="White" BorderColor="#999999" 
                                CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                                ForeColor="Black" Height="180px" onselectionchanged="cldTo_SelectionChanged" 
                                Visible="False" Width="200px">
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            </asp:Calendar>
                        </td>
                        <td align="right" valign="top"><b>Batch Owner:</b><asp:DropDownList ID="ddlOwners" 
                                runat="server" AutoPostBack="True" 
                                onselectedindexchanged="ddlOwners_SelectedIndexChanged"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">&nbsp;</td>
                    </tr>
                </table>
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
            <div id="divStats" align="center">
                <asp:GridView ID="gdvBatches"  style="width:500px;" runat="server" AutoGenerateColumns="False" 
                    CellPadding="5" CssClass="tblBorder" GridLines="None">
                    <RowStyle Font-Bold="True" CssClass="tblBorder" />
                    <Columns>
                        <asp:BoundField DataField="fstrWho" HeaderText="User ID" 
                            SortExpression="fstrWho" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="flngCount" HeaderText="Returns Keyed" 
                            HtmlEncode="False" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>                        
                    </Columns>
                    <HeaderStyle CssClass="tblHeader" />
                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
            </div>
        </td>
    </tr>
</table>
</asp:Content>

