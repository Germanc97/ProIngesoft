/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;
import java.sql.*;

public class ConexionDB {

    public static Connection getConexion(){
        Connection con=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Proyecto","proyecto");
            System.out.println("Conexion Satisfactoria");
        }catch(Exception e){System.out.println(e+"");}
        
        return con;
    }
    
    public static void main(String[] args) {
        ConexionDB.getConexion();
    }
    
}
