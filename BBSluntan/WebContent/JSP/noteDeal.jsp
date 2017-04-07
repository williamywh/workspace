<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,com.bbs.db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("GBK");

int pid = Integer.parseInt(request.getParameter("pid"));
int rootId = Integer.parseInt(request.getParameter("rootId"));
String title = new String(request.getParameter("title").getBytes("ISO-8859-1"),"gbk");
String cont = new String(request.getParameter("cont").getBytes("ISO-8859-1"),"gbk");
String sql = "insert into article values(null,?,?,?,?,now(),?,?)";

Connection conn = DB.getConn();
PreparedStatement pstmt = DB.prepareStmt(conn, sql);
Statement stmt = DB.createStmt(conn);
try{  
	boolean autoCommit = conn.getAutoCommit();
//    con = DB.getConnection();  
    conn.setAutoCommit(false);     
    pstmt.setInt(1, pid);
    pstmt.setInt(2, rootId);
    pstmt.setString(3, title);
    pstmt.setString(4, cont);
    pstmt.setInt(5, 0);
    pstmt.setString(6,DB.user);
    pstmt.executeUpdate();  
    stmt.executeUpdate("update article set isleaf = 1 where id = "+pid); 
    conn.commit();
    conn.setAutoCommit(autoCommit);
 }catch(Throwable e){  
    if(conn!=null){  
        try {  
            conn.rollback();  
        } catch (SQLException e1) {  
            e1.printStackTrace();  
        }  
    }  

throw new RuntimeException(e);  
 }finally{  
    if(conn!=null){  
        try {
        	DB.close(stmt);
            DB.close(pstmt);
            DB.close(conn);
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
} 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>帖子回复成功</title>
</head>
<body>
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
{window.location = "homepageStr.jsp";} 
}</SCRIPT>
</P></form>
<center><h>发表成功，5s后跳转到贴吧主页</h></center>
</body>
</html>