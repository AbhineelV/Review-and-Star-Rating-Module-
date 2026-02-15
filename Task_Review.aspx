<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Task_Review.aspx.cs" Inherits="Connectivity_First_Prog.Task_Review" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Review and Star Rating Module </title>

     <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">


            Enter ID :
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Enter Name :
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            Enter Email :
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Select Rating :
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Select</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Enter Comment :
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Display" OnClick="Button2_Click" />
            <br />
            <br />

            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" >
                <ItemTemplate>
                    <b> Name </b>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("name") %>'></asp:Label>

                    <b> Rating </b>
                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("rating") %>'></asp:Label>

                    <asp:Image ID="Image1" runat="server" ImageUrl="~/pic/star.jpg" Height="100" Width="100" Visible="false" />
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/pic/star.jpg" Height="100" Width="100" Visible="false" />
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/pic/star.jpg" Height="100" Width="100" Visible="false" />
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/pic/star.jpg" Height="100" Width="100" Visible="false"/>
                    <br />

                    <b>Comment </b>
                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("comment") %>'></asp:Label> <br /> <hr />
                </ItemTemplate>
            </asp:Repeater>
            <br />
            <br />

        </div>
    </form>
</body>
</html>
