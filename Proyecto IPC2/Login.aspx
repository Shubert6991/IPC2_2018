<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Proyecto_IPC2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log in</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="body"></div>
		    <div class="grad"></div>
		        <div class="header">
			        <div>Proyecto<span>IPC2</span></div>
		        </div>
		        <br>
		        <div class="login">
				    <input type="text" placeholder="usuario" name="usuario" id="username" runat="server"/><br/>
				    <input type="password" placeholder="contraseña" name="contraseña" id="password" runat="server"/><br/>
				    <input type="submit" value="Entrar" name="entrar" runat="server" onserverclick="Unnamed_ServerClick1"/>
                    <input type="button" value="Registrarse" runat="server" onserverclick="Unnamed_ServerClick"/>
                    <br />
                    <label><a href="RecuperarContraseña.aspx">¿Olvidaste tu contraseña?</a></label>
                    <br />
                    <asp:Label ID="test" runat="server"></asp:Label>
		        </div>
    </form>
</body>
</html>
