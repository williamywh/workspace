<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>BBS��̳��¼����--��¼</title>
<style type="text/css">    
 body{    
      background-image: url(../images/3.png);    
 }    
 </style> 
</head>

<body leftmargin=0  topmargin=0>
<script language="javascript">
//�ж��û���Ϣ
function check(){
	if(form.username.value==""){		//���û���Ϊ��ʱ
		alert("�������û�����");form.username.focus();return;
	}
	if(form.password.value==""){		//������Ϊ��ʱ
		alert("���������룡");form.password.focus();return;
	}
	document.getElementById("form").submit();
}
</script>
<center><h1>��ӭʹ��BBS��̳</h1></center>
<table  border=0  cellpadding=0  cellspacing=0  width=1400  height=300>

<tr><td  align=center  valign=center>
<div style="position:absolute;width:500px;height:200px;top:150px;left:750px">
<table >
<form name="form" id="form" action="enter.jsp" method="post" onsubmit="return checkForm(this);">
<tr>
<td><h2>�û�����</td><td><h3><input type="text" name="username"></td>
</tr>
<tr>
<td><h2>���� ��</td><td><h3><input type="password" name="password"></td>
</tr>
<tr>
<td><input type="button" value="��¼" name="submit1" onclick="check()"></td>
<td><input type="reset" value="����" name="reset1"></td>
</tr>
</form>
<tr>
<td>
<form action="getPassword.jsp" method=post >
<input type="submit" value="ȡ������" name="getpass">
</form>
</td>
<td>
<form action="register.jsp" method=post >
<input type="submit" value="���û�ע��" name="regist">
</form>
</td>
</tr>
</table>
</td></tr>

</table>
</div>
</body>
</html>