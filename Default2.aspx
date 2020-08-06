<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="capture" style="padding: 10px; background: #f5da55">
        <h4 style="color: #000;">Hello world!</h4>
    </div>
    <script src="myContent/JS/html2canvas.js"></script>

    <script type="text/javascript">
        html2canvas(document.querySelector("#capture")).then(canvas => {
            document.body.appendChild(canvas)
            window.print();
        });
    </script>
    </form>
</body>
</html>
