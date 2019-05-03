
<%@page import="modelo.Login"%>
<%-- 
    Document   : Main
    Created on : 21/04/2019, 09:57:29 PM
    Author     : germancaycedo
--%>
<%@page session="true"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="stylesheet" href="estilos.css">
        <link rel="stylesheet" href="estilos2.css">
        <link rel="stylesheet" href="fonts.css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">

    </head>
		<style>
    .padre {
        align-content: center;
        display: flex;
        justify-content: center;
        height: 330px;
        width: 900px;
    }

    .hijo {
        width: 120px;

    }
    </style>
    <body Style = "background-image: url(img/back.jpg)">
    <div class="contenedor2">
        <header>
            <h1 class="title">SIGERE</h1>
            <a href="cerrarSesion.jsp">Salir</a>

        </header>
            <%
                HttpSession sessionStatus = request.getSession();
                Login usuario = (Login) sessionStatus.getAttribute("Usuario");
                String txtUsuario = usuario.getUsuario();

            %>
            <br>
                <h4 style="font-size: 250%;" align="center">BIENVENIDO <%=txtUsuario%> </h4><br>
                

            
            <form action="usuario.jsp" method="post" align="right" style="margin-right: 50px;">
                <h1 align= right style="font-size: 150%;"  >Mi Perfil</h1>
                <input class ="imgusuario" type=image src="Iconos/user-icon.png" ><br>
                <%=txtUsuario%>
            </form>
            
			<div class="padre" >
            <div class="hijo">
			
			<table cellspacing="5">
			
			<tbody id="table-body">


            <%
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    cnx=DriverManager.getConnection("jdbc:oracle:thin:@181.234.31.151:1521:XE","Proyecto","proyecto");
                
                    sta=cnx.createStatement();
                    rs=sta.executeQuery("select * from usuxproy where usu = '"+txtUsuario+"'");
				int n=-1;
                while(rs.next()){
					if( n==-1) n=0;
					if(n==0)
					{
					%><tr><%	
					}
                    %>
                    <td>
                <div action="usuario.jsp" class="contproy">
                    
                    <%=rs.getString(3)%><br>
                    <br>
                    <a href="Main.jsp"> <input class ="imgusuario2" type=image src="Iconos/Edit-docu.png" ></a>
                    <a href="AgregarUsuProy.jsp"> <input class ="imgusuario2" type=image src="Iconos/New.png" ></a><br><br>
                    
                        
                </div>   
				     </td>
                     
                <%
				n++;
				if( n==3){
					%></tr><%
					n=0;
				}
                }
				if(n!=0 && n!=-1){
					%></tr><%
				}
					
                sta.close();
                rs.close();
                cnx.close();
                }catch(Exception e){out.print(e+"");}
             
                
                %>
		    </tbody>
            </table>
            </div>
			</div>

            <div class="botonesmain">
            <table align="left">
                <button type="button" onclick="location.href='crearProyecto.jsp'" style='width:150px; height:75px'>Crear Proyecto</button><br>
                <br>
                <!--<button type="button" onclick="" style='width:150px; height:75px'>Mis Proyectos</button><br>-->
                <button type="button" onclick="" style='width:150px; height:75px'>Herramientas</button><br>
                <br>
                <!--<button type="button" onclick="" style='width:150px; height:75px'>Grupos de Trabajo</button><br>-->
                
            </table>
            </div> 
    </div>
    </body>
</html>
