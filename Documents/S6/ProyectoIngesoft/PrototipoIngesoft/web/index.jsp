<%-- 
    Document   : index
    Created on : 18/04/2019, 10:55:51 PM
    Author     : germancaycedo
--%>
<%@page session="true"%>
<%@page import="java.sql.*" %>
<%@page import="modelo.Login" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>SIGERE</title>
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="fonts.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">

     
    </head>
    <body>
           <div class="contenedor">

      <header>
        <h1 class="title">SIGERE</h1>
        <a href="nuevo.jsp">Registrate</a>
      </header>
      <div class="login">
        <article class="fondo">
          <img src="Iconos/user-icon.png" alt="User">
          <h3>Inicio de Sesión</h3>
          <form class="" action="index.jsp" method="post">
            <h4>Usuario: </h4> <br>
            <span class="icon-user"></span><input class="inp" type="text" name="txtUsuario" value=""><br>
            <h4>Contraseña: </h4> <br>
            <span class="icon-key"></span><input class="inp" type="password" name="txtContra" value=""><br>
            <a href="" class="he">He olvidado mi contraseña</a>
            <input class="boton" type="submit" name="btnIniciar" value="Iniciar Sesión">
          </form>
        </article>
      </div>

    </div>
        
        
        <%
            
            if(request.getParameter("btnIniciar")!=null){
                String txtUsuario = request.getParameter("txtUsuario");
                String contra = request.getParameter("txtContra");
                
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                
                try{
                   
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Proyecto","proyecto");
                
                    sta=cnx.createStatement();
                    rs=sta.executeQuery("select * from usuarios where Usu = '"+txtUsuario+"' and ContraUsu = '"+contra+"' " );
                    
                    String res =null;
                    
                    while(rs.next()){
                       res = rs.getString(1);
                    }
                    
                    //out.print(res);
                    //out.print(usu);
                    
                    if(res != null){
                        
                        Login login = new Login(); 
                        login.setUsuario(txtUsuario);
                        
                        HttpSession sessionok = request.getSession();
                        sessionok.setAttribute("Usuario",login);
                        response.sendRedirect("Main.jsp");
                        
                                
                       // request.getRequestDispatcher("Main.jsp").forward(request, response);
                    }
                    
                }catch(Exception e){out.print(e+"");}
                
                
            }

            %>
    </body>
</html>
