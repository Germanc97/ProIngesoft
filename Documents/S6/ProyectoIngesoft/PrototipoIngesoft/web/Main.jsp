
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
        <link rel="stylesheet" href="fonts.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">

    </head>
    <body style='background-color: #1ABC9C;'>
    <header>
        <h1 class="title">SIGERE</h1>
        <a href="cerrarSesion.jsp">Salir</a>
        
    </header>
        <br>
            <h4 style="font-size: 150%;" align="center">INICIO</h4>
            <h1 align= right style="font-size: 150%;" >Mi Perfil</h1>
        </a>
        <%
            HttpSession sessionStatus = request.getSession();
            Login usuario = (Login) sessionStatus.getAttribute("Usuario");
            String txtUsuario = usuario.getUsuario();
        
        %>
        
        <table align ="right">
        
            <th><a href="usuario.jsp"><img src="Iconos/user-icon.png"  width="80" height="80"><%=txtUsuario%><br>

            </th>
           
        </table>
        <div class="content-box-blue" width="10px" height="10px">
        <table align="left">
            <button type="button" onclick="" style='width:150px; height:75px'>Crear Proyecto</button><br>
            <br>
            <button type="button" onclick="" style='width:150px; height:75px'>Mis Proyectos</button><br>
            <br>
            <button type="button" onclick="" style='width:150px; height:75px'>Herramientas</button><br>
            <br>
            <button type="button" onclick="" style='width:150px; height:75px'>Grupos de Trabajo</button><br>
        </div>     
        </table>
    </body>
</html>
