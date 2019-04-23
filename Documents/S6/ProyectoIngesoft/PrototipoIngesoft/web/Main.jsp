
<%-- 
    Document   : Main
    Created on : 21/04/2019, 09:57:29 PM
    Author     : germancaycedo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="fonts.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">

    </head>
    <body>
        
    <header>
        <h1 class="title">SIGERE</h1>
        <a href="index.jsp">Salir</a>
    </header>
        
            <h4 style="font-size: 250%;" align="center">INICIO</h4>
        </a>
        <%!
            String txtUsuario;
        %>
        
        <%
            txtUsuario=request.getParameter("txtUsuario");
        %>
        
        <table align ="right">
        
            <th><a href="usuario.jsp"><img src="Iconos/user-icon.png"  width="80" height="80"><%=txtUsuario%><br>

            </th>
             
        </table>
        
        <table align="left">
            <button type="button" onclick="" style='width:150px; height:75px'>Crear Proyecto</button><br>
            <br>
            <button type="button" onclick="" style='width:150px; height:75px'>Mis Proyectos</button><br>
            <br>
            <button type="button" onclick="" style='width:150px; height:75px'>Herramientas</button><br>
            <br>
            <button type="button" onclick="" style='width:150px; height:75px'>Grupos de Trabajo</button><br>
            
        </table>
        
        <h1 style="font-size: 250%;" align="center">MY SIGERE</h1>
    </body>
</html>
