<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modificar.aspx.cs" Inherits="Proyecto_IPC2.modificar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title runat="server" id="titlemodificar"></title>
    <link rel="stylesheet" type="text/css" href="css/modificar.css" />
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
    <form id="container" runat="server">
        <asp:Label ID="test" runat="server"></asp:Label>
        <label>nombre de usuario</label> 
        <input type="text" runat="server" id="unamemod"/>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"   
                        ControlToValidate="unamemod" ErrorMessage="Ingresa tu nombre de usuario"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>
        <label>contraseña</label> 
        <input type="text" runat="server" id="contramod"/>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"   
                        ControlToValidate="contramod" ErrorMessage="Ingresa tu numero de carnet"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>
        <label>nombre</label> 
        <input type="text" runat="server" id="nombremod"/>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"   
                        ControlToValidate="nombremod" ErrorMessage="Ingresa tu numero de carnet"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>
        <label>apellido</label> 
        <input type="text" runat="server" id="apellidomod"/>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"   
                        ControlToValidate="apellidomod" ErrorMessage="Ingresa tu numero de carnet"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>
        <label runat="server" id="rollabel">rol</label> 
        <input type="text" runat="server" id="rolmod"/>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"   
                        ControlToValidate="rolmod" ErrorMessage="Ingresa tu numero de carnet"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>
        <label>carnet</label> 
        <input type="text" runat="server" id="carnetmod"/>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"   
                        ControlToValidate="carnetmod" ErrorMessage="Ingresa tu numero de carnet"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>
        <label>correo</label> 
        <input type="text" runat="server" id="correomod"/>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"   
                        ControlToValidate="correomod" ErrorMessage="Ingresa tu numero de carnet"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>
        <label>fecha de nacimiento</label> 
        <input type="text" runat="server" id="fechanacmod"/>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"   
                        ControlToValidate="fechanacmod" ErrorMessage="Ingresa tu numero de carnet"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>
        <label>telefono</label>
        <input type="text" runat="server" id="telefonomod"/>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"   
                        ControlToValidate="telefonomod" ErrorMessage="Ingresa tu numero de carnet"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>
        <label>palabla clave</label> 
        <input type="text" runat="server" id="pclavemod"/>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"   
                        ControlToValidate="pclavemod" ErrorMessage="Ingresa tu numero de carnet"   
                        ForeColor="#CC0000"></asp:RequiredFieldValidator><br>
        <input type="submit" value="Modificar Usuario" runat="server" onserverclick="modificarbtn"><br />
        <input type="button" value="Cancelar" runat="server" onserverclick="cancelar" id="cancel"><br />
    </form>
</body>
</html>
