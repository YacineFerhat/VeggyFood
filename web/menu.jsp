<%-- 
    Document   : menu
    Created on : 15 janv. 2020, 22:33:05
    Author     : Ferhat Yacine
--%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <style>
            .menu-list{
                color:white;
            }
            .text-menu:hover{
                color:black;
            }
            .menu{
                position: fixed;
                height:100%;
                background-color:  #00001a;
                color:white;
            }
        </style>
    </head>
    <body>
        <aside class="menu" >
            <p class="menu-label has-text-white has-text-weight-bold" style='padding: 30px 10px'>
                Gestionnary of the shop
            </p>
            <ul class="menu-list" >
                <li><a  
                        onMouseOver="this.style.color='black'"
                        onMouseOut="this.style.color='white'" 
                        style='color:white'
                        >Orders</a></li>
                <li><a  onMouseOver="this.style.color='black'"
                        onMouseOut="this.style.color='white'" 
                        style='color:white'>Products</a>
                         <ul>
                            <li><a  
                                    onMouseOver="this.style.color='black'"
                                    onMouseOut="this.style.color='white'" 
                                    href="AdminPage.jsp"
                                    style='color:white'>
                                    Your Products
                                </a>
                            </li>
                            <li><a  
                                    href="addProduct.jsp"
                                    onMouseOver="this.style.color='black'"
                                    onMouseOut="this.style.color='white'" 
                                    style='color:white'>
                                    Add a product
                                </a>
                            </li>   
                        </ul>
                </li>
            </ul>
        </aside>
    </body>
</html>
