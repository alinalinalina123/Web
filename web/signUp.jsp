<%--
  Created by IntelliJ IDEA.
  User: alina
  Date: 30.04.2017
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>


<%
  String id = request.getParameter("id");

  String login = request.getParameter("login");
  String pwd = request.getParameter("pwd");
  String name = request.getParameter("name");
  String email = request.getParameter("email");
  if (!(login == null || login.isEmpty())) {

    String driverName = "org.postgresql.Driver";
    String connectionUrl = "jdbc:postgresql://localhost:5432/";
    String dbName = "TM_DB";
    String userId = "postgres";
    String password = "admin";
    try {
      Class.forName(driverName);
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    try {
      connection = DriverManager.getConnection(
              connectionUrl + dbName, userId, password);
      statement = connection.createStatement();

        String sql = "INSERT INTO user_table (id,login_,password_,name_,following_,followers_,posts_,email_) VALUES('"+ id + "','" + login + "','" + pwd + "','" + name+ "','" + 0+ "','" + 0+ "','" + 0+ "','" + email + "')";
        int flage = statement.executeUpdate(sql);

    } catch (Exception e) {
      e.printStackTrace();
    }

  }
%>

<html class="no-js">
<head>


    <!-- Meta info -->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp</title>
    <meta content="" name="description">
    <meta name="author" content="">
    <meta name="format-detection" content="">

    <!-- Styles -->
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
    <link href="styles/main.css" rel="stylesheet" media="screen, print" type="text/css">
    <link rel="stylesheet" href="styles/style.css">
    <script src="lib/modernizr-2.6.2.js"></script>


</head>
<div id="container">
    <section id="content">

        <div id="what-we-do">
            <header>
                <div id="pfd">
                    <a href="/login.jsp">
                        <img src="images/logo.png" alt="TakeMoment">
                    </a>

                    <div class="login" >
                        <h1>Регистрация</h1>
                        <form method="post" action="signUp.jsp">
                           <p></p>
                              <input type="text" id="id" placeholder="ID" name="id" size="35" /></td>
                            <p></p>
                               <input type=text name="login" size="35" placeholder="Логин "/></td>
                            <p></p>
                               <input type="password" name="pwd" size="35" placeholder="Пароль"/></td>
                            <p></p>
                               <input type="text" name="name" size="35" placeholder="Имя" /></td>
                            <p></p>
                                <input type="text" name="email" size="35" placeholder=" Email" /></td>
                            <p></p>
                            <input type="submit" name="insert" value="Сохранить"></td>

                        </form>
                    </div>


                </div>
            </header>






            <section id="web-design">


            </section>
        </div><!-- what we do -->
<br/>
        <br/>

        <footer id="msf">
            <div class="wrapper">
                <p/>
                <p/>
                <p/>
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

