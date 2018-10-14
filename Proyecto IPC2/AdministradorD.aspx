<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministradorD.aspx.cs" Inherits="Proyecto_IPC2.AdministradorD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inicio</title>
    <link rel="stylesheet" href="css/menu.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id='cssmenu'>
            <ul>
            <li class='active'><a href='#'>Home</a></li>
            <li><a href='#'>Products</a></li>
            <li><a href='#'>Company</a></li>
            <li><a href='#'>Contact</a></li>
            </ul>
            </div>
            <h1>Bienvenido administrador: </h1>
            <h1 id="adminn" runat="server"></h1> 
        </div>
    </form>
</body>
</html>
