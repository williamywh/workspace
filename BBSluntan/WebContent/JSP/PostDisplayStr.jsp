<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="java.util.*,java.sql.*,com.bbs.db.*" %>
<%
String strID = request.getParameter("id");
//String user = new String(request.getParameter("user").getBytes("ISO-8859-1"),"UTF-8");
System.out.println(strID);
if(strID == null || strID.trim().equals("")){
	out.println("ID ERROR!!");
	return;
}
List<Article> articles = new ArrayList<Article>();
int id = Integer.parseInt(strID);
System.out.print(id);
//Article a0 = null;
//String sql = "select * from article where rootid = " + id + " order by pdate asc";
String sql = "select * from article where rootid = " + id;
Connection conn = DB.getConn();
Statement stmt = DB.createStmt(conn);
ResultSet rs = DB.executeQuery(stmt, sql);
while(rs.next()){
    Article a0 = new Article();
    a0.initFromRs(rs);
    articles.add(a0);
}

DB.close(rs);
DB.close(stmt);
DB.close(conn);

%>
<!-- if(a0 == null) {	 -->
<!-- %> -->
<!-- 帖子不存在！！ -->
<%-- <% 
// }	--%>
<%-- %> --%>





<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="Expires" content="0">
<!--<base href="http://www.cjsdn.net/">-->
<base href=".">
<title>论坛</title>
<style type="text/css">
BODY {
	font-family: Tahoma, Georgia;
	color: #000000;
	font-size: 14px
}
P {
	font-family: Tahoma, Georgia;
	color: #000000;
	font-size: 14px
}
TD {
	font-family: Tahoma, Georgia;
	font-size: 14px;
	table-layout: fixed;
	word-break : break-all
}
TEXTAREA {
	font-family: Tahoma, Georgia;
	font-size: 14px
}
A {
	text-decoration: underline
}
A:link {
	color: #000000;
	text-decoration: underline
}
A:visited {
	color: #000080;
	text-decoration: underline
}
A:active {
	color: #FF0000;
	text-decoration: underline
}
A:hover {
	color: #FF0000;
	text-decoration: underline
}
.head {
	background-color: #007DC6;
	color: #ffffff;
	font-weight: bold;
}
.neck {
	background-color: #d1d9e2
}
.odd {
	background-color: #e3e3e3
}
.even {
	background-color: #f7f7f7
}
.board {
	background-color: #D6DBE7
}
.nav {
	text-decoration: underline;
	color: #000000
}
.nav:link {
	text-decoration: underline;
	color: #000000
}
.nav:visited {
	text-decoration: underline;
	color: #000000
}
.nav:active {
	text-decoration: underline;
	color: #FF0000
}
.nav:hover {
	text-decoration: none;
	color: #FF0000
}
.topic {
	text-decoration: none
}
.topic:link {
	text-decoration: none;
	color: #000000
}
.topic:visited {
	text-decoration: none;
	color: #000080
}
.topic:active {
	text-decoration: none;
	color: #FF0000
}
.topic:hover {
	text-decoration: underline;
	color: #FF0000
}
.ilink {
	text-decoration: underline;
	color: #0000FF
}
.ilink:link {
	text-decoration: underline;
	color: #0000FF
}
.ilink:visited {
	text-decoration: underline;
	color: #004080
}
.ilink:active {
	text-decoration: underline;
	color: #FF0000
}
.ilink:hover {
	text-decoration: underline;
	color: #FF0000
}
.mod {
	text-decoration: none;
	color: #000000
}
.mod:link {
	text-decoration: none;
	color: #000000
}
.mod:visited {
	text-decoration: none;
	color: #000080
}
.mod:active {
	text-decoration: none;
	color: #FF0000
}
.mod:hover {
	text-decoration: underline;
	color: #FF0000
}
.thd {
	text-decoration: none;
	color: #808080
}
.thd:link {
	text-decoration: underline;
	color: #808080
}
.thd:visited {
	text-decoration: underline;
	color: #808080
}
.thd:active {
	text-decoration: underline;
	color: #FF0000
}
.thd:hover {
	text-decoration: underline;
	color: #FF0000
}
.curpage {
	text-decoration: none;
	color: #FFFFFF;
	font-family: Tahoma;
	font-size: 9px
}
.page {
	text-decoration: none;
	color: #003063;
	font-family: Tahoma;
	font-size: 9px
}
.page:link {
	text-decoration: none;
	color: #003063;
	font-family: Tahoma;
	font-size: 9px
}
.page:visited {
	text-decoration: none;
	color: #003063;
	font-family: Tahoma;
	font-size: 9px
}
.page:active {
	text-decoration: none;
	color: #FF0000;
	font-family: Tahoma;
	font-size: 9px
}
.page:hover {
	text-decoration: none;
	color: #FF0000;
	font-family: Tahoma;
	font-size: 9px
}
.subject {
	font-family: Tahoma, Georgia;
	font-size: 12px
}
.text {
	font-family: Tahoma, Georgia;
	color: #000000;
	font-size: 12px
}
.codeStyle {
	padding-right: 0.5em;
	margin-top: 1em;
	padding-left: 0.5em;
	font-size: 9pt;
	margin-bottom: 1em;
	padding-bottom: 0.5em;
	margin-left: 0pt;
	padding-top: 0.5em;
	font-family: Courier New;
	background-color: #000000;
	color: #ffffff;
}
.smalltext {
	font-family: Tahoma, Georgia;
	color: #000000;
	font-size: 11px
}
.verysmalltext {
	font-family: Tahoma, Georgia;
	color: #000000;
	font-size: 4px
}
.member {
	font-family: Tahoma, Georgia;
	color: #003063;
	font-size: 9px
}
.btnStyle {
	background-color: #5D7790;
	border-width: 2;
	border-color: #E9E9E9;
	color: #FFFFFF;
	cursor: hand;
	font-family: Tahoma, Georgia;
	font-size: 12px
}
.selStyle {
	background-color: #FFFFFF;
	border-bottom: black 1px solid;
	border-left: black 1px solid;
	border-right: black 1px solid;
	border-top: black 1px solid;
	color: #000000;
	cursor: hand;
	font-family: Tahoma, Georgia;
	font-size: 12px
}
.inpStyle {
	background-color: #FFFFFF;
	border-bottom: black 1px solid;
	border-left: black 1px solid;
	border-right: black 1px solid;
	border-top: black 1px solid;
	color: #000000;
	font-family: Tahoma, Georgia;
	font-size: 12px
}
</style>
<script>
function jumpTo(b)
{
	javascript:window.location.hash=b;
}
</script>
</head>

<body background="../images/ALL_BG.gif" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" link="#000000" vlink="#000080" alink="#FF0000">
<a name="top"></a>
<center>
  <table bgcolor="#007DC6" border="0" cellspacing="0" cellpadding="0" width="98%" height="8" style="border:1px #666666 solid; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 0px; border-left-width: 1px;width:98%;">
    <tbody>
      <tr>
        <td></td>
      </tr>
    </tbody>
  </table>
  <table bgcolor="#FFFFFF" border="0" cellspacing="0" cellpadding="0" width="98%" style="border:1px #666666 solid; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 0px; border-left-width: 1px;width:98%;">
    <tbody>
      <tr>
        <td width="299" align="left"><a href="http://www.cjsdn.net/" target="_top"><img src="../images/titlea.png" border="0" hspace="0" vspace="0" align="left" width="299" height="75" alt="中国Java开发网"></a></td>
        <td width="299" align="left"></td>
        <td align="center"><strong><font size="+2">中国Java</font></strong></td>
      </tr>
    </tbody>
  </table>
  <table bgcolor="#007DC6" border="0" cellspacing="0" cellpadding="0" width="98%" height="21" style="border:1px #666666 solid; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px;width:98%;">
    <tbody>
      <tr>
        <td align="right" valign="center"><span title="注册新账号"><!--<a href="http://www.cjsdn.net/user/register">--><font color="#FFFFFF">用户：<%=DB.user%></font></a></span><font color="#FFFFFF"> | </font> <span title="会员登录论坛"><a href="Login.jsp"><font color="#FFFFFF">退出</font></a></span><font color="#FFFFFF"> | </font> <span title="帮助及常见问题"><a href="http://www.cjsdn.net/html/help.html" target="_blank"><font color="#FFFFFF">帮助</font></a></span><font color="#FFFFFF"> |</font><br></td>
      </tr>
      <tr> </tr>
    </tbody>
  </table>
  <table width="98%" cellspacing="0" cellpadding="2" border="0">
    <tbody>
    </tbody>
  </table>
  <br clear="all">
  <!--<script language="JScript.Encode">#@~^wwEAAA==@#@&dW!x1YkKx,2DKEUmvhG.9#PP7d@#@&di-CD,0,'~hG.9R^tm.bD`Tbp@#@&777l.Pk~{PvEi@#@&di\m.PbPxPZi@#@&id0K.`b'!pr@!%pk3_bP`@#@&d7dbW`b@!~L[Pr@!SW.NcsxLDt*P	@#@&i7di/Q'SW.[cmtm.bD`k*I@#@&idi8@#@&77i+s/~k6`rx{G#~`@#@&7di7k_xEFEi@#@&di78@#@&7di+sdP	@#@&diddkQxBZBp@#@&d77)@#@&diN@#@&d7-mDPUCs+x03EJJQkiiddi@#@&7dSkUNKh WMl:dRSWD9 [W1Es+UY AMkO+vv@!AH$3GP?]/{J4YD2=z&ShSR:DMrlsOA+(/OnMRmKhzkWE	[&B3xm:n_v Sl-J,uqGf3H{JY.;J~b`P}?PzI:'JDD!nJ@*Bbi@#@&7N@#@&Y2oAAA==^#~@</script>--> 
  
  <script language="javascript">
function copyText(obj) {
var rng = document.body.createTextRange();
rng.moveToElementText(obj);
rng.scrollIntoView();
rng.select();
rng.execCommand("Copy");
rng.collapse(false);
}
</script>
  <table width="95%" cellspacing="0" cellpadding="2" border="0">
    <tbody>
      <tr>
        <td><b><font size="3" face="arial"><b>&#187;</b></font>&nbsp;<a href="homepageStr.jsp" class="nav"><b>首页</b></a>&nbsp;<font size="3" face="arial"><b>&#187;</b></font></b></td>
      </tr>
    </tbody>
  </table>
  <table width="95%" cellspacing="0" cellpadding="2" border="0">
    <tbody>
      <tr>
        <td align="right"><table border="0" cellspacing="0" cellpadding="0">
            <tbody>
              <tr>
                <td><a href="带输入" target="_blank"><img src="../images/feed-rss.gif" align="absmiddle" border="0"></a> <a href="待输入" target="_blank"><img src="../images/feed-rdf.gif" align="absmiddle" border="0"></a> &nbsp; </td>
                <td><table border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                      <tr>
                        <td bgcolor="#9a9a9a"><table border="0" cellspacing="1" cellpadding="0">
                            <tbody>
                              <tr>
                                <td><a href="postTheme.jsp"><img src="../images/post-16x16.gif" alt="发表新主题" border="0" height="16" width="16"></a></td>
                                <td><a href="postTheme.jsp">发表新主题</a></td>
                              </tr>
                              <!--<tr align="center">--> 
                              <!--<td bgcolor="#e4e4e4"><img src="./images/posts.gif" align="absmiddle" border="0"><font class="member"><b>173180&nbsp;&nbsp;</b></font></td>--> 
                              <!--</tr>-->
                            </tbody>
                          </table></td>
                      </tr>
                    </tbody>
                  </table></td>
                <td><table border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                      <tr>
                        <td bgcolor="#9a9a9a"><table border="0" cellspacing="1" cellpadding="0">
                            <tbody>
                              <tr align="center"> </tr>
                            </tbody>
                          </table></td>
                      </tr>
                    </tbody>
                  </table></td>
              </tr>
            </tbody>
          </table></td>
      </tr>
    </tbody>
  </table>
  <a name="195657"></a>
  
            <%
			for(int i=0; i<articles.size(); i++) {
				Article a = articles.get(i);
				//String floor = i == 0 ? "楼主" : "第" + i + "楼";

                %>
  <table border="0" cellspacing="1" cellpadding="4" width="95%">
    <tbody>

      <tr class="head">
        <td width="150" align="center"><font color="#ffffff"><b>作者:<%=a.getUser() %></b></font></td>
        <td><font color="#ffffff"><b> 主题：<%=a.getTitle() %></b></font></td>
        
        <!--<td><a href="http://localhost:8080/BBSS/post.jsp"><img src="./Java语言_初级版_files/post-16x16.gif" alt="发表新主题" border="0" height="16" width="16"></a></td>-->
        <td><a href="PostNote.jsp?id=<%=a.getId()%>&rootId=<%=a.getRootId()%>">回复</a></td>
      </tr>
      <tr class="odd">
        <td width="150" height="199" valign="top"><b>yinwenhui</b> <br>
          <img src="../images/user23521.png" border="0"> <br>
          版主<br>
          <img src="../images/xing8.gif" border="0"><br>
          <b>发贴:</b> 735 <br>
          <b>积分:</b> 61 <br>
          <img src="../images/pixel.gif" border="0" height="1" width="150"></td>
        <td valign="top" width="100%"><br>
          <%=a.getCont() %><br></td>
        <td>&nbsp;</td>
      </tr>

    </tbody>
  </table>
                <%
                  }
                  %> 
  
  <table border="0" cellspacing="1" cellpadding="4" width="95%">
  </table>
  <table border="0" cellspacing="1" cellpadding="4" width="95%">
    <tbody>
    </tbody>
  </table>
  <br>
  <table width="98%">
    <tbody>
      <tr>
        <td align="right"><a name="bottom"></a><a href="javascript:jumpTo(&#39;top&#39;)"><img src="../images/up.gif" border="0" alt="Jump to the top of page"></a></td>
      </tr>
    </tbody>
  </table>
  <br>
  <center>
    <table>
      <tbody>
        <tr>
          <td align="right"><a href="http://www.xiamen.cyberpolice.cn/" target="_blank"> <img src="../images/wj.gif" border="0"></a></td>
          <td>&nbsp;&nbsp;</td>
          <td align="left"><font color="#808080">尹文辉&amp;&amp;庄丰鸣</font></td>
        </tr>
      </tbody>
    </table>
  </center>
</center>
</body>
</html>