<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectDetails.aspx.cs" Inherits="ProjectDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/pikaday.css" rel="stylesheet" />
    <link href="css/theme.css" rel="stylesheet" />
    <link href="css/triangle.css" rel="stylesheet" />
    <script src="pikaday.js"></script>
    <link href="master.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 275px;
            text-align: right;
        }
        .auto-style3 {
            width: 275px;
            height: 23px;
            text-align: right;
        }
        .auto-style4 {
            height: 23px;
            text-align: left;
        }
        .auto-style5 {
            height: 21px;
        }
        .auto-style6 {
            width: 275px;
            height: 21px;
            text-align: right;
        }
        .auto-style7 {
            width: 380px;
            text-align: right;
        }
        .auto-style8 {
            width: 199px;
            text-align: right;
        }
        .auto-style9 {
            height: 25px;
            text-align: left;
        }
        .auto-style10 {
            width: 389px;
            text-align: right;
        }
        .auto-style11 {
            height: 25px;
            text-align: right;
            width: 389px;
        }
    </style>
</head>
<body style="background:#808080">
    <form id="form1" runat="server">
    <div>
        <div class="wrapper" style="margin-left:auto;margin-right:auto; margin-top:50px;">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td style="font-size: x-large; text-align:left;">
                        <u><asp:Label ID="Label1" runat="server" Text="Project Details" style="font-weight: 700"></asp:Label></u>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="Label9" runat="server" Text="Project Name"></asp:Label></td>
                    <td style="text-align: left" class="auto-style5">
                        <asp:Label ID="LProjectName" runat="server" CssClass="labelStyle" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><asp:Label ID="Label10" runat="server" Text="Code Name"></asp:Label></td>
                    <td style="text-align: left">
                        <asp:Label ID="LCodeName" runat="server" CssClass="labelStyle"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><asp:Label ID="Label11" runat="server" Text="Description"></asp:Label></td>
                    <td style="text-align: left">
                        <asp:Label ID="LProjectDescription" runat="server" CssClass="labelStyle"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"><asp:Label ID="Label12" runat="server" Text="Status"></asp:Label></td>
                    <td class="auto-style4">
                        <asp:Label ID="LProjectStatus" runat="server" CssClass="labelStyle"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><asp:Label ID="Label13" runat="server" Text="Possible Start Date"></asp:Label></td>
                    <td style="text-align: left">
                        <asp:Label ID="LStartDate" runat="server" CssClass="labelStyle"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><asp:Label ID="Label14" runat="server" Text="Possible End Date"></asp:Label></td>
                    <td style="text-align: left">
                        <asp:Label ID="LEndDate" runat="server" CssClass="labelStyle"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><asp:Label ID="Label15" runat="server" Text="Duration"></asp:Label></td>
                    <td style="text-align: left">
                        <asp:Label ID="LDuration" runat="server" CssClass="labelStyle"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><asp:Label ID="Label16" runat="server" Text="Resource Person"></asp:Label></td>
                    <td style="text-align: left">
                        <asp:GridView ID="ProjectResourcePerson" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="339px">
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
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td style="text-align: left; font-size: x-large">
                        <u><asp:Label ID="Label17" runat="server" Text="Project Task" style="margin-top:20px; font-weight: 700;"></asp:Label></u>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td style="text-align: left">
                        <asp:GridView ID="ProjectTask" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="436px">
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
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td style="text-align: right">
                        <asp:Button ID="TaskAddComment" runat="server" Text="Add Comment" CssClass="buttonStyle" OnClick="TaskAddComment_Click" />
                        <asp:Button ID="TaskComments" runat="server" Text="Comments" CssClass="buttonStyle" OnClick="TaskComments_Click" />
                        <asp:Button ID="btnCreateTask" runat="server" Text="Create Task" CssClass="buttonStyle" OnClick="btnCreateTask_Click" />
                    </td>
                </tr>
            </table>

        

        <asp:Panel runat="server" ID="divAddTask">

            <div style="margin-top:20px;">

                <table class="auto-style1">
                    <tr>
                        <td class="auto-style7">&nbsp;</td>
                        <td style="font-size: x-large; text-align: left">
                            <u><asp:Label ID="Label18" runat="server" Text="Add Task" style="font-weight: 700"></asp:Label></u>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style7">
                            &nbsp;</td>
                        <td style="text-align: left">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style7"><asp:Label ID="Label3" runat="server" Text="Assign to"></asp:Label></td>
                        <td style="text-align: left">
                            <asp:DropDownList ID="TaskAssignTo" runat="server" Height="20px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="247px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7"><asp:Label ID="Label4" runat="server" Text="Description"></asp:Label></td>
                        <td style="text-align: left">
                            <asp:TextBox ID="TaskDescription" runat="server" Height="40px" Width="250px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7"><asp:Label ID="Label5" runat="server" Text="Due Date"></asp:Label></td>
                        <td style="text-align: left">
                            <asp:TextBox ID="TaskDueDate" runat="server" Height="20px" Width="250px"></asp:TextBox>
                            <script type="text/javascript">
                                var picker = new Pikaday(
                                    {
                                        field: document.getElementById('TaskDueDate'),
                                        firstDay: 1,
                                        minDate: new Date('2000-01-01'),
                                        maxDate: new Date('2030-12-31'),
                                        yearRange: [2000, 2020],
                                        numberOfMonths: 1,
                                        theme: 'dark-theme'
                                    });
                                    </script>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7"><asp:Label ID="Label6" runat="server" Text="Priority"></asp:Label></td>
                        <td style="text-align: left">
                            <asp:DropDownList ID="TaskPriority" runat="server" Height="20px" Width="248px">
                                <asp:ListItem>Low</asp:ListItem>
                                <asp:ListItem>Medium</asp:ListItem>
                                <asp:ListItem>High</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">&nbsp;</td>
                        <td>
                            <asp:Label ID="labelWarning4" runat="server" CssClass="labelWarning"></asp:Label>
                            <asp:Button ID="SaveTask" runat="server" Text="Save" CssClass="buttonStyle" style="margin-top:20px;" OnClick="SaveTask_Click" />
                        </td>
                    </tr>
                </table>

            </div>

        </asp:Panel>

            <asp:Panel runat="server" ID="divComment">

            
                <div style="margin-top:20px;">

                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style8">&nbsp;</td>
                            <td>
                                <u><asp:Label ID="Label19" runat="server" style="font-size: x-large; text-align:left; font-weight: 700;" Text="Comments of a Task"></asp:Label></u>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style8">
                                <asp:Label ID="Label20" runat="server" Text="Select a Task"></asp:Label>
                            </td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="TaskList" runat="server" Height="20px" style="margin-left: 0px" Width="250px">
                                </asp:DropDownList>
                                <asp:Button ID="ShowComment" runat="server" Text="Show" CssClass="buttonStyle" OnClick="ShowComment_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style8">&nbsp;</td>
                            <td>
                                <asp:GridView ID="CommentList" runat="server" Width="588px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
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
                        </tr>
                    </table>

                </div>

            </asp:Panel>

            <asp:Panel runat="server" ID="divAddComment">

                <div style="margin-top:20px;">

                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td style="text-align: left">
                                <asp:Label ID="Label21" runat="server" style="font-size: x-large; text-decoration: underline; font-weight: 700" Text="Add Comment"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                <asp:Label ID="Label22" runat="server" Text="Select Task"></asp:Label>
                            </td>
                            <td class="auto-style9">
                                <asp:DropDownList ID="TaskList2" runat="server" Height="20px" Width="250px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">
                                <asp:Label ID="Label23" runat="server" Text="Comment"></asp:Label>
                            </td>
                            <td style="text-align: left">
                                <asp:TextBox ID="TaskComment" runat="server" Height="53px" Width="250px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td style="text-align: right">
                                <asp:Label ID="labelWarning5" runat="server" CssClass="labelWarning" ></asp:Label>
                                <asp:Button ID="SaveComment" runat="server" Text="Save" CssClass="buttonStyle" OnClick="SaveComment_Click" />
                            </td>
                        </tr>
                    </table>

                </div>

            </asp:Panel>

            </div>
    </div>
    </form>
</body>
</html>
