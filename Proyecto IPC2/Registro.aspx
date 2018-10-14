<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Proyecto_IPC2.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro</title>
     <link rel="stylesheet" type="text/css" href="css/registro.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="body"></div>
            <div class="grad"></div>
		        <div class="header">
			        <div>Registro Proyecto<span>IPC2</span></div>
		        </div>
                <div class="reg">
                    <label>Numero de carnet</label>
				    <input type="text" placeholder="Ej. 201503971" runat="server" id="carnet"><br/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"   
                        ControlToValidate="carnet" ErrorMessage="Ingresa tu numero de carnet"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>  
                    <label>Contraseña</label>
				    <input type="password" placeholder="Contraseña" name="contraseña" runat="server" id="contraseña"><br>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"   
                        ControlToValidate="contraseña" ErrorMessage="Ingresa una contraseña valida"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br> 
                    <label>Repite la contraseña</label>
                    <input type="password" placeholder="Contraseña" name="contraseña" runat="server" id="contraseña2"><br>
                    <asp:CompareValidator runat="server" id="cmpNumbers" controltovalidate="contraseña" 
                        controltocompare="contraseña2" operator="equal" type="String" ForeColor="#CC0000"
                        errormessage="Las contraseñas no coinciden" /><br />
                    <label>Ingresa tu nombre</label>
				    <input type="text" placeholder="Nombre" name="nombre" runat="server" id="nombre"><br>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"   
                        ControlToValidate="carnet" ErrorMessage="Ingresa tu numero de carnet"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>  
                    <label>Ingresa tu apellido</label>
				    <input type="text" placeholder="Apellido" name="apellido" runat="server" id="apellido"><br>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"   
                        ControlToValidate="carnet" ErrorMessage="Ingresa tu apellido"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>  
                    <label>Ingresa tu fecha de nacimiento</label>
				    <input type="date" runat="server" id="fechanac"><br />  
                    <label>Ingresa tu correo electronico </label>
				    <input type="email" placeholder="correoprueba@prueba.com" pattern=".+@globex.com" size="30" runat="server" id="correo"><br>  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"   
                        ControlToValidate="correo" ErrorMessage="Ingresa tu correo"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" 
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="correo" 
                        ErrorMessage="Ingresa un correo electronico valido" ForeColor="#CC0000"></asp:RegularExpressionValidator><br />
                    <label>Ingresa tu numero de telefono</label>
                    <input type="text" placeholder="12345678" name="numero" runat="server" id="tel"><br>
                    <label>Ingresa una palabra clave</label>
                    <input type="text" placeholder="palabra clave" name="numero" runat="server" id="clave"><br>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"   
                        ControlToValidate="carnet" ErrorMessage="Ingresa tu apellido"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br> 
                     <input type="submit" value="Registrarse" runat="server" onserverclick="registro"><br />
                     <input type="button" value="Cancelar" runat="server" onserverclick="cancelar" id="cancel"><br />
                    <asp:Label ID="test" runat="server"></asp:Label>
		        </div>
        </div>
    </form>
</body>
</html>
