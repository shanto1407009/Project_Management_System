<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="master.css" rel="stylesheet" />
    <link href="css/pikaday.css" rel="stylesheet" />
    <link href="css/theme.css" rel="stylesheet" />
    <link href="css/triangle.css" rel="stylesheet" />
    <script src="pikaday.js"></script>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 152px;
        }
        .auto-style3 {
            width: 421px;
            text-align: left;
        }
        .auto-style4 {
            width: 161px;
        }
    </style>
</head>
<body style="background:#808080">
    <form id="form1" runat="server">
    <div>
        <div class="wrapper2">
            <asp:Button ID="logoutUser" runat="server" Text="Logout" CssClass="buttonStyle" OnClick="logoutUser_Click" />
            <asp:Label ID="welcomeLabel" runat="server" Text="" Font-Size="25px" style="margin-top:20px"></asp:Label>
        </div>
        





        <asp:Panel runat="server" ID="divAdmin">
        <div class="wrapper" style="margin-left:auto;margin-right:auto;">
            <asp:Button ID="AddUpdateUser" runat="server" Text="Add/Update User" CssClass="buttonStyle" style="" OnClick="AddUpdateUser_Click" /><asp:Button ID="ShowProjects" runat="server" Text="Show Projects" CssClass="buttonStyle" OnClick="ShowProjects_Click" />
            <asp:Panel runat="server" ID="divAddUpdateUser">
            <div style="margin-top:20px;">
                <u><asp:Label runat="server" Text="Add/Update User" style="font-size: x-large"></asp:Label><br /></u>
            <table class="auto-style1">
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label1" runat="server" Text="Name" style="text-align: right"></asp:Label>
                    </td>
                    <td style="text-align: left">
                        <asp:TextBox ID="UserName" runat="server" Height="20px" Width="250px"></asp:TextBox>
                    </td>
                
                </tr>
                <tr>
                    <td style="text-align: right"><asp:Label ID="Label2"  runat="server" Text="Email"></asp:Label></td>
                    <td style="text-align: left">
                        <asp:TextBox ID="UserEmail" runat="server"  Height="20px" Width="250px"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td style="text-align: right"><asp:Label ID="Label3"  runat="server" Text="Password"></asp:Label></td>
                    <td style="text-align: left">
                        <asp:TextBox ID="UserPassword" runat="server"  Height="20px" Width="250px"></asp:TextBox>
                    </td>
                    <td style="text-align: left">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ImageUrl="~/images/refresh.png" OnClick="ImageButton1_Click" style="text-align: left"/>
                    </td>
                    
                </tr>
                <tr>
                    <td style="text-align: right"><asp:Label ID="Label4"  runat="server" Text="Status"></asp:Label></td>
                    <td style="text-align: left">
                        <asp:RadioButtonList ID="UserStatus" runat="server" Width="99px">
                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Inactive</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    
                </tr>
                <tr>
                    <td style="text-align: right"><asp:Label ID="Label5"  runat="server" Text="Designation"></asp:Label></td>
                    <td style="text-align: left">
                        <asp:DropDownList ID="UserDesignation" runat="server"  Height="20px" Width="250px">
                            <asp:ListItem>IT Admin</asp:ListItem>
                            <asp:ListItem>Project Manager</asp:ListItem>
                            <asp:ListItem>Team Lead</asp:ListItem>
                            <asp:ListItem>Developer</asp:ListItem>
                            <asp:ListItem>QA Engineer</asp:ListItem>
                            <asp:ListItem>UX Enginner</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    
                </tr>
           
                <tr>
                    <td></td>
                    <td style="text-align: right">
                        <asp:Button ID="SaveUser" runat="server" Text="Save User" CssClass="buttonStyle" OnClick="SaveUser_Click" />
                        <asp:Button ID="UpdateUser" runat="server" Text="Update User" CssClass="buttonStyle" OnClick="UpdateUser_Click"/>
                    </td>
                    <td style="text-align: left">
                        <asp:Label ID="labelWarning" runat="server" Text="" CssClass="labelWarning"></asp:Label>
                    </td>
                   
                </tr>
            </table>

        </div>

                </asp:Panel>

            <asp:Panel runat="server" ID="divShowProjects">
                <div style="margin-top:20px;">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="Name" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Width="792px">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                            <asp:BoundField DataField="CodeName" HeaderText="CodeName" SortExpression="CodeName" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
                            <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
                            <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" SelectCommand="SELECT * FROM [ProjectInformation]"></asp:SqlDataSource>

            </div>
            </asp:Panel>
            



        </div>
            </asp:Panel>



        

        <asp:Panel runat="server" ID="divProjectManager">

            <div class="wrapper" style="margin-left:auto;margin-right:auto;">
                <asp:Button ID="ShowMine" runat="server" Text="Show My Projects" CssClass="buttonStyle" OnClick="ShowMine_Click" /><asp:Button ID="AddProject" runat="server" Text="Add/Update Project" CssClass="buttonStyle" OnClick="AddProject_Click" /><asp:Button ID="AssignUser" runat="server" Text="Assign Resource Person" CssClass="buttonStyle" OnClick="AssignUser_Click" />
               

                <asp:Panel runat="server" ID="divShowMine">


                    <div style="margin-top:20px;">

                        <u><asp:Label ID="Label18" runat="server" Text="All Projects In which i am involved" Font-Size="24px"></asp:Label></u>

                        <asp:GridView ID="MyProjectList" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" style="margin-top:20px; margin-left:auto; margin-right:auto">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                        <br />
                        <asp:DropDownList ID="ProjectList3" runat="server" Height="20px" style="margin-left: 0px" Width="250px">
                        </asp:DropDownList>
                        <asp:Button ID="btnDetails" runat="server" Text="Details" CssClass="buttonStyle" OnClick="btnDetails_Click" />



                    </div>


                </asp:Panel>

                 <asp:Panel runat="server" ID="divAddProject">

                    <div style="margin-top:20px">



                        <table class="auto-style1">
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <u><asp:Label ID="Label6" runat="server" Text="Add/Update Project" style="font-size: x-large"></asp:Label></u>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="text-align: right"><asp:Label ID="Label7" runat="server" Text="Name"></asp:Label></td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="ProjectName" runat="server" Height="20px" Width="250px"></asp:TextBox>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="text-align: right"><asp:Label ID="Label8" runat="server" Text="Code Name"></asp:Label></td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="ProjectCodeName" runat="server"  Height="20px" Width="250px"></asp:TextBox>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="text-align: right"><asp:Label ID="Label9" runat="server" Text="Description"></asp:Label></td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="ProjectDescription" runat="server"  Height="39px" Width="250px"></asp:TextBox>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="text-align: right"><asp:Label ID="Label10" runat="server" Text="Possible Start Date"></asp:Label></td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="StartDate" runat="server" Height="20px" Width="250px"></asp:TextBox>
                                    <script type="text/javascript">
                                        var picker = new Pikaday(
                                            {
                                                field: document.getElementById('StartDate'),
                                                firstDay: 1,
                                                minDate: new Date('2000-01-01'),
                                                maxDate: new Date('2030-12-31'),
                                                yearRange: [2000, 2020],
                                                numberOfMonths: 1,
                                                theme: 'dark-theme'
                                            });
                                    </script>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: right"><asp:Label ID="Label11" runat="server" Text="Possible End Date"></asp:Label></td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="EndDate" runat="server" Height="20px" Width="250px"></asp:TextBox>
                                    <script type="text/javascript">
                                        var picker = new Pikaday(
                                            {
                                                field: document.getElementById('EndDate'),
                                                firstDay: 1,
                                                minDate: new Date('2000-01-01'),
                                                maxDate: new Date('2030-12-31'),
                                                yearRange: [2000, 2020],
                                                numberOfMonths: 1,
                                                theme: 'dark-theme'
                                            });
                                    </script>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: right"><asp:Label ID="Label12" runat="server" Text="Duration(in days)"></asp:Label></td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="ProjectDuration" runat="server"  Height="20px" Width="250px"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ImageUrl="~/images/refresh.png" style="text-align: left" OnClick="ImageButton2_Click"/>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: right"><asp:Label ID="Label13" runat="server" Text="Upload Files"></asp:Label></td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="TextBox4" runat="server"  Height="20px" Width="250px"></asp:TextBox>
                                    <asp:Button ID="browseFile" runat="server" Text="Browse" CssClass="buttonStyle" OnClick="browseFile_Click" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: right"><asp:Label ID="Label14" runat="server" Text="Status"></asp:Label></td>
                                <td>
                                    <asp:RadioButtonList ID="ProjectStatus" runat="server" style="text-align: left">
                                        <asp:ListItem>Not Started</asp:ListItem>
                                        <asp:ListItem>Started</asp:ListItem>
                                        <asp:ListItem>Completed</asp:ListItem>
                                        <asp:ListItem>Cancelled</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td style="text-align: right">
                                    <asp:Label ID="labelWarning2" runat="server" style="text-align: left" Text="" CssClass="labelWarning"></asp:Label>
                                    <asp:Button ID="AddProjectDescription" runat="server" Text="Add Project" CssClass="buttonStyle" OnClick="AddProjectDescription_Click" />
                                    <asp:Button ID="UpdateProjectDescription" runat="server" Text="Update Project" CssClass="buttonStyle" OnClick="UpdateProjectDescription_Click" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>



                    </div>

                </asp:Panel>


                <asp:Panel runat="server" ID="divAssignResourcePerson">

                    <div style="margin-top:20px;">

                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style3" style="text-align: center">
                                    <u><asp:Label ID="Label15" runat="server" style="font-size: x-large" Text="Assign Resouce Person"></asp:Label></u>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style4" style="text-align: right"><asp:Label ID="Label16" runat="server" Text="Select Project"></asp:Label></td>
                                
                                <td style="text-align: left" class="auto-style3">
                                    <asp:DropDownList ID="ProjectList" runat="server" Height="20px" Width="250px">
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style4" style="text-align: right"><asp:Label ID="Label17" runat="server" Text="Select Resource Person"></asp:Label></td>
                                <td style="text-align: left" class="auto-style3">
                                    <asp:DropDownList ID="ResourcePersonList" runat="server" Height="20px" Width="250px">
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style4">&nbsp;</td>
                                <td style="text-align: right" class="auto-style3">
                                    <asp:Label ID="labelWarning3" runat="server" Text="" CssClass="labelWarning" ></asp:Label>
                                    <asp:Button ID="AddPerson" runat="server" Text="Add" CssClass="buttonStyle" OnClick="AddPerson_Click" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style3">
                                    <asp:DropDownList ID="ProjectList2" runat="server" Height="20px" style="margin-left: 0px" Width="250px">
                                    </asp:DropDownList>
                                    <asp:Button ID="btnViewMember" runat="server" CssClass="buttonStyle" Text="View Member" OnClick="btnViewMember_Click" />
                                </td>
                                <td style="text-align: left">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style3">
                                    <asp:GridView ID="ViewMember" runat="server" Width="419px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                                        <AlternatingRowStyle BackColor="#CCCCCC" />
                                        <FooterStyle BackColor="#CCCCCC" />
                                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#808080" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#383838" />
                                    </asp:GridView>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>

                    </div>
                    

                </asp:Panel>


            </div>

           
            </asp:Panel>


        
        
    </div>
       
    </form>
</body>
</html>
