<%-- 
    Document   : AgregarUsuProy
    Created on : 26/04/2019, 10:25:17 PM
    Author     : germancaycedo
--%>

<%@page import="modelo.Login"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Agregar Usuario al Proyecto</title>
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="estilos2.css">
        <link rel="stylesheet" href="fonts.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">

     
    </head>
    
    <%
        HttpSession sessionStatus = request.getSession();
        Login usuario = (Login) sessionStatus.getAttribute("Usuario");
        String txtUsuario = usuario.getUsuario();

    %>
    <body Style = "background-image: url(img/back.jpg)">
      

        
    <div class="contenedor">

      <header>
        <h1 class="title">SIGERE</h1>
        <a href="Main.jsp">Atrás</a>
      </header>
      <div class="login">
        <article class="fondo">
          <img src="Iconos/New.png" alt="User">
          <h3>Agregar Usuario al Proyecto</h3>
          <form class="" action="AgregarUsuProy.jsp" method="post">
            <h4>Nombre de Usuario: </h4> <br>
            <span class="icon-user"></span><input class="inp" type="text" name="txtNom" value=""><br>
            <%=txtUsuario%>
            
            <div class="box">
            <select name="Proyectos">
                <option value="">Seleccionar Proyecto </option>
                <%
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@181.234.31.151:1521:XE","Proyecto","proyecto");
                
                    sta=cnx.createStatement();
                    rs=sta.executeQuery("select * from usuxproy where usu = '"+txtUsuario+"'");

                while(rs.next()){
                    %>
                                      
                    <option value="<%=rs.getString(3)%>"><%=rs.getString(3)%> </option>  
                     
                <%
                }
                sta.close();
                rs.close();
                cnx.close();
                }catch(Exception e){out.print(e+"");}
             
                
                %>
                
            </select>
            </div>
            
            <input class="boton" type="submit" name="btnAgregar" value="Agregar">
          </form>
        </article>
      </div>

    </div>
        
        
        <%
            if(request.getParameter("btnAgregar")!=null){
                String nom = request.getParameter("txtNom");
                String nom2 = request.getParameter("Proyectos");             
                
                int id=0;
                int id2=0;
                
                try{
                   
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@192.168.250.224:1521:XE","Proyecto","proyecto");
                    sta=cnx.createStatement();
                    rs=sta.executeQuery("select * from usuxproy" );
                    //out.print("resultado "+rs);
                    while(rs.next()){
                        
                        if(rs == null){
                            id2 = 1;
                        }
                        else{
                            id2 = rs.getInt(1) + 1;
                        }
                    }
                    
                    if(nom == txtUsuario){
                        out.print("Se embobo o que");
                    }
                    else{
                        rs=sta.executeQuery("insert into usuxproy values('"+id2+"','"+nom+"','"+nom2+"')" );
                        sta.executeQuery("commit");
                        out.print("resultado "+rs);
                    }
                    
                    
                    
                    sta.close();
                    rs.close();
                    cnx.close();
                }catch(Exception e){out.print(e+"");}
                
                
            }
            

            %>
    </body>
</html>
