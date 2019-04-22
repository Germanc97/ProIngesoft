<%-- 
    Document   : Listado
    Created on : 19/04/2019, 12:49:34 AM
    Author     : germancaycedo
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center"> Listado de Usuarios</h1>
        
        <table border="1" width="600" align="center">
            <tr bgcolor-="skyblue">
                <th colspan="5">Mantenimiento de Usuarios</th>
                <th><a href="nuevo.jsp">
                        <img src="Iconos/New.png" width="30" height="30"></a></th>
            </tr>
            <tr bgcolor-="skyblue">
                <th>Codigo</th><th>Nombre</th>
                <th>Edad</th><th>Sexo</th>
                <th>Password</th><th>Accion</th>
                
            </tr>
            <%
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Proyecto","proyecto");
                
                    sta=cnx.createStatement();
                    rs=sta.executeQuery("select * from usuarios");
                    System.out.println("Conexion Exitosa");
  
                
                while(rs.next()){
                    %>
                <tr>
                        <th><%=rs.getString(1)%></th>
                        <th><%=rs.getString(2)%></th>
                        <th><%=rs.getString(3)%></th>
                        <th><%=rs.getString(4)%></th>
                        <th><%=rs.getString(5)%></th>
               </tr>    <th>
                            <img src="Iconos/Edit.png" width="30" height="30"> ||
                            <img src="Iconos/Delete.png" width="30" height="30">
                        </th>
                     
                    <%
                }
                sta.close();
                rs.close();
                cnx.close();
                }catch(Exception e){out.print(e+"");}
             
                
                %>
        </table>
    </body>
</html>
