<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="log.aspx.cs" Inherits="Grid.log" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <asp:Table runat="server" Font-Bold="true" BackColor="#99ffcc" BorderColor="#ff6699" BorderStyle="Groove" HorizontalAlign="Center">
                <asp:TableRow>
                    <asp:TableCell>UserName</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtUser" runat="server" TextMode="Email"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Password</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                         <asp:Button ID="Button1" runat="server" Text="Login" OnClick="btnLogin_Click" BackColor="#66ccff" BorderColor="#999966" />
                <asp:Button ID="Button2" runat="server" Text="New Reg" OnClick="btnNew_Click" BackColor="#66ccff" BorderColor="#999966" />
            <%--<asp:PasswordRecovery ID="Psw" runat="server" OnSendingMail="Psw_SendingMail" ></asp:PasswordRecovery>--%>
        
                 <asp:LinkButton ID="LinkButton1" runat="server" Text="Forget Password" OnClick="Forget_Click" ></asp:LinkButton>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
           
               <%-- <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" BackColor="#66ccff" BorderColor="#999966" />
                <asp:Button ID="btnNew" runat="server" Text="New Reg" OnClick="btnNew_Click" BackColor="#66ccff" BorderColor="#999966" />
            <%--<asp:PasswordRecovery ID="Psw" runat="server" OnSendingMail="Psw_SendingMail" ></asp:PasswordRecovery>--%>
        
                <%-- <asp:LinkButton ID="Forget" runat="server" Text="Forget Password" OnClick="Forget_Click" ></asp:LinkButton>--%>
                
        </div>
    </form>
</body>
</html>
