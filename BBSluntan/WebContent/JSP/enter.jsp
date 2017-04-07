<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.bbs.db.*, java.util.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>判断是否成功登陆</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<!--
JDBC 驱动名及数据库 URL 
数据库的用户名与密码，需要根据自己的设置
useUnicode=true&characterEncoding=utf-8 防止中文乱码
 -->
 <% 
    
    String name = new String(request.getParameter("username").getBytes("ISO8859-1"),"GBK");
    String password = new String(request.getParameter("password").getBytes("ISO8859-1"),"GBK");
    int temp = 0;
    String sql = "select * from user";
    Connection conn = DB.getConn();
	Statement stmt = DB.createStmt(conn);
	ResultSet rs = DB.executeQuery(stmt, sql);
	String name1 = null;
	String password1 = null;
	try{
		while (rs.next()) {
			name1 = rs.getString("name");
			password1 = rs.getString("password");
			if(name1.equals(name)&&password1.equals(password)){
				temp = 1;
				//添加
				DB.user = name;
				//System.out.println(DB.user);
				//session.setAttribute("user", name);
				response.sendRedirect("homepageStr.jsp");
			}
			
		}	
		if(temp == 0){
%>			
<br><br><br><br><br><br><br><br>
　　<form name=loading>
<P align=center><FONT face=Arial color=#0066ff size=30>loading...</FONT> <INPUT 
style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-WEIGHT: bolder; PADDING-BOTTOM: 0px; COLOR: #0066ff; BORDER-TOP-style: none; PADDING-TOP: 0px; FONT-FAMILY: Arial; BORDER-RIGHT-style: none; BORDER-LEFT-style: none; BACKGROUND-COLOR: white; BORDER-BOTTOM-style: none" 
size=46 name=chart> <BR><INPUT 
style="BORDER-RIGHT: medium none; BORDER-TOP: medium none; BORDER-LEFT: medium none; COLOR: #0066ff; BORDER-BOTTOM: medium none; TEXT-ALIGN: center" 
size=47 name=percent>
<SCRIPT> 
var bar=0 
var line="||" 
var amount="||" 
count() 
function count(){ 
bar=bar+2 
amount =amount + line 
document.loading.chart.value=amount 
document.loading.percent.value=bar+"%" 
if (bar<99) 
{setTimeout("count()",80);} 
else 
{window.location = "Login.jsp";} 
}</SCRIPT>
</P></form>
<center><h>信息有误，5s后跳转到登陆界面</h></center>
<%			
		}
         	
	}
	catch(SQLException ex){
		ex.printStackTrace();
	}
	finally{
		try {
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
%>
</body>
</html>