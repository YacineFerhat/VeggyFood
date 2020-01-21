<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/gestventes" user="root" password="" />
<html>
<head>
    <title>Product Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">
    <style>
        a{
            text-decoration: none;
        }
        .link{
            color : white;
        }
        .link:hover{
            color:white;
        }
        .image:hover{
            transform: scale(1.25);
            transition: ease-in-out 1s;
            
        }
        .box:hover{
            transform: scale(1.05);
            transition : ease-in-out 2s;
            
        }
    </style>
</head>
<body>
    <section class='hero is-fullwidth'>
        <div class='columns'>
            <div  class=" column is-2">
                <%@ include file="/menu.jsp" %>
            </div>
            <div class='column'>
                <%@ include file="/heroHeadAdmin.jsp" %>
                <div style='padding:20px 40px;'>
                    <h1 class='title is-4'>
                        Manage your products ! 
                    </h1>
                    
                    <sql:query var="products" dataSource="${dataSource}">
                        select* from produit;
                    </sql:query>
                      
                    <c:forEach var = "row" items = "${products.rows}">
                         <div class="box" id="box">
                            <article class="media" id="MediaToClose">
                           <figure class="media-left">
                             <p class="image is-128x128">
                               <img src="<c:out value="${row.photo}" />">
                             </p>
                           </figure>
                           <div class="media-content">
                             <div class="content">                                          
                                 <div class='columns'>
                                     <div class='column is-4'>
                                         <ul>
                                            <li><strong>Name :   <c:out value="${row.libelle}" /></strong></li>
                                            <li><strong>Quantity : <c:out value="${row.qts}" /> </strong></li>
                                            <li><strong>Price :  <c:out value="${row.prix}" /></strong></li>
                                        </ul>
                                     </div>
                                     <div class='column is-4'>
                                       
                                     </div>
                                     <div class='column' style="display: flex; justify-content: center; align-items: center;">
                                         <div class='buttons'>                                             
                                             <button class='button is-danger'>
                                                 <a class="link" href="/delete?id=<c:out value='${row.id}' />">Delete</a>  
                                             </button>
                                            <button class='button is-link'>
                                                <a  class='link' href="/edit?id=<c:out value='${row.id}' />">Update</a> 
                                            </button>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                           </div>
                         </article>
                       </div>
                    </c:forEach>
                </div>
            </div>
        </div>      
    </section>
</body>
</html>