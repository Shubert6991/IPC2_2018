<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CMasiva.aspx.cs" Inherits="Proyecto_IPC2.CMasiva" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Carga Masiva</title>
    <link rel="stylesheet" type="text/css" href="css/CMasiva.css" />
</head>
<body>
    <!--inicio menu-->
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
        <form method="post" runat="server">
            <h2>Seleccione el archivo que desea cargar:</h2>
            <input type="file" name="fileToUpload" id="fileToUpload" runat="server" />
            <asp:RegularExpressionValidator 
                ID="regexValidateImageFil" runat="server" ControlToValidate="fileToUpload" 
                ErrorMessage="Elige un archivo valido." 
                ValidationExpression="^([0-9a-zA-Z_\-~ :\\])+(.xls|.xlsx|.csv)$"></asp:RegularExpressionValidator>
            <input type="button" value="Cargar Archivo" runat="server" onserverclick="IniciarCarga" />
            <asp:GridView ID="tabladatos" runat="server" CssClass="tabla">
            </asp:GridView>
            <h2 runat="server" id="prueba" class="infor"></h2>
        </form>
    </div>
</body>
</html>
