<%-- 
    Document   : index
    Created on : 18/04/2019, 10:55:51 PM
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
        <h1 style="font-size: 350%;" align="Center">Bienvenido a su</h1>
        <h1 style="font-size: 350%;" align="Center">SIGERE</h1>
        
        <form>
            <table align="left">
                <th style="font-size: 150%;" colspan="2">Iniciar Sesion</th>
                <tr>
                    <td>Usuario: </td>
                    <td><input type="text" name="txtUsuario"></td>
                </tr>
                <tr>
                    <td>Contaseña: </td>
                    <td><input type="password" name="txtContra"></td>
                </tr>
                <tr> 
                    <th colspan="2">
                        <input type="submit" name="btnIniciar"
                               value="Iniciar Sesion"></td>
                <tr> 
                    <th colspan="2">
                        <input type="submit" name="btnOlvide"
                               value="Olvide mi contraseña"></td>
            </table>
        </form>
        
        <form>
            <table align="right">
                <th style="font-size: 150%;" colspan="2">Crear Usuario</th>
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="txtNom"></td>
                </tr>
                <tr>
                    <td>Correo Electronico: </td>
                    <td><input type=email name="txtCorreo"></td>
                </tr>
                <tr>
                    <td>Usuario: </td>
                    <td><input type="text" name="txtUsu"></td>
                </tr>
                <tr>
                    <td>Contaseña: </td>
                    <td><input type="password" name="txtCont"></td>
                </tr>
                <tr>
                    <td>Repetir Contaseña: </td>
                    <td><input type="password" name="txtRepCont"></td>
                </tr>
                <tr>
                    
                    <td><input type="radio" name="Condi"
                               value="Condi"> Acepto los Terminos y Condiciones</td>
                </tr>
                <tr> 
                    <th colspan="2">
                        <input type="submit" name="btnCrear"
                               value="Registrarse"></td>
            </table>
        </form>
        
        
        <%
            if(request.getParameter("btnCrear")!=null){
                String nom = request.getParameter("txtNom");
                String correo = request.getParameter("txtCorreo");
                String usu = request.getParameter("txtUsu");
                String contra = request.getParameter("txtCont");
                
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                
                try{
                   
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Proyecto","proyecto");
                
                    sta=cnx.createStatement();
                    rs=sta.executeQuery("insert into usuarios values('"+usu+"','"+nom+"','"+correo+"','"+contra+"')" );
                    sta.executeQuery("commit");
                    request.getRequestDispatcher("Main.jsp").forward(request, response);
                    
                }catch(Exception e){out.print(e+"");}
                
                
            }
            
            if(request.getParameter("btnIniciar")!=null){
                String usu = request.getParameter("txtUsuario");
                String contra = request.getParameter("txtContra");
                
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                
                try{
                   
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Proyecto","proyecto");
                
                    sta=cnx.createStatement();
                    rs=sta.executeQuery("select * from usuarios where Usu = '"+usu+"' and ContraUsu = '"+contra+"' " );
                    
                    String res =null;
                    
                    while(rs.next()){
                       res = rs.getString(1);
                    }
                    
                    //out.print(res);
                    //out.print(usu);
                    
                    if(res != null){
                        request.getRequestDispatcher("Main.jsp").forward(request, response);
                    }
                    
                }catch(Exception e){out.print(e+"");}
                
                
            }

            %>
    </body>
</html>
