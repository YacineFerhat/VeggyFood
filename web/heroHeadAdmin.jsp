<%-- 
    Document   : heroHeadAdmin
    Created on : 15 janv. 2020, 22:43:18
    Author     : Ferhat Yacine
--%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hero head</title>
    </head>
    <body>
     
        <div class="hero-head" style='padding:20px 40px; display:flex; justify-content:space-between; align-items: center;'>
            <h1 class='title is-4'>
                hello
                 <%    
                    if(session.getAttribute("user") == null || session.getAttribute("user") == "_INVALID_")
                    {
                        response.sendRedirect("HomePageJSP.jsp");
                    }else {
                        String user =session.getAttribute("user").toString();
                        out.print(" "+user);   
                    } 
                   %>
            </h1>
            <form action="${pageContext.request.contextPath}/Logout" method="post">
                 <button  type="submit" class='button is-danger'>
                    Disconnect
                </button>
            </form>
           
        </div>
    </body>
</html>
