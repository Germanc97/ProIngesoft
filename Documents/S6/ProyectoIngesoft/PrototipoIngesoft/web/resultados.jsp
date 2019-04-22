<%-- 
    Document   : resultados
    Created on : 18/04/2019, 11:11:30 PM
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
        <h1>Resultados de Venta</h1>
        <%
            String pro = request.getParameter("SelectPro");
            double pre= Double.parseDouble(request.getParameter("txtPre"));
            double can= Integer.parseInt(request.getParameter("txtCan"));
            
            double subtotal = can*pre;
            double igv = subtotal*0.18;
            double total = subtotal+igv;

            %>
            
            Producto: <%=pro%><br>
            Precio: <%=pre%><br>
            Cantidad: <%=can%><br>
            Subtotal: <%=subtotal%><br>
            Igv 18%: <%=igv%><br>
            Total: <%=total%><br>
            
            
            <a href ="datos.jsp">
                Volver a Principal
            </a>
    </body>
</html>
