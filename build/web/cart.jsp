<%-- 
    Document   : cart
    Created on : 22 janv. 2020, 23:51:11
    Author     : Ferhat Yacine
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/gestventes" user="root" password="" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <link href="https://fonts.googleapis.com/css?family=Gelasio&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap" rel="stylesheet">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
        <script src="https://kit.fontawesome.com/773695578b.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <style>
         nav {
                margin : 0px 60px;
            }
    </style>
    </head>
    <body>
        <section>
            <div class="hero-head">
                <nav class="navbar " role="navigation" aria-label="main navigation">
                    <div class="navbar-brand">
                        <a href="HomePage.jsp"  class="navbar-item"><h1 class="title is-5 has-text-success has-text-weight-bold">Veggy Food</h1></a>
                        <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                        <span aria-hidden="true"></span>
                        <span aria-hidden="true"></span>
                        <span aria-hidden="true"></span>
                        </a>
                    </div>
                <div class="navbar-end">
                    <div class="navbar-item">
                        <div class="buttons">
                            <a href="HomePage.jsp" class="button is-primary" >
                            <strong>Go Back!</strong>
                        </a>
                        </div>
                    </div>
                </div>
            </nav>
            </div>
            <sql:query var="carts" dataSource="${dataSource}">
                select * from cart, produit where cart.id_produit = produit.id;  ;
            </sql:query>
            <div class='hero-body'>
                <div class='container'>
                    <div class="columns">
                        <div class='column is-6'>
                            <div class='box'>
                                <h1 class='title has-text-centered is-4'>
                                    Your Cart!
                                </h1>
                                <c:forEach var = 'row' items = '${carts.rows}'>
                                    <article class="media" id="MediaToClose">
                                        <figure class="media-left">
                                          <p class="image is-128x128">
                                            <img src="<c:out value="${row.photo}" />">
                                          </p>
                                        </figure>
                                        <div class="media-content">
                                          <div class="content">                                          
                                              <div class='columns'>
                                                  <div class='column '>
                                                      <ul>
                                                         <li><strong>Name :   <c:out value="${row.libelle}" /></strong></li>
                                                         <li><strong>Quantity : <c:out value="${row.qte}" /> </strong></li>
                                                         <li><strong>Price U :  <c:out value="${row.prix}" /></strong></li>
                                                            <c:set var="result" value="${row.prix * row.qte}"/>
                                                         <li><strong>Price T :  <c:out value="${result}" /></strong></li>
                                                     </ul>
                                                  </div>
                                                
                                                 
                                              </div>
                                          </div>
                                        </div>
                                      </article>
                                </c:forEach>
                                 <sql:query var="carts" dataSource="${dataSource}">
                                    select * from cart, produit where cart.id_produit = produit.id;  ;
                                </sql:query>
                                <h1 class="title has-text-right is-6">
                                    Total : 4080
                                    
                                </h1>
                                
                            </div>
                                
                        </div>
                        <div class='column'>
                            <div class='box'>
                                <h1 class="title is-4 has-text-centered">
                                    Your data!
                                </h1>
                                <label class='label'>
                                    Name* : 
                                </label>
                                <input type='text' class='input'/>

                                <label class='label'>
                                    Phone Number* : 
                                </label>
                                <input class='input' type='text'/>

                                <label class='label'>
                                    Adresse *:
                                </label>
                                <input class='input' type='text'/>

                                <div class='buttons is-right' style='margin-top: 2%;'>
                                    <button class="button" style="color:white; background-color:#ff7733;">
                                        Order!
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
