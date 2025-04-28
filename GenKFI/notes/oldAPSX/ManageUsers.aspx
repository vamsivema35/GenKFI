<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="KFI_ManageUsers, App_Web_wve1moyz" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width:1000px;">
    <tr>
        <td>
            <center><asp:Label ID="lblTitle" style="font-size:50px;text-align:center;" runat="server" Text="Manage Users"></asp:Label></center>
        </td>
    </tr>
    <tr>
        <td>
            <table align="center" id="tblAddUser" runat="server">
                <tr><td align="right" style="font-weight:bold;">User ID:</td><td><asp:TextBox ID="txtUserID" runat="server"></asp:TextBox></td></tr>
                <tr><td align="right" style="font-weight:bold;">User Name:</td><td><asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></td></tr>
                <tr><td align="right" style="font-weight:bold;" valign="top">Security:</td>
                    <td align="left">
                    <asp:RadioButtonList ID="rdoSecurity" runat="server">
                        <asp:ListItem Selected="True">User</asp:ListItem>
                        <asp:ListItem Value="Super">Supervisor</asp:ListItem>
                        <asp:ListItem Value="Admin">Admininistrator</asp:ListItem>
                    </asp:RadioButtonList>
                    </td>
                </tr>
                <tr><td colspan="2"><center><asp:Button ID="btnAddUser" runat="server" Text="Add User ID" onclick="btnAddUser_Click" UseSubmitBehavior="False" /></center></td></tr>
            </table>
        </td>
    </tr>
    <tr><td><center><br /><div id="divMsgUsers" runat="server"><asp:Label ID="lblMsgUsers" runat="server"></asp:Label></div></center></td></tr>
    <tr>
        <td>
            <center><br />
                <asp:GridView ID="gdvUsers" runat="server" AutoGenerateColumns="False" 
                    CellPadding="5" CssClass="tblBorder" GridLines="None" Font-Bold="True">
                    <RowStyle CssClass="tblBorder" />
                    <Columns>
                        <asp:BoundField DataField="fstrUserID" HeaderText="User ID" >
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fstrUserName" HeaderText="User Name" >
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fstrSecurityCode" HeaderText="Type" >
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Remove">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkRemove" runat="server" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="tblHeader" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
                <br />
                <br />
                <asp:Button ID="btnRemove" runat="server" onclick="btnRemove_Click" Text="Remove User(s)" />
            </center>
        </td>
    </tr>
</table>
</asp:Content>

