/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ferhat Yacine
 */
import java.sql.*;

public class Validate
 {
    
     public static boolean checkUser(String pseudo,String pass) 
     {
         
      boolean st =false;
      try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gestventes","root","");
         PreparedStatement ps =con.prepareStatement("select * from user where pseudo=? and password=?");
         ps.setString(1, pseudo);
         ps.setString(2, pass);
         ResultSet rs =ps.executeQuery();
         st = rs.next();
        
      }catch(Exception e)
      {
          e.printStackTrace();
      }
         return st;                 
  }   
}