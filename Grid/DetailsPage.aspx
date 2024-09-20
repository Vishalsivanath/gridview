<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailsPage.aspx.cs" Inherits="Grid.DetailsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Details</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat ="server" AutoGenerateColumns="false" DataKeyNames="empid"
                OnRowDeleting="GridView1_RowDeleting"  BackColor="NavajoWhite"  >
                <Columns>
                    <asp:TemplateField HeaderText="ID" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate> 
                            <%--<asp:Label ID="lbltextId" runat="server" Text='<%#Eval("empid")%>' ></asp:Label>
                            <asp:TextBox ID="textId" runat="server"  Text='<%#Eval("empid")%>' Visible="false" ></asp:TextBox>--%>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/MainPage.aspx?empid=" + Eval("empid") %>' Text='<%# Eval("empid") %>' />
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
                            <asp:DropDownList ID="ddlcity" runat="server" Visible="false"  ></asp:DropDownList>
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
                            <asp:Label ID="lbltext9" runat="server" Text='<%#Eval("Password")%>' ></asp:Label>
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
                           <asp:Button ID="Button1" runat="server" Text="LogOut" OnClick="Button1_Click"/>
                       </ItemTemplate>
                       
                   </asp:TemplateField>
                   
                </Columns>     

            </asp:GridView>
        </div>
    </form>
</body>
</html>
