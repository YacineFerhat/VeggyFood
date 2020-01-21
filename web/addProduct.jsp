<%-- 
    Document   : AdminPage.jsp
    Created on : 9 janv. 2020, 08:16:36
    Author     : Ferhat Yacine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administration</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    <body>
        
    <section class="hero is-fullwidth">
        
        <div class="columns">
            <div style="height:110vh;    background-color:  #00001a;color:white; height: 100vh; " class=" column is-2">
                <%@ include file="/menu.jsp" %>
            </div>
            <div class="column">
                <%@ include file="/heroHeadAdmin.jsp" %>
                <div class="container" style='padding: 5% 10%;'>
                    <h1 class="title is-4">
                        Add a product 
                    </h1>
                    <form action="InsertProduct" method="get"  enctype="multipart/form-data" >
                        <div class="box">
                            <div style='margin-top:2%;' class="control">
                                <label  for="ProductName" class="label">
                                    Product name :
                                </label>
                                 <input class="input" type="text" name="libelle" size="45"/>
                            </div>
                            <div style='margin-top:2%;' class="control">
                                <label for="ProductPrice" class="label">
                                    Product price : 
                                </label>
                                
                                <input name='prix' class="input" type="Number">
                            </div>
                            <div style='margin-top:2%;' class="control">
                                <label for="ProductQte" class="label">
                                    Product quantity :
                                </label>
                                <input type="Number" name='qts' class="input">
                            </div>
                                              
                            <div style='margin-top:3%' class='buttons is-centered'>
                                <button type="submit" class="button is-link">
                                    Validate
                                </button>
                            </div>
                           
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    </body>
</html>
