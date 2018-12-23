<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="master.css" rel="stylesheet" />
    <title></title>
</head>
<body style="background:#808080">
    <form id="form1" runat="server">
    <div>
        <div class="wrapper" style="margin-left:auto;margin-right:auto; margin-top:100px;">

            <asp:TextBox ID="TextBoxEmail" runat="server" Height="30px" Width="300px" placeholder="Email" CssClass="textBoxStyle"></asp:TextBox><br />
            <asp:TextBox ID="TextBoxPassword" runat="server" Height="30px" Width="300px" placeholder="Password" CssClass="textBoxStyle" TextMode="Password"></asp:TextBox><br />
            <asp:Label ID="LabelWarning" runat="server" Text="" CssClass="labelWarning"></asp:Label><br /><br />
            <asp:Button ID="Button1" runat="server" Text="Login" CssClass="buttonStyle" OnClick="Button1_Click" />

        </div>
    </div>
    </form>
</body>
</html>
