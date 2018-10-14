<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ASalones.aspx.cs" Inherits="Proyecto_IPC2.ASalones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administracion de Salones</title>
    <link rel="stylesheet" type="text/css" href="css/asalones.css" />
</head>
<body>
    <!--inicio menu-->
    <nav runat="server" id="adminmen" visible="false">
        <ul>
            <li><a href="inicio.aspx">Inicio</a></li>
            <li class="activo"><a href="ASalones.aspx">Administracion de Salones</a></li>
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
            <li><a href="inicio.aspx">Inicio</a></li>
            <li class="activo"><a href="ASalones.aspx">Administracion de Salones</a></li>
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
    <form runat="server">
        <div id="botones">
            <input type="button" value="Crear Reservacion" runat="server" id="crearReservacion" onserverclick="crearReservacion_ServerClick"/>
        </div>
        <div id="reservas completas">

        </div>
        <div id="reservas incompletas">

        </div>
    </form>
</body>
</html>
