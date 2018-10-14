<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CUsuarios.aspx.cs" Inherits="Proyecto_IPC2.CUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Control de Usuarios</title>
    <link rel="stylesheet" type="text/css" href="css/CUsuarios.css" />
</head>
<body>
    <!--inicio menu-->
    <nav runat="server" id="adminmen" visible="false">
        <ul>
            <li><a href="inicio.aspx">Inicio</a></li>
            <li><a href="ASalones.aspx">Administracion de Salones</a></li>
            <li class="activo"><a href="CUsuarios.aspx">Control de usuarios</a></li>
            <li><a href="CMasiva.aspx">Carga masiva</a></li>
            <li class="right">
                <a class="active">Perfil</a>
                <div class="dropdown">
                    <a href="info.aspx">Informacion</a>
                    <a runat="server" onserverclick="Cerrar_Sesion">Cerrar sesion</a>
                </div>
            </li>
        </ul>
    </nav>
    <nav runat="server" id="operadormen" visible="false">
        <ul>
            <li><a href="inicio.aspx">Inicio</a></li>
            <li><a href="ASalones.aspx">Administracion de Salones</a></li>
            <li class="activo"><a href="CUsuarios.aspx">Control de usuarios</a></li>
            <li class="right">
                <a class="active">Perfil</a>
                <div class="dropdown">
                    <a href="info.aspx">Informacion</a>
                    <a runat="server" onserverclick="Cerrar_Sesion">Cerrar sesion</a>
                </div>
            </li>
        </ul>
    </nav>
    <nav runat="server" id="instructormen" visible="false">
        <ul>
            <li><a href="inicio.aspx">Inicio</a></li>
            <li><a href="SalonesR.aspx">Salones Reservados</a></li>
            <li class="right">
                <a class="active">Perfil</a>
                <div class="dropdown">
                    <a href="info.aspx">Informacion</a>
                    <a runat="server" onserverclick="Cerrar_Sesion">Cerrar sesion</a>
                </div>
            </li>
        </ul>
    </nav>
    <nav runat="server" id="alumnomen" visible="false">
        <ul>
            <li><a href="inicio.aspx">Inicio</a></li>
            <li><a href="Asistencia.aspx">Asistencias</a></li>
            <li class="right">
                <a class="active">Perfil</a>
                <div class="dropdown">
                    <a href="info.aspx">Informacion</a>
                    <a runat="server" onserverclick="Cerrar_Sesion">Cerrar sesion</a>
                </div>
            </li>
        </ul>
    </nav>
    <!-- fin menu !-->
    <div class="container">
        <form runat="server">
            <h2>seleccione la operacion que desea realizar:</h2>
            <button runat="server" id="crear" onserverclick="crear_ServerClick">Crear</button>
                <div runat="server" id="crear_usuario" visible="false">
                    <div id="formulario" runat="server">
                    <label>Seleccione el rol del nuevo usuario</label>
                    <asp:DropDownList ID="rol" runat="server" OnSelectedIndexChanged="rol_ServerChange" AutoPostBack="true">
                        <asp:ListItem Enabled="true" Text="Administrador" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Operador de sistema" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Instructor" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Alumno" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="roloperador" runat="server" OnSelectedIndexChanged="rol_ServerChange2" AutoPostBack="true">
                        <asp:ListItem Text="Instructor" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Alumno" Value="3"></asp:ListItem>
                    </asp:DropDownList>    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"   
                        ControlToValidate="rol" ErrorMessage="Seleccione un rol"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>  
                    <label runat="server" id="lcarnet">Numero de carnet</label>
				    <input type="text" placeholder="Ej. 201503971" runat="server" id="carnet"><br/>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"   
                        ControlToValidate="carnet" ErrorMessage="Ingresa tu numero de carnet"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>
                    <label runat="server" id="Lusuario">Ingresa tu nombre de usuario</label>
				    <input type="text" placeholder="Nombre" name="nombre" runat="server" id="uname"><br>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"   
                        ControlToValidate="uname" ErrorMessage="Ingresa tu nombre de usuario"   
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
				    <input type="email" placeholder="correoprueba@prueba.com" size="30" runat="server" id="correo"><br>  
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
                     <input type="submit" value="Crear Usuario" runat="server" onserverclick="registro"><br />
                     <input type="button" value="Cancelar" runat="server" onserverclick="cancelar" id="cancel"><br />
                    </div>
                </div>
            <button runat="server" id="modificar" onserverclick="modificar_ServerClick">Modificar/Eliminar</button>
            <asp:GridView ID="tablamodificar" runat="server" CssClass="tablamodificar" OnRowCommand="tablamodificar_RowCommand" OnRowDeleting="tablamodificar_RowDeleting">
                <Columns>
                    <asp:ButtonField CommandName="Select" Text="Modificar" />
                </Columns>
                <Columns>
                    <asp:ButtonField CommandName="Delete" Text="Eliminar" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="test" runat="server"></asp:Label>
        </form>
    </div>
</body>
</html>
