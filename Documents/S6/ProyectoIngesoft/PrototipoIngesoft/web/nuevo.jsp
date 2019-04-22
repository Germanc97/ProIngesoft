<%-- 
    Document   : nuevo
    Created on : 20/04/2019, 09:50:46 AM
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
        <h2 align="center">Registro de Usuarios</h2>
        <form action="">
            <table border="1" width="250" align="center">
                <tr>
                    <td>Codigo: </td>
                    <td><input type="text" name="txtCod"></td>
                </tr>
                <tr>
                    <td>Nombre </td>
                    <td><input type="text" name="txtNom"></td>
                </tr>
                <tr>
                    <td>Edad </td>
                    <td><input type="text" name="txtEdad"></td>
                </tr>
                <tr>
                    <td>Sexo: </td>
                    <td><input type="text" name="txtSexo"></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="text" name="txtPas"></td>
                </tr>
                <tr> 
                    <th colspan="2">
                        <input type="submit" name="btnGrabat"
                               value="Grabar Usuario"></td>
                </tr>
            </table>
        </form>
        
        <%
            if(request.getParameter("btnGrabar")!=null){
            String cod=request.getParameter("txtCod");
            String nom=request.getParameter("txtNom");
            int edad=Integer.parseInt(request.getParameter("txtEdad"));
            String sexo=request.getParameter("txtSex");
            String pas=request.getParameter("txtPas");
            
            Connection cnx = null;
            Statement sta=null;
            
            try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            cnx=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Proyecto","proyecto");
            
            
            PreparedStatement ps = cnx.prepareStatement("insert into usuarios values('"+cod+"','"+nom+"',"+edad+",'"+sexo+"','"+pas+"')");
            request.getRequestDispatcher("Listado.jsp").forward(request, response);
            }catch(Exception e){out.print(e+"");}
            
            }
            %>

    </body>
</html>
