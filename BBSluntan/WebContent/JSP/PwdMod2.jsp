<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.bbs.db.*, java.util.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>新密码</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<!--
JDBC 驱动名及数据库 URL 
数据库的用户名与密码，需要根据自己的设置
useUnicode=true&characterEncoding=utf-8 防止中文乱码
 -->
 <% 
    
    String pwd = new String(request.getParameter("pwd").getBytes("ISO8859-1"),"GBK");
    int temp = 0;
    String address = (String) session.getAttribute("repwd");
    String sql = "select * from user";
    String sql1 = "update user set password ="+"'"+pwd+"'"+" where address = "+"'"+address+"'";
    String address1 = null;
    Connection conn = DB.getConn();
	Statement stmt = DB.createStmt(conn);
	ResultSet rs = DB.executeQuery(stmt, sql);	
	while(rs.next()){
		address1 = rs.getString("address");
		if(address1.equals(address)){
		    PreparedStatement pstmt = DB.prepareStmt(conn, sql1);
		    break;
		}
	}
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
<center><h>密码修改成功，5s后跳转到登陆界面</h></center>
</body>
</html>