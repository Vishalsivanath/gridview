<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="log.aspx.cs" Inherits="Grid.log" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">

        <div>
            
            <asp:Table runat="server" Font-Bold="true" BackColor="#99ffcc" BorderColor="#ff6699" BorderStyle="Groove" HorizontalAlign="Center" Width="405px">
                <asp:TableRow>
                    <asp:TableCell>UserName</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                        <span id="usernameerror" style="color:red"></span>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Password</asp:TableCell>
                    <asp:TableCell>
                        <asp:textbox id="txtpassword" runat="server" textmode="password"></asp:textbox>
                        <span id="pwderror" style="color:red"></span>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                         <asp:Button ID="Button1" runat="server" Text="Login" OnClick="btnLogin_Click"  BackColor="#66ccff" BorderColor="#999966" OnClientClick="return validation()" />
                <asp:Button ID="Button2" runat="server" Text="New Reg" OnClick="btnNew_Click" BackColor="#66ccff" BorderColor="#999966" />
           
        
                 <asp:LinkButton ID="LinkButton1" runat="server" Text="Forget Password" OnClick="Forget_Click" ></asp:LinkButton>
                        
                    </asp:TableCell>

                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lbme" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

               
                
        </div>
    </form>
    <script type="text/javascript">
        function validation() {

            var username = document.getElementById("txtUser").value
            var password = document.getElementById("txtPassword").value

            //var un = /^[A-Z][a-z]{3,20}$/;
            //var un = /^[A-Z][a-z][1-10]{3,20}$/;

            document.getElementById("usernameerror").innerHTML = "";
            document.getElementById("pwderror").innerHTML = "";

            var valid = true;

            
            if (username === "") {
                document.getElementById("usernameerror").innerHTML = "Username is required.";
                valid = false;
            }
            else if (!un.test(username)) {
                document.getElementById("usernameerror").innerHTML = "Username must be starts with capital letter";
                valid = false;
            }


            if (password === "") {
                document.getElementById("pwderror").innerHTML = "Password is required.";
                valid = false;
            }

            
            return valid;
        }
    </script>
</body>
</html>
