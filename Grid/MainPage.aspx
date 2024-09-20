<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Grid.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="scripts/jquery.js" type="text/javascript"></script>
    <script>
        function ValidateData() {
            parent.$.colorbox.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <asp:ScriptManager runat="server" ID="srcManager"></asp:ScriptManager>
           <asp:Table runat="server" CellPadding="10" HorizontalAlign="Center" BorderStyle="Ridge" BorderColor="Violet" >

                <asp:TableRow>
                    <asp:TableCell>Name:</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtName" runat="server" ></asp:TextBox>
                        
                    </asp:TableCell>
                </asp:TableRow>

                
                <asp:TableRow>
                    <asp:TableCell>Gender:</asp:TableCell>
                    <asp:TableCell>
                        <asp:RadioButton ID="RdMale" runat="server" GroupName="Gender" Text="Male" />
                        <asp:RadioButton ID="RdFemale" runat="server" GroupName="Gender" Text="FeMale" />
                        <asp:RadioButton ID="RdOthers" runat="server" GroupName="Gender" Text="Others" />
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Role:</asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlROle" runat="server">
                            <asp:ListItem>--select--</asp:ListItem>
                            <asp:ListItem>Dev</asp:ListItem>             
                            <asp:ListItem>Testing</asp:ListItem>
                            <asp:ListItem>Build</asp:ListItem>
                            <asp:ListItem>Sales</asp:ListItem>
                            <asp:ListItem>Project Manager</asp:ListItem>
                            <asp:ListItem>Database Administrator</asp:ListItem>
                            <asp:ListItem>HR Specialist</asp:ListItem>
                            <asp:ListItem>Network Engineer</asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Country :</asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" >
                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                        </asp:DropDownList>
                           
                    </asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow>
                    <asp:TableCell>State</asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                            
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>


                <asp:TableRow>
                    <asp:TableCell>City</asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlCity" runat="server">
                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                            
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>

               <asp:TableRow>
                   <asp:TableCell>Username:</asp:TableCell>
                   <asp:TableCell>
                       <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                       
                   </asp:TableCell>
               </asp:TableRow>

               <asp:TableRow>
                   <asp:TableCell>Password:</asp:TableCell>
                   <asp:TableCell>
                       <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
               
                   </asp:TableCell>
               </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell>Status:</asp:TableCell>
                   <asp:TableCell>
                       <asp:RadioButton ID="rdl" runat="server" GroupName="a" Text="Active" />
                       <asp:RadioButton ID="rd2" runat="server" GroupName="a" Text="Inactive" />
                   </asp:TableCell>
               </asp:TableRow>
                <asp:TableRow>                   
                    <asp:TableCell>
                        <asp:Button ID="btnSumbit"  runat="server" Text="Sumbit" OnClick="btn_Sumbit_Click" OnClientClick="return ValidateData();" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"  />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" PostBackUrl="~/Gridview.aspx" />
        </div>
        
    </form>
</body>
</html>
