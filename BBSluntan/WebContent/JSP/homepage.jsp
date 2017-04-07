<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,com.bbs.db.*" %>
<%!
private void tree(List<Article> articles, Connection conn, int id, int grade) {
	String sql = "select * from article where pid = " + id;
	Statement stmt = DB.createStmt(conn);
	ResultSet rs = DB.executeQuery(stmt, sql); 
	try {
		while(rs.next()) {
			Article a = new Article();
			a.initFromRs(rs);
			a.setGrade(grade);
			articles.add(a);
			if(!a.isLeaf()) {
				tree(articles, conn, a.getId(), grade + 1);
			}
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		DB.close(rs);
		DB.close(stmt);
	}
}
%>

<%
String user = (String) session.getAttribute("user");
List<Article> articles = new ArrayList<Article>();
Connection conn = DB.getConn();
tree(articles, conn, 0, 0);
DB.close(conn);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<base href=".">
<title>中国Java - 测试</title>
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
<!--增加-->

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
        <td width="299" align="left"><a href="images/中国Java开发网 - 首页.html" target="_top"><img src="../images/titlea.png" border="0" hspace="0" vspace="0" align="left" width="299" height="75" alt="中国Java开发网"></a></td>
        <td width="299" align="left"></td>
        <td align="center"><strong><font size="+2">中国Java</font></strong></td>
      </tr>
    </tbody>
  </table>
  <table bgcolor="#007DC6" border="0" cellspacing="0" cellpadding="0" width="98%" height="21" style="border:1px #666666 solid; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px;width:98%;">
    <tbody>
      <tr>
        <td align="right" valign="center"><span title="注册新账号"><a href="待输入"><font color="#FFFFFF">用户：<%=user%></font></a></span><font color="#FFFFFF"> | </font> <span title="会员登录论坛"><a href="Login.jsp"><font color="#FFFFFF">退出</font></a></span><font color="#FFFFFF"> | </font> <span title="帮助及常见问题"><a href="待输入" target="_blank"><font color="#FFFFFF">帮助</font></a></span><font color="#FFFFFF"> | </font>&nbsp;&nbsp; <br></td>
      </tr>
      <tr> </tr>
    </tbody>
  </table>
  <br clear="all">
  <script>
function setCookie(name, value, expires, path, domain, secure) {
    var caution = false
	var curCookie = name + "=" + escape(value) +
		((expires) ? "; expires=" + expires.toGMTString() : "") +
		((path) ? "; path=" + path : "") +
		((domain) ? "; domain=" + domain : "") +
		((secure) ? "; secure" : "")
	if (!caution || (name + "=" + escape(value)).length <= 4000)
		document.cookie = curCookie
	else
		if (confirm("Cookie exceeds 4KB and will be cut!"))
			document.cookie = curCookie

}

function getCookie(name) {
	var prefix = name + "="
	var cookieStartIndex = document.cookie.indexOf(prefix)
	if (cookieStartIndex == -1)
		return null
	var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length)
	if (cookieEndIndex == -1)
		cookieEndIndex = document.cookie.length
	return unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex))
}

function deleteCookie(name, path, domain) {
	if (getCookie(name)) {
		document.cookie = name + "=" +
		((path) ? "; path=" + path : "") +
		((domain) ? "; domain=" + domain : "") +
		"; expires=Thu, 01-Jan-70 00:00:01 GMT"
	}
}

if(getCookie("resume")!="yes") {	
	setCookie("resume","yes");
	} 


