<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
    <%@ page import="java.sql.*,com.bbs.db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<%
String user = new String(request.getParameter("user").getBytes("ISO8859-1"),"GBK");
String pwd = new String(request.getParameter("pwd").getBytes("ISO8859-1"),"GBK");
String email = new String(request.getParameter("email").getBytes("ISO8859-1"),"GBK");
String sql = "insert into user values("+"'"+user+"',"+"'"+pwd+"',"+"'"+email+"')";
Connection conn = DB.getConn();
PreparedStatement stmt = DB.prepareStmt(conn,sql);
response.sendRedirect("Login.jsp");
%>
</body>
</html>