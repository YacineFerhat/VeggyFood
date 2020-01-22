<%-- 
    Document   : HomePageJSP
    Created on : 9 janv. 2020, 07:28:58
    Author     : Ferhat Yacine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/gestventes" user="root" password="" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css?family=Gelasio&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap" rel="stylesheet">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Shoplify</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
        <script src="https://kit.fontawesome.com/773695578b.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <style>
            body {
                font-family: 'Gelasio', serif;
            }
            nav {
                margin : 0px 60px;
            }
            .carousel-hider{
                
                height: 100vh;
                width: 100%;
            }
            .hero1-text{
                font-family: 'Indie Flower', cursive;
                text-align: center;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                color: white;
            }
            .columns {
                padding : 80px 150px;
            }
            .card:hover{
                transform: scale(1.10);
                transition: 1s;
            }
            .etiquette{
                background-color: red;
                color:white;
                width: 40%;
                position: relative;
                z-index :2;
            }
           
            .Cart{
                position: fixed;
                top: 30%;
                right: 2%;
                width:50px;
                height: 50px;
                border-radius: 100%;
                background-color: white;
            }
            .img-container{
                position: relative;
                top : 20%;
                left: 15%;
                width:30px;
                height: 30px;
            }
            .qte{
                position: absolute;
                top: -20px;
                background-color: red;
                border-radius: 100%;
                color: white;
                width: 20px;
                text-align: center;
                left:20px;
            }
        </style>
    </head>
    <body>
        
        <sql:query var="carts" dataSource="${dataSource}">
            select sum(qte) from Cart;
        </sql:query>
        <div class="Cart">
             <a href='cart.jsp'>
            <div class='img-container'>
                <span class='qte'>
                   
                        15
                </span>
                <img src='images/cart.png'>
            </div>
                                     </a>

        </div>
        <section class="hero  is-fullwidth">
            <div class="hero-head">
                <nav class="navbar " role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
                <a href="" class="navbar-item"><h1 class="title is-5 has-text-success has-text-weight-bold">Veggy Food</h1></a>
                <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                </a>
            </div>

           

                <div class="navbar-end">
                <div class="navbar-item">
                    <div class="buttons">
                    <a class="button is-primary" id='OpenModal'>
                        <strong>Login</strong>
                    </a>

                    </div>
                </div>
                </div>
            </div>
            </nav>
            </div>
            <div class="hero1 carousel" >
                <div class='carousel-hider'>
                     <div class='hero1-text'>
                     <h1  style="font-size:70px;  font-weight: bold;">              
                        Change What You Eat  Change The World!
                    </h1>
                    <button class="button is-rounded is-success" style='margin-top : 2%;'> Buy me!</button>
                    
                </div>
                </div>
            </div>
        </section>
        <section class="hero display-on-scroll scroll-n-1">
            <div class='content'>
                 <div class='columns  is-centered' style='padding-top: 50px; margin:0px 100px'>
                    <div class='column has-text-centered is-3'>
                        <span class="icon has-text-warning is-large">
                            <i style="color: yellow;">
                                <img src='images/svg1.png'/>
                            </i>
                        </span>
                        <h1 class="title is-6">
                            Fast delivery
                        </h1>
                        <h1 class='subtitle is-6'>
                            No delivery over 48h
                        </h1>
                    </div>
                    <div class='column has-text-centered is-3'>
                        <span class="icon is-large">
                            <i>
                                <img src='images/svg2.png'/>
                            </i>
                        </span>
                        <h1 class="title is-6">
                            Always Fresh
                        </h1>
                        <h1 class='subtitle is-6'>
                             Fresh and packaged for u!
                        </h1>
                    </div>
                    <div class='column has-text-centered is-3'>
                        <span class="icon is-large">
                            <i>
                                <img src='images/svg3.png'/>
                            </i>
                        </span>
                        <h1 class="title is-6">
                            Superior quality
                        </h1>
                        <h1 class='subtitle is-6'>
                            best Vegan product of 2019
                        </h1>
                    </div>
                    
                    <div class='column has-text-centered is-3'>
                        <span class="icon is-large">
                            <i>
                                <img src='images/svg4.png'/>
                            </i>
                        </span>
                        <h1 class="title is-6">
                            Custommer service
                        </h1>
                        <h1 class='subtitle is-6'>
                            We are here for you ! 
                        </h1>
                    </div>
                    
                </div>      
            </div>
        </section>
         <sql:query var="products" dataSource="${dataSource}">
            select* from produit;
        </sql:query>
        <section  class="hero is-fullwidth display-on-scroll scroll-n-2" style='padding-top : 50px; background-color:   #d9f2d9'>
            <div class='content'>
                 <div class=' has-text-centered'>
                    <h1 class='title is-2'>Our Products</h1>
                    <h1 class='subtitle is-6'> Don't panic, it's organic !</h1>
                <div class="columns is-multiline">
                    <c:forEach var = "row" items = "${products.rows}">
                        <div class="column is-3"  style='padding : 10px 20px ; '>
                            <div class="card" style='height:100%'>
                                <c:if test="${row.qts==0}">  
                                    <p class="etiquette">Sold out <p>  
                                </c:if>  
                                <div class="card-image">
                                    <figure class="image ">
                                        <img src="<c:out value="${row.photo}" />">
                                    </figure>
                                </div>
                                <div class="card-content"> 
                                    <div class="content">
                                        <h1 class="title is-5">
                                            <c:out value="${row.libelle}" />
                                        </h1>
                                        <h1 class='subtitle is-6'>
                                            <c:out value="${row.prix}" />
                                        </h1>
                                        <c:choose>
                                            <c:when test="${row.qts!=0}">
                                                    <button class="button"   style="color:white; background-color:#ff7733;"  >
                                                        <a href='AjouterPanier?id=<c:out value="${row.id}"/>'>
                                                            Buy
                                                        </a>
                                                    </button> 
                                            </c:when>
                                            <c:otherwise>
                                                <button class="button"  disabled style="color:white; background-color:#ff7733;"  >
                                                    Buy 
                                                </button> 
                                            </c:otherwise>
                                        </c:choose>
                                        <c:if test="${row.qts!=0}">  
                                        </c:if>
                                    </div>
                              </div>
                          </div>
                      </div>
                    </c:forEach>  
                </div>
                <div style="padding-top: 10%;" class="modal" id='ModalToOpen' >
                    <div class="modal-background"></div>
                    <div class="modal-card">
                      <header class="modal-card-head">
                        <p class="modal-card-title">Authentification</p>
                        <button class="delete" id='CloseModal' aria-label="close"></button>
                      </header>
                      <section class="modal-card-body">
                           <form method="Post" action="Authentification" >
                                <div class="control">
                                    <label for="UserLogin" class="label">User name</label>
                                    <input type="text" class="input" name='userName'>
                                </div>
                                <div class="control">
                                    <label for="UserPass" class="label">Password</label>
                                    <input type="password" class="input" name='userPassword'>
                                </div>
                                <div style='margin-top:5%;' class="buttons is-centered">
                                    <button type="submit" class="button is-danger">
                                        Submit
                                    </button>
                                </div>
                            </form>
                      </section>
                      
                    </div>
                        
                    </div>  
                    
                

                </div>

            </div>
        </section>
        <script src="js/main.js"></script>
        <script src='js/animation.js'></script>
        <script src="js/carousel.js"></script>

    </body>
</html>