<!--
function jumpPage(newLoc)
{
  newPage=newLoc.options[newLoc.selectedIndex].value;
  if(newPage!="")window.location.href=newPage;
}
// -->
</script>
  <table border="0" cellspacing="0" cellpadding="2" width="98%">
    <tbody>
      <tr>
        <td colspan="2" align="right" nowrap=""><table border="0" cellspacing="0" cellpadding="0">
            <tbody>
              <tr>
                <td><a href="带输入" target="_blank"><img src="../images/feed-rss.gif" align="absmiddle" border="0"></a> <a href="待输入" target="_blank"><img src="../images/feed-rdf.gif" align="absmiddle" border="0"></a> &nbsp; </td>
                <td><table border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                      <tr>
                        <td bgcolor="#9a9a9a"><table border="0" cellspacing="1" cellpadding="0">
                            <tbody>
                            <tr>
                                <td class="jive-icon"><a href="PostNote.jsp"><img src="../images/post-16x16.gif" alt="发表新主题" border="0" height="16" width="16"></a></td>
                                <td class="jive-icon-label"><a id="jive-post-thread" href="postTheme.jsp">发表新主题</a></td>
                            </tr>
                              <!--<tr align="center">
                                <td bgcolor="#e4e4e4"><img src="../images/posts.gif" align="absmiddle" border="0"><font class="member"><b>173180&nbsp;&nbsp;</b></font></td>
                              </tr>-->
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
  <table border="0" cellspacing="1" cellpadding="4" width="98%" class="board">
    <tbody>
      <tr class="head">
        <td colspan="2" align="center"><font color="#ffffff"><b>主题</b></font></td>
        <td nowrap="" align="center"><font color="#ffffff"><b>作者</b></font></td>
        <td nowrap="" align="center"><font color="#ffffff"><b>浏览</b></font></td>
        <td nowrap="" align="center"><font color="#ffffff">回复</font></td>
        <td nowrap="" align="center"><font color="#ffffff"><b>最新帖子</b></font></td>
      </tr>
      <tr class="neck">
        <td nowrap="" colspan="7"><b>Java技术</b></td>
      </tr>
      <%
                for(Iterator<Article> it = articles.iterator(); it.hasNext(); ) {
                	Article a = it.next();
                	String preStr = "";
  					for(int i=0; i<a.getGrade(); i++) {
  						preStr += "----";
  					}
                %>
      
      <tr class="even">
        <td align="center" nowrap="" width="7%" valign="top"><img src="../images/board.gif" border="0" align="absmiddle"></td>
        <td width="36%" valign="top" onMouseOver="this.style.backgroundColor=&#39;#e9e9e9&#39;; this.style.cursor=&#39;hand&#39;;" onMouseOut="this.style.backgroundColor=&#39;#f7f7f7&#39;;" onClick="window.location.href=&#39;post/page?bid=1&amp;sty=1&amp;age=0&#39;"><a href="PostDisplay.jsp?id=<%=a.getId()%>"><b><%=preStr+a.getTitle() %></b></a></td>
        <td nowrap="" align="center" width="14%">Y&&Z</td>
        <td nowrap="" align="center" width="13%">39547</td>
        <td nowrap="" align="center" width="10%">5555</td>
        <td nowrap="" align="center" class="smalltext" width="20%"><a href="带输入"><img src="../images/lastpost.gif" border="0" align="absmiddle"></a> <%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(a.getPdate()) %> <br>
          by <a href="待输入">课设小组</a></td>
        <form>
        </form>
      </tr>
      <%
                  }
                  %>
<!--      <tr class="even">
        <td align="center" nowrap="" width="7%" valign="top"><img src="../images/board.gif" border="0" align="absmiddle"></td>
        <td width="36%" valign="top" onMouseOver="this.style.backgroundColor=&#39;#e9e9e9&#39;; this.style.cursor=&#39;hand&#39;;" onMouseOut="this.style.backgroundColor=&#39;#f7f7f7&#39;;" onClick="window.location.href=&#39;post/page?bid=2&amp;sty=1&amp;age=0&#39;"><a href="待输入"><b>Java EE 综合讨论区</b></a></td>
        <td nowrap="" align="center" width="14%">4060</td>
        <td nowrap="" align="center" width="13%">14620</td>
        <td nowrap="" align="center" width="10%">5555</td>
        <td nowrap="" align="center" class="smalltext" width="20%"><a href="带输入"><img src="../images/lastpost.gif" border="0" align="absmiddle"></a> 2014-11-05 21:39 <br>
          by <a href="带输入">阿熊</a></td>
        <form>
        </form>
      </tr>-->
    </tbody>
  </table>
  <br>
  <div class="pages_btns">
<div class="pages"><a href="http://bbs.theworld.cn/tag.php?name=Java&amp;page=2" class="prev">&nbsp;</a></div></div>
<span class="nobreak"> 页: 
          第1页,共页 - <span class="jive-paginator"> [</span></span>
          
          <span class="nobreak"><span class="jive-paginator">
          <a href="待定">第一页</a></span></span>
          
          
          
          <span class="nobreak"><span class="jive-paginator">|</span></span>
          <span class="nobreak"><span class="jive-paginator">
          <a href="待定">上一页</a>
          </span></span>
          
         <span class="nobreak"><span class="jive-paginator">| </span></span>
         <span class="nobreak"><span class="jive-paginator">
         <a href="待定">下一页</a>
          |&nbsp; 
          <a href="待定">最末页</a> ] </span> </span>
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
          <td align="left"><font class="text"><font color="#808080"><br>
            Copyright &#169; 2002-2016 Team. All Righits Reserved. <a href="带输入" target="_blank">@尹文辉</a> <br>
            </font></font></td>
        </tr>
      </tbody>
    </table>
  </center>
</center>
</body>
</html>