<%-- 
    Document   : nuevo
    Created on : 20/04/2019, 09:50:46 AM
    Author     : germancaycedo
--%>
<%@page import="modelo.Login"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>REGISTRARSE</title>
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="fonts.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">

     
    </head>
    <body>
           <div class="contenedor">

      <header>
        <h1 class="title">SIGERE</h1>
        <a href="index.jsp">Atrás</a>
      </header>
      <div class="login">
        <article class="fondo">
          <img src="Iconos/New.png" alt="User">
          <h3>REGISTRARSE</h3>
          <form class="" action="nuevo.jsp" method="post">
            <h4>Nombre: </h4> <br>
            <span class="icon-user"></span><input class="inp" type="text" name="txtNom" value=""><br>
            <h4>Correo Electronico: </h4> <br>
            <span class="icon-envelop"></span><input class="inp" type="email" name="txtCorreo" value=""><br>
            <h4>Usuario: </h4> <br>
            <span class="icon-user"></span><input class="inp" type="text" name="txtUsu" value=""><br>
            <h4>Contraseña: </h4> <br>
            <span class="icon-key"></span><input class="inp" type="password" name="txtCont" value=""><br>
            <!--<a href="" class="he">He olvidado mi contraseña</a>-->
            <input class="boton" type="submit" name="btnCrear" value="Registrarse">
          </form>
        </article>
      </div>

    </div>
        
        
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
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@181.234.31.151:1521:XE","Proyecto","proyecto");
                
                    sta=cnx.createStatement();
                    rs=sta.executeQuery("insert into usuarios values('"+usu+"','"+nom+"','"+correo+"','"+contra+"')" );
                    sta.executeQuery("commit");
                    
                    Login login = new Login(); 
                    login.setUsuario(usu);
                        
                    HttpSession sessionok = request.getSession();
                    sessionok.setAttribute("Usuario",login);
                    response.sendRedirect("Main.jsp");
                    
                    
                }catch(Exception e){out.print(e+"");}
                
                
            }
            

            %>
    </body>
</html>
