<%--
  Created by IntelliJ IDEA.
  User: alina
  Date: 30.04.2017
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" pageEncoding="UTF-8">
    <title>Login Error</title>
</head>
<%request.setCharacterEncoding("UTF-8");%>
<body>
<center><p style="color:red">Такого пользователя не существует.</p></center>
<%
    request.getServletContext().getRequestDispatcher("/web/login.jsp").include(request, response);
%>
</body>
</html>
