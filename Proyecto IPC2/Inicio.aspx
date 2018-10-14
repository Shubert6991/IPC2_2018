<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Proyecto_IPC2.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inicio</title>
    <link rel="stylesheet" type="text/css" href="css/inicio.css" />
</head>
<body>  
        <nav runat="server" id="adminmen" visible="false">
            <ul>
                <li class="activo"><a href="inicio.aspx">Inicio</a></li>
                <li><a href="ASalones.aspx">Administracion de Salones</a></li>
                <li><a href="CUsuarios.aspx">Control de usuarios</a></li>
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
                <li class="activo"><a href="inicio.aspx">Inicio</a></li>
                <li><a href="ASalones.aspx">Administracion de Salones</a></li>
                <li><a href="CUsuarios.aspx">Control de usuarios</a></li>
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
                <li class="activo"><a href="inicio.aspx">Inicio</a></li>
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
                <li class="activo"><a href="inicio.aspx">Inicio</a></li>
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
    <form id="form1" runat="server">
        <h1 runat="server" id="mes"></h1>
    <div>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" CssClass="Calendario">
        </asp:GridView>
    </div>
    </form>
</body>
</html>
