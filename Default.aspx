<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="hw4_part2_WebApplication.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <h1>Web Services to Process XML and XSD</h1>
            </div>

            <div>
                <h4>Please enter the following information for XML varification 
                 with correspondiong XSD file </h4>
                
                <asp:Label ID="Label1" runat="server" Text="XML URL (ex. https://www.public.asu.edu/~stanjim/Restaurants.xml ) "></asp:Label>
                <br /><asp:TextBox ID="TextBox1" width="450" runat="server"></asp:TextBox>
                
                <br />
                <asp:Label ID="Label2" runat="server" Text="XSD URL (ex. https://www.public.asu.edu/~stanjim/Restaurants.xsd)"></asp:Label>
                <br /><asp:TextBox ID="TextBox2"  width="450" runat="server"></asp:TextBox>
                <br /><br />
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                <asp:Button ID="Button1" runat="server" Text="Validate XML Document" OnClick="Button1_Click" />

                <br />
                  &nbsp; &nbsp;<asp:Label ID="Label3" runat="server" Text="Press validate to see the result "></asp:Label>
            </div>

            <div>
                <h4>Please enter the following information for XPathSearch</h4>

                <asp:Label ID="Label4" runat="server" Text="XML URL : (ex. https://www.public.asu.edu/~stanjim/Restaurants.xml )"></asp:Label>
             <br /><asp:TextBox ID="TextBox3"  width="450" runat="server"></asp:TextBox>

                <br />  
                <asp:Label ID="Label5" runat="server" Text="XPath Expression : (ex. /Restaurants/Restaurant[4]/Website/@facebook)"></asp:Label>
                <br /><asp:TextBox ID="TextBox4"  width="450" runat="server"></asp:TextBox>
                <br /><br />
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                <asp:Button ID="Button2" runat="server" Text="Test Query" OnClick="Button2_Click" />
                <br />          
                <asp:Label ID="Label6" runat="server" Text="Press Search to see the result "></asp:Label>

            </div>

        </div>
    </form>
</body>
</html>
