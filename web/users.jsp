<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html class="no-js">
<head>


    <!-- Meta info -->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <meta content="" name="description">
    <meta name="author" content="">
    <meta name="format-detection" content="">

    <!-- Styles -->
    <style>
       .box h1 {  color: #838b8b; font-family: «Great Vibes», cursive; font-size: 40px; line-height: 10px; font-weight: normal; margin-bottom: 0px; margin-top: 10px;margin-bottom: 10px; text-align: center; text-shadow: 0 1px 1px #fff;  }
        .box img {
            width:450px;
            height:400px;
            padding:top:80px;

        }
        .box h2
        {
            margin:30px auto;

        }
        .box {
            width:500px;
            height:500px;
            background:#FFF;
            margin:100px auto;
            padding-top:50px;
        }

        .effect8 {
            position:relative;
            -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
            -moz-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
            box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
        }
        .effect8:before,
        .effect8:after {
            content:"";
            position:absolute;
            z-index:-1;
            -webkit-box-shadow:0 0 20px rgba(0,0,0,0.8);
            -moz-box-shadow:0 0 20px rgba(0,0,0,0.8);
            box-shadow:0 0 20px rgba(0,0,0,0.8);
            top:10px;
            bottom:10px;
            left:0;
            right:0;
            -moz-border-radius:100px / 10px;
            border-radius:100px / 10px;
        }

        .effect8:after {
            right:10px;
            left:auto;
            -webkit-transform:skew(8deg) rotate(3deg);
            -moz-transform:skew(8deg) rotate(3deg);
            -ms-transform:skew(8deg) rotate(3deg);
            -o-transform:skew(8deg) rotate(3deg);
            transform:skew(8deg) rotate(3deg);
        }
        .round {

            width:60px;
            height:60px;
            border-radius:100px;
            box-shadow:0 0 0 3px white , 0 0 13px #333;
        }
    </style>
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
    <link href="styles/main.css" rel="stylesheet" media="screen, print" type="text/css">
    <script src="lib/modernizr-2.6.2.js"></script>
</head>
<body>
<div id="container">
    <section id="content">

        <header>
            <div id="pfd">
                <a href="index.html">
                    <img src="images/logo.png" alt="Take Moment">
                </a>
            </div>




            <div align="center">
                <ul>
                    <%
                        String connectionURL = "jdbc:postgresql://localhost:5432/TM_DB";
                        Connection con=null;
                        try{

                            Class.forName("org.postgresql.Driver").newInstance();
                            con=DriverManager.getConnection(connectionURL,"postgres","admin");
                            Statement stmt=con.createStatement();
                            String strQuery = "select filename_ , owner_name_ from photo_table";
                            ResultSet rs = stmt.executeQuery(strQuery);
                            int sno=0;

                            while(rs.next())
                            {
                                sno++;
                                String directory="C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\ROOT\\IMAGE\\"+rs.getString(1)+".jpg";

                                FileInputStream fis = new FileInputStream(directory);
                                byte[] buffer =   new byte[(int) fis.getChannel().size()];
                                fis.read(buffer);
                                fis.close();
                                String pps= Base64.encodeBase64String(buffer);
                    %>
                    <li><div class="box effect8"><h1><%=rs.getString(2)%></h1> <a href="detail.jsp?imgName=<%=rs.getString(1)%>"><img src="data:image/jpg;base64,<%=pps%>" width="190" height="360" alt="Sorry, try click and download..."></a><br/></div></li>

                    <%  }
                        rs.close();
                        con.close();
                        stmt.close();
                    }
                    catch(Exception e)
                    {
                        e.getMessage();
                    }
                    %>
                </ul>
            </div>
        </header>

        <footer id="msf">
            <div class="wrapper">
                <ul id="lets-be-social">
                    <li>
                        <a href="https://twitter.com/" rel="external" target="_blank" title="Twitter">Twitter | </a>
                    </li>
                    <li>
                        <a href="https://www.facebook.com/" rel="external" target="_blank" title="Facebook">Facebook | </a>
                    </li>
                    <li>
                        <a href="http://www.vk.com/" rel="external" target="_blank" title="VK">VK</a>
                    </li>
                </ul>

                <div id="legal">
                    <span>Made by<br>Alina Podolyanchik 2017 </span>
                </div>

            </div><!-- wrapper -->
        </footer><!-- footer -->
</div><!-- container -->


<nav id="toc">
    <ul>
        <li>
            <a href="index.jsp">Мой профиль</a></li>
        <li>
            <a  href="users.jsp">Лента</a></li>
        <li>
            <a href="login.jsp">Выйти</a></li>
    </ul>
</nav>



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