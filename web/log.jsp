<%--
  Created by IntelliJ IDEA.
  User: alina
  Date: 30.04.2017
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html charset=UTF-8" pageEncoding="UTF-8"%>
    <title>Login</title>
</head>
<%request.setCharacterEncoding("UTF-8");%>
<body>
<%!
    String userdbName;
    String userdbPsw;
%>
<%
    Connection con= null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String driverName = "org.postgresql.Driver";
    String url = "jdbc:postgresql://localhost:5432/TM_DB";
    String user = "postgres";
    String dbpsw = "admin";

    String sql = "select * from user_table where login_=? and password_=? ";

    String name = request.getParameter("login");
    String password = request.getParameter("password");

    if(request.getParameter("commit").equals("Регистрация")){response.sendRedirect("signUp.jsp");}
    else{
    if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))) )
    {
        try{
            Class.forName(driverName);
            con = DriverManager.getConnection(url, user, dbpsw);
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);

            rs = ps.executeQuery();
            if(rs.next())
            {
                userdbName = rs.getString("login_");
                userdbPsw = rs.getString("password_");

                if(name.equals(userdbName) && password.equals(userdbPsw) )
                {
                    session.setAttribute("login",userdbName);
                    response.addHeader("logged","true");
                    response.sendRedirect("index.jsp");

                }
            }
            else
                response.sendRedirect("error.jsp");
            rs.close();
            ps.close();
        }
        catch(SQLException sqe)
        {
            out.println(sqe);
        }
    }
    else
    {
%>
<center><p style="color:red">Error In Login</p></center>
<%
            response.sendRedirect("login.jsp");
    }
    }
%>
</body>
</html>
