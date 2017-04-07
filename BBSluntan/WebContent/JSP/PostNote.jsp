<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="UTF-8"%>
    <%@ page import="com.bbs.db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
int pid = Integer.parseInt(request.getParameter("id"));
int rootId = Integer.parseInt(request.getParameter("rootId"));
//String user = new String(request.getParameter("user").getBytes("ISO-8859-1"),"GBK");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv="Expires" content="0">
<!--<base href="http://www.cjsdn.net/">-->
<base href=".">
<title>Reply回复</title>
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
        <td align="right" valign="center"><span title="注册新账号"><a><!--href="http://www.cjsdn.net/user/register">--><font color="#FFFFFF">用户：<%=DB.user%></font></a></span><font color="#FFFFFF"> | </font> <span title="会员登录论坛"><a href="Login.jsp"><font color="#FFFFFF">退出</font></a></span><font color="#FFFFFF"> | </font> <span title="帮助及常见问题"><a href="http://www.cjsdn.net/html/help.html" target="_blank"><font color="#FFFFFF">帮助</font></a></span><font color="#FFFFFF"> |</font><br></td>
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
        <td><b><font size="3" face="arial"><b>&#187;</b></font>&nbsp;<a href="homepage.jsp" class="nav"><b>首页</b></a>&nbsp;<font size="3" face="arial"><b>&#187;</b></font></b></td>
      </tr>
    </tbody>
  </table>
  <a name="195657"></a>
  <table border="0" cellspacing="1" cellpadding="4" width="95%">
  </table>
  <table border="0" cellspacing="1" cellpadding="4" width="95%">
    <tbody>
    </tbody>
  </table>
  <table border="0" cellpadding="0" cellspacing="0" width="930" height="61">
    <tbody>
      <tr valign="top">
        <td width="99%"><div id="jive-message-holder">
          <div class="jive-message-list">
            <div class="jive-table">
              <div class="jive-messagebox">
                <form action="noteDeal.jsp" method="get">
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回复帖子:</h4><br>
                  <input type="hidden" name="pid" value="<%=pid %>"/>
                  <input type="hidden" name="rootId" value="<%=rootId%>"/>
                  标题：
                  <input type="text" name="title">
                  <br>
                  内容：
                  <textarea name="cont" rows="15" cols="80"></textarea>
                  <br>
                  <input type="submit" value="submit"/>
                </form>
              </div>
            </div>
          </div>
          <div class="jive-message-list-footer"></div>
        </div></td>
        <td width="1%">&nbsp;</td>
      </tr>
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