<%-- 
    Document   : datos
    Created on : 18/04/2019, 11:11:10 PM
    Author     : germancaycedo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Formulario de Datos</h1>
        <form action="resultados.jsp" method="pos">
            Producto: <select name="SelectPro">
                <option value ="Televisor">Televisor</option>
                <option value ="Radio">Radio</option>
                <option value ="Cocina">Cocina</option>
            </select><br>
            Precio: <input type="text" name ="txtPre"><br>
            Cantidad <input type="text" name ="txtCan"><br>
            <input type ="submit" name="btn1" value="Enviar Datos">
        </form>
    </body>
</html>
