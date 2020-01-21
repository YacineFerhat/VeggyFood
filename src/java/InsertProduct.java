/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
*/


import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Ferhat Yacine
 */

@MultipartConfig(maxFileSize = 161000000)

//@MultiPartConfig(FileSiezThreshold=1024*1024*2,maxFileSize=1024*1024*10,maxRequestSize=1024*1024*50)

@WebServlet(urlPatterns = {"/InsertProduct"})

public class InsertProduct extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        
        String libelle = request.getParameter("libelle");
        float prix = Float.parseFloat(request.getParameter("prix"));
        float qts = Float.parseFloat(request.getParameter("qts"));
        PrintWriter p = response.getWriter();
       
       
        
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection c= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/gestventes","root","");
           Statement st = c.createStatement();
            PreparedStatement pst1 = c.prepareStatement("select max(id)+1 from produit");
            ResultSet rs = pst1.executeQuery();
            String prod_id ="" ;
            while(rs.next())
            {
                prod_id = rs.getString(1);
            }
           st.executeUpdate("insert into produit values('"+prod_id+"','"+libelle+"','./images/"+ libelle+".jpg','"+prix+"','"+qts+"');");
           
           RequestDispatcher rd= request.getRequestDispatcher("AdminPage.jsp");
           rd.forward(request, response);
        }catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(InsertProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
     
    }


 /*
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class InsertProduct extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/gestventes";//MYSQL Path With DB Name
    private String dbUser = "root";//DB USerName
    private String dbPass = "";//DB Password
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
       
         
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
 
            inputStream = filePart.getInputStream();
 
	    InputStream fileName = new FileInputStream(filePart);
	    File file =fileName.getPath()
 
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "INSERT INTO contacts (photo) values (?)";
            PreparedStatement statement = conn.prepareStatement(sql);
           
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(1, file);//Store File URL into DB
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File URL  saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            
        }
    }
}

*/