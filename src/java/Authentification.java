/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ferhat Yacine
 */

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ferhat Yacine
 */
@WebServlet(urlPatterns = {"/Authentification"})

public class Authentification extends HttpServlet {
      protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter print = response.getWriter();

        RequestDispatcher RequestDispatcherIndex = request.getRequestDispatcher("/HomePage.jsp");

        
        String user = request.getParameter("userName");
        String pass = request.getParameter("userPassword");
        
        if(!pass.isEmpty() && !user.isEmpty()){
           if(Validate.checkUser(user, pass))
        {   
            HttpSession ss = request.getSession();
            ss.setAttribute("user",user);
            this.getServletContext().getRequestDispatcher("/AdminPage.jsp").forward(request,response);
            
        }      
        else{
            RequestDispatcherIndex.include(request,response);
            print.print("<script>alert('The Id and pass don't match!')</script>");

        } 
        }
        else if(pass.isEmpty() && user.isEmpty()) {
            
            RequestDispatcherIndex.include(request,response);
            print.print("<script>alert('You have to insert data in order to Login!')</script>s");

        }
        else if(user.isEmpty()) {
            RequestDispatcherIndex.include(request,response);
            print.print("<script>alert('YOu have to insert a user name!')</script>");
 
        }
        else {
            RequestDispatcherIndex.include(request,response);
            print.print("<script>alert('You have to insert a password ! !')</script>");
 
        }
        
        
    }  
  
}