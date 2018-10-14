<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContraseña.aspx.cs" Inherits="Proyecto_IPC2.RecuperarContraseña" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>recuperar contraseña</h1>
            <label>Ingresa tu correo electronico</label>
            <input type="text" placeholder="Palabra Clave" runat="server" id="correo"/>
            <label>Ingresa tu palabra clave</label>
            <input type="text" placeholder="Palabra Clave" runat="server" id="palabraclave"/>
            <input type="submit" value="recuperar contraseña" runat="server" id="recuperar" onserverclick="recuperar_ServerClick"/>
            <asp:Label runat="server" ID="test"></asp:Label>
        </div>
    </form>
</body>
</html>
