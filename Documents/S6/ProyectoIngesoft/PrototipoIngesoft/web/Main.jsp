
<%@page import="modelo.Login"%>
<%-- 
    Document   : Main
    Created on : 21/04/2019, 09:57:29 PM
    Author     : germancaycedo
--%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="estilos2.css">
        <link rel="stylesheet" href="fonts.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">

    </head>
    <body Style = "background-image: url(img/back.JPG)">
    <div class="contenedor2">
        <header>
            <h1 class="title">SIGERE</h1>
            <a href="cerrarSesion.jsp">Salir</a>

        </header>
            <br>
                <h4 style="font-size: 250%;" align="center">INICIO</h4><br>
                
            </a>
            <%
                HttpSession sessionStatus = request.getSession();
                Login usuario = (Login) sessionStatus.getAttribute("Usuario");
                String txtUsuario = usuario.getUsuario();

            %>
            
            <form action="usuario.jsp" method="post" align="right" style="margin-right: 50px;">
                <h1 align= right style="font-size: 150%;"  >Mi Perfil</h1>
                <input class ="imgusuario" type=image src="Iconos/user-icon.png" ><br>
                <%=txtUsuario%>
            </form>
                
           

            <div class="botonesmain">
            <table align="left">
                <button type="button" onclick="window.location.href('usuario.jsp');" style='width:150px; height:75px'>Crear Proyecto</button><br>
                <br>
                <button type="button" onclick="" style='width:150px; height:75px'>Mis Proyectos</button><br>
                <br>
                <button type="button" onclick="" style='width:150px; height:75px'>Herramientas</button><br>
                <br>
                <button type="button" onclick="" style='width:150px; height:75px'>Grupos de Trabajo</button><br>
                
            </table>
            </div> 
    </div>
    </body>
</html>
