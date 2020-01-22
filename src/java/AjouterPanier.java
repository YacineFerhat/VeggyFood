/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ferhat Yacine
 */

@WebServlet(urlPatterns = {"/AjouterPanier"})

public class AjouterPanier extends HttpServlet {
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String id=request.getParameter("id");
            boolean st =false;
            boolean st2 =false;
            RequestDispatcher rd= request.getRequestDispatcher("HomePage.jsp");

            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/gestventes","root","");
                PreparedStatement ps =conn.prepareStatement("select * from produit where id=? ");
                ps.setString(1, id);
                ResultSet rs =ps.executeQuery();
                st = rs.next();
                
                PreparedStatement ps2 =conn.prepareStatement("select * from panier where id_produit=? ");
                ps2.setString(1, id);
                ResultSet rs2 =ps2.executeQuery();
                st2 = rs2.next();
                if(st2){
                    PreparedStatement preparedQte =conn.prepareStatement("select qte from produit where id_produit=? ");
                    preparedQte.setString(1, id);
                    ResultSet QteRes =preparedQte.executeQuery();
                    String sql="Update panier set qte=? where id_produit="+id;
                    PreparedStatement ps3 = conn.prepareStatement(sql);
                    ps3.setInt(1,Integer.parseInt(QteRes.getString("qte"))+1);
                    ps3.executeUpdate();
                     rd= request.getRequestDispatcher("HomePage.jsp");
                }
                else {
                    Statement stInsertCart = conn.createStatement();
                    PreparedStatement pst1 = conn.prepareStatement("select max(id)+1 from panier");
                    ResultSet rsCart = pst1.executeQuery();
                    String cart_id ="" ;
                    while(rs.next())
                    {
                        cart_id = rs.getString(1);
                    }
                    stInsertCart.executeUpdate("insert into panier values('"+cart_id+"','"+id+"','"+1+"');");
                     rd= request.getRequestDispatcher("HomePage.jsp");
                }
            }
            catch(Exception ex){
                out.println("erreur");
            }


    }

   
  
}


