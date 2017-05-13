<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*" %>
<%@ page import="javafx.scene.image.Image" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page import="java.io.FileInputStream" %>
<html class="no-js">
<head>


    <!-- Meta info -->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TakeMoment</title>
    <meta content="" name="description">
    <meta name="author" content="">
    <meta name="format-detection" content="">
    <style>
	.round {

	width:60px;
	height:60px;
	border-radius:100px;
	box-shadow:0 0 0 3px white , 0 0 13px #333;
	}
	
	</style>
    <!-- Styles -->
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600' rel='stylesheet' type='text/css'>
    <link href="styles/main.css" rel="stylesheet" media="screen, print" type="text/css">
    <script src="lib/modernizr-2.6.2.js"></script>
</head>
<body>


    <div id="container" style="left: 0px;">
        <section id="content">
            
<header>
    <div id="pfd">
        <a href="index.jsp">
            <img src="images/logo.png" alt="TakeMoment">
        </a>
    </div>
    <div id="preamble" class="home">
        <div class="preamble">
	<h1>
		Добро пожаловать! Поделитесь своими незабываемыми моментами. 
		<p class="em" style="display: none;">
				
<p>&nbsp;
	</p>

    </div>
</header>
<div id="our-work">
    <ul>
        <%

            String connectionURL = "jdbc:postgresql://localhost:5432/TM_DB";
            Connection con=null;
            try{

                Class.forName("org.postgresql.Driver").newInstance();
                con=DriverManager.getConnection(connectionURL,"postgres","admin");
                Statement stmt=con.createStatement();

                String strQuery = "select filename_ , like_col_ from photo_table WHERE owner_name_ = '"+session.getAttribute("login").toString()+"'";
                ResultSet rs = stmt.executeQuery(strQuery);
                int like=0;

                while(rs.next())
                {

                    String directory="C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\ROOT\\IMAGE\\"+rs.getString(1)+".jpg";
                    like=rs.getInt(2);
                    FileInputStream fis = new FileInputStream(directory);
                    byte[] buffer =   new byte[(int) fis.getChannel().size()];
                    fis.read(buffer);
                    fis.close();
                    String pps= Base64.encodeBase64String(buffer);
        %>
<li>
    <a href="detail.jsp?imgName=<%=rs.getString(1)%>" >

        <img src="data:image/jpg;base64,<%=pps%>"
             width="190" height="360" alt="Sorry, try click and download...">


        <div class="overlay"><summary><h2><%=session.getAttribute("login")%></h2>
        </summary><div class="loves">
            <span><%=like%></span>
        </div>
        </div>
    </a>
</li>
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
</section>

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
                	<span>Made by<br>Alina_Podolyanchik &copy; 2017 </span>
                </div>
                
            </div><!-- wrapper -->
        </footer><!-- footer -->
    </div><!-- container -->
    
    
    <nav id="toc">
        <ul>
		   <li >
                <img src="images/user.png" class="round" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a><%=session.getAttribute("login")%></a>
				<br/>
				<br/>
				<br/>
				<br/>
				</li>
            <li>
                <a  href="index.jsp">Мой профиль</a></li>
            <li>
              <a  href="users.jsp"> Лента </a></li>
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