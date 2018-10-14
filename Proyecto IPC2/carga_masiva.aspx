<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="carga_masiva.aspx.cs" Inherits="Proyecto_IPC2.carga_masiva" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Carga Masiva</title>
    <link rel="stylesheet" type="text/css" href="css/CMasiva.css" />
</head>
<body>
    <nav runat="server" id="adminmen" visible="false">
        <ul>
            <li><a href="inicio.aspx">Inicio</a></li>
            <li><a href="ASalones.aspx">Administracion de Salones</a></li>
            <li><a href="CUsuarios.aspx">Control de usuarios</a></li>
            <li class="activo"><a href="CMasiva.aspx">Carga masiva</a></li>
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
    <div class="container" runat="server">
        <form method="post">
            Seleccione el archivo que desea cargar:
            <input type="file" name="fileToUpload" id="fileToUpload" runat="server" />
            <input type="button" value="Cargar Archivo" runat="server" onserverclick="IniciarCarga" />
        </form>
    </div>
    <div class="informacion" runat="server" id="informacion">
        <h1>this is a test</h1>
        <h2 runat="server" id="prureba"></h2>
        <asp:Label ID="test" runat="server"></asp:Label>
    </div>
</body>
</html>
