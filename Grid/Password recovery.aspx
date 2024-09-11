<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Password recovery.aspx.cs" Inherits="Grid.Password_recovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>UserName</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>NewPassword</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Confirm NewPassword</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                    </asp:TableRow>
               </asp:Table>
            <asp:Button ID="btnSumbit" runat="server" Text="Sumbit" OnClick="btnSumbit_Click"/>
        </div>
    </form>
</body>
</html>
