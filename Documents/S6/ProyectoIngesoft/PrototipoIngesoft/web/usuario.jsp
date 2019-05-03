<%-- 
    Document   : usuario
    Created on : 22/04/2019, 08:20:42 PM
    Author     : germancaycedo
--%>
<%@page import="modelo.Login"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>Datos Usuario</title>
        
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="fonts.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">

     
    </head>
    <body>
           <div class="contenedor">
        <header>
            <h1 class="title">SIGERE</h1>
            <a href="Main.jsp">Atrás</a>
        </header>
        <div class="login">

           
            <%
                HttpSession sessionStatus = request.getSession();
                Login usuario = (Login) sessionStatus.getAttribute("Usuario");
                String txtUsuario = usuario.getUsuario();
                
                
                
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                
                try{
                   
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@192.168.250.224:1521:XE","Proyecto","proyecto");
                
                    sta=cnx.createStatement();
                    rs=sta.executeQuery("select * from usuarios where usu = '"+txtUsuario+"' " );
                    // request.getRequestDispatcher("Main.jsp").forward(request, response); 
                 while(rs.next()){
                 %>
                 


      
        <article class="fondo">
          <img src="Iconos/Edit.png" alt="User">
          <h3>Editar Datos</h3>
          <form class="" action="usuario.jsp" method="post">
            <h4>Nombre: </h4> <br>
            <span class="icon-user"></span><input class="inp" type="text" name="txtNom" value=<%=rs.getString(2)%>><br>
            <h4>Correo Electronico: </h4> <br>
            <span class="icon-envelop"></span><input class="inp" type="email" name="txtCorreo" value=<%=rs.getString(3)%>><br>
            <h4>Usuario: </h4> <br>
            <span class="icon-user"></span><input class="inp" type="text" name="txtUsu" value=<%=rs.getString(1)%>><br>
            <h4>Contraseña: </h4> <br>
            <span class="icon-key"></span><input class="inp" type="text" name="txtCont" value=<%=rs.getString(4)%>><br>
            <!--<a href="" class="he">He olvidado mi contraseña</a>-->
            <input class="boton" type="submit" name="btnGuardar" value="Guardar">
          </form>
        </article>
      </div>

    </div>
            
            <%
                     }

            if(request.getParameter("btnGuardar")!=null){
                String nom = request.getParameter("txtNom");
                String correo = request.getParameter("txtCorreo");
                String usu = request.getParameter("txtUsu");
                String contra = request.getParameter("txtCont");
                
                
                sta=cnx.createStatement();
                rs=sta.executeQuery("update usuarios set usu='"+usu+"', nomusu='"+nom+"', corrousu='"+correo+"', contrausu='"+contra+"' where usu = '"+txtUsuario+"' ");
                sta.executeQuery("commit");
                response.sendRedirect("usuario.jsp");

}              
        }catch(Exception e){out.print(e+"");}

                 %>

    </body>
</html>
