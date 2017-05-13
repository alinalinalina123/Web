<%--
  Created by IntelliJ IDEA.
  User: alina
  Date: 30.04.2017
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*" %>
<html class="no-js">
<head>


    <!-- Meta info -->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <meta content="" name="description">
    <meta name="author" content="">
    <meta name="format-detection" content="">

    <!-- Styles -->
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
    <link href="styles/main.css" rel="stylesheet" media="screen, print" type="text/css">
    <link rel="stylesheet" href="styles/style.css">
    <script src="lib/modernizr-2.6.2.js"></script>


</head>
<body>
<div id="container">
    <section id="content">

        <div id="what-we-do">
            <header>
                <div id="pfd">

                        <img src="images/logo.png" alt="TakeMoment">



                    <div class="login" >
                        <h1>Войти</h1>
                        <form method="post" action="log.jsp">
                            <p><input type="text" name="login" value="" placeholder="Логин "></p>
                            <p><input type="password" name="password" value="" placeholder="Пароль"></p>
                            <p class="remember_me">

                                </label>
                            </p>
                            <p class="submit"><input type="submit" name="commit" value="Войти">
                                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
                            <input type="submit" name="commit" value="Регистрация">

                        </form>
                    </div>


                </div>
            </header>






            <section id="web-design">


            </section>
        </div><!-- what we do -->


        <footer id="msf">
            <div class="wrapper">
                <ul id="lets-be-social">
                    <li>
                        <a href="https://twitter.com/" rel="external" target="_blank" title="Twitter">Twitter |</a>
                    </li>

                    <li>
                        <a href="https://www.facebook.com/" rel="external" target="_blank" title="Facebook">Facebook |</a>
                    </li>

                    <li>
                        <a href="http://www.vk.com/" rel="external" target="_blank" title="VK">VK</a>
                    </li>
                </ul>

                <div id="legal">
                    <span>Made by<br>Alina Podolyanchik &copy; 2017</span>
                </div>

            </div><!-- wrapper -->
        </footer><!-- footer -->
</div><!-- container -->







<script src="ajax/jquery-1.11.0.min.js"></script>
<script src="scripts/pyaari-main.1.0.js"></script>
<script src="scripts/pyaari-menu.1.0.js"></script>
<script>
    $(document).ready(function () {
        PfdMenu._ctor();
    });
</script>


<script>
    $(document).ready(function(){
        ReadMore.init();
    })
</script>


</body>
</html>