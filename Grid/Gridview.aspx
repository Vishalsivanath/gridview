<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gridview.aspx.cs" Inherits="Grid.Gridview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="scripts/jquery.js"></script>
    <script src="scripts/jquery.colorbox.js"></script>
    <script src="scripts/jquery.colorbox-min.js"></script>

</head>
<body>
    <form id="form1" runat="server" autocomplete="off">  
        <asp:Button runat="server" ID="btnadd" Text="ADD" />
        <asp:Button runat="server" ID="btn" OnClick="btn_Click" Text="Refresh"/>
        <%--<asp:Calendar ID="cal" runat="server"></asp:Calendar>--%>
        <div>
            <asp:TextBox ID="txtname" runat="server" placeholder="Name" ></asp:TextBox> 
            <asp:TextBox ID="txtGender" runat="server" placeholder="Gender"></asp:TextBox>
            <asp:TextBox ID="txtRole"  runat="server" placeholder="Role" ></asp:TextBox>
            <asp:TextBox ID="txtCountry"  runat="server" placeholder="Country" ></asp:TextBox>
            <asp:TextBox ID="txtState"  runat="server" placeholder="State" ></asp:TextBox>
            <asp:TextBox ID="txtCity"  runat="server" placeholder="City" ></asp:TextBox>
            <asp:TextBox ID="txtStatus" runat="server" placeholder="status"></asp:TextBox>
            <asp:Button ID="btnGo" Text="Go" runat="server" OnClick="btnGo_Click"/>
        </div>
        
        <div>
            <asp:GridView ID="GridView1" runat ="server" AutoGenerateColumns="false" DataKeyNames="empid"
                OnRowDeleting="GridView1_RowDeleting"  BackColor="LavenderBlush">
                <Columns>
                    <asp:TemplateField HeaderText="ID" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate> 
                           <asp:HyperLink  ID="textId" runat="server" NavigateUrl='<%# "~/MainPage.aspx?empid=" + Eval("empid") + "&name=" + Eval("empName") %>' Text='<%# Eval("empid") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="EmpName">
                        <ItemTemplate>
                            <asp:Label ID="lbltext2" runat="server" Text='<%#Eval("empName")%>' ></asp:Label>
                            <asp:TextBox ID="text2" runat="server"  Text='<%#Eval("empName") %>' Visible="false" ></asp:TextBox>
                        </ItemTemplate>
                   </asp:TemplateField>

                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <asp:Label ID="lbltext3" runat="server" Text='<%#Eval("Gender")%>' ></asp:Label>
                            <asp:Textbox ID="text3" runat="server"  Text='<%#Eval("Gender") %>' Visible="false" ></asp:Textbox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="empRole">
                        <ItemTemplate>
                            <asp:Label ID="lbltext4" runat="server" Text='<%#Eval("empRole")%>' ></asp:Label>
                            <asp:TextBox ID="text4" runat="server"  Text='<%#Eval("empRole") %>' Visible="false" ></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                            <asp:Label ID="lbltext5" runat="server" Text='<%#Eval("country")%>' ></asp:Label>
                            <asp:DropDownList ID="ddlcountry" runat="server" Visible="false"  AutoPostBack="true" ></asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
    
                    <asp:TemplateField HeaderText="State">
                        <ItemTemplate>
                            <asp:Label ID="lbltext6" runat="server" Text='<%#Eval("state")%>' ></asp:Label>
                            <asp:DropDownList ID="ddlstate" runat="server" Visible="false" AutoPostBack="true" ></asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="lbltext7" runat="server" Text='<%#Eval("city")%>' ></asp:Label>
                            <asp:DropDownList ID="ddlcity" runat="server" Visible="false" ></asp:DropDownList>
                        </ItemTemplate>
                        </asp:TemplateField>

                    <asp:TemplateField HeaderText="UserName">
                        <ItemTemplate>
                            <asp:Label ID="lbltext8" runat="server" Text='<%#Eval("Username")%>' ></asp:Label>
                            <asp:TextBox ID="txtUsername" runat="server" Text='<%#Eval("Username") %>' Visible="false"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label ID="lbltext9" runat="server" Text='<%#Eval("Password")%>'></asp:Label>
                            <asp:TextBox ID="txtPassword" runat="server" Text='<%#Eval("Password") %>' Visible="false"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lbltext10" runat="server" Text='<%#Eval("status")%>' ></asp:Label>
                            <asp:Textbox ID="txtStatus" runat="server"  Text='<%#Eval("status") %>' Visible="false" ></asp:Textbox>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField>
                       <ItemTemplate>
                           <%--<asp:Button ID="btnedit" runat="server" Text="Edit" CommandName="Edit" OnClick="btnedit_Click"/>--%>
                           <asp:Button ID="Button1" runat="server" Text="Delete" CommandName="Delete" />
                       </ItemTemplate>
                   </asp:TemplateField>
                </Columns>     
            </asp:GridView>
        </div>
    </form>
     <script type="text/javascript">
         $(document).ready(function () {
            
             $("#btnadd").colorbox({
                 href: "https://localhost:44308/MainPage.aspx",
                 iframe: true,
                 width: '500',
                 height: '500',
                 transition: 'fade',
                 className: 'custom-cboxWrapper',
                 overlayClose: false,
                 onComplete: function () {
                     $(".cboxTitle").addClass("custom-popup-title");
                 }
             });

         });
    </script>
    <style>
        
        .custom-cboxWrapper {
            border-radius: 8px; 
            border: 2px solid #333; 
            background:linear-gradient(
                to bottom,                   
                rgba(255, 182, 193, 1),    
                rgba(216, 191, 216, 1)   
            );
            
        }
        .custom-cboxContent {
            padding: 20px; 
        }
        .custom-cboxClose {
            
            width: 32px;
            height: 32px;
        }
        .custom-popup-title {
            font-size: 18px;
            color: #333;
            font-weight: bold;
        }

        .cboxIframe{
            width:100% !important;
            height: 100% !important;
            
        }
    </style>
</body>
</html>
