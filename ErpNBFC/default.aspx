<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ErpNBFC._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                 <ContentTemplate>
                <fieldset>
                <legend>UpdatePanel1</legend>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                   <asp:Button ID="Button1" runat="server" Text="Refresh Panel 1" OnClick="Button1_OnClick" />
                </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
