<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>找回密码--第一步</title>
<style type="text/css">    
 body{    
      background-image: url(../images/4.png);    
 }    
 </style> 
</head>
<body bgcolor="#BEBEBE">
	
<script language="javascript">
//验证密码
function checkPwd(str){
	if(str==""){		//当密码为空时
		document.getElementById("div_pwd").innerHTML="请输入用户名！";	//设置提示文字
		document.getElementById("tr_pwd").style.display='block';		//显示提示信息
		flag_pwd=false;
	}else{		//当密码合法时
		document.getElementById("div_pwd").innerHTML="";	//清空提示文字
		document.getElementById("tr_pwd").style.display='none';		//隐藏提示信息显示行
		flag_pwd=true;
	}
}
//验证确认密码是否正确
function checkRepwd(str){
	if(str==""){		//当确认密码为空时
		document.getElementById("div_pwd").innerHTML="请输入邮箱！";	//设置提示文字
		document.getElementById("tr_pwd").style.display='block';	//显示提示信息
		flag_repwd=false;
	}else{	//当两次输入的密码一致时
		document.getElementById("div_pwd").innerHTML="";	//清空提示文字
		document.getElementById("tr_pwd").style.display='none';		//隐藏提示信息显示行
		flag_repwd=true;
	}
}

</script>
<script language="javascript">
//保存用户注册信息
function save(){
	if(form1.pwd.value==""){		//当用户名为空时
		alert("请输入用户名！");form1.pwd.focus();return;
	}
	if(form1.repwd.value==""){		//当没有输入邮箱时
		alert("请确认注册预留邮箱！");form1.repwd.focus();return;
	}
	document.getElementById("form1").submit();
}
</script>

  <div id="register" style="padding: 4px; position: absolute; z-index: 11; display: block; left: 400px; top: 100px; background-color: rgb(84, 107, 81);">
  <form name="form1" action="PwdMod.jsp" method="post" id="form1">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FEFEFC">
      <tbody><tr>
        <td height="408" align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tbody><tr>
            <td height="50" style="color:#1B7F5D;font-size: 14px;"><b>找回密码--第一步</b></td>
          </tr>
        </tbody></table>
          <table width="94%" height="331" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
            <tbody><tr>
              <td height="310" valign="top" bgcolor="#FFFFFF"><table border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFEF9">
                <tbody><tr id="tr_user" style="display:none">
                  <td height="40" colspan="2" align="center"><div id="div_user" style="border:#FF6600 1px solid; color:#FF0000; width:90%; height:29px; padding-top:8px;"></div></td>
                </tr>
                <!--<tr>
                  <td width="93" height="40" align="right">用户名：</td>
                  <td height="40" align="left"><input name="user" type="text">
                    &nbsp;*长度限制为10个单位（不能包含括号）</td>
                </tr>  -->
                <br><br><br>
                <tr id="tr_pwd" style="display: block;">
                  <td height="40" colspan="2" align="center"><div id="div_pwd" style="border:#FF6600 1px solid; color:#FF0000; width:90%; height:29px; padding-top:8px; background-image:url(images/div_bg.jpg)">请输入用户名和注册邮箱</div></td>
                </tr>
                <tr>
                  <td height="40" align="right">用户名：</td>
                  <td height="40" align="left"><input name="pwd" type="text" onblur="checkPwd(this.value)">
                    &nbsp;* 输入用户名 </td>
                </tr>
                <tr>
                  <td height="40" align="right">注册预留邮箱：</td>
                  <td height="40" align="left"><input name="repwd" type="text" onblur="checkRepwd(this.value)">
                    &nbsp;* 请输入预留邮箱  </td>
                </tr>
                <!--<tr id="tr_email" style="display: block;">
                  <td height="40" colspan="2" align="center"><div id="div_email" style="border:#FF6600 1px solid; color:#FF0000; width:90%; height:29px; padding-top:8px; background-image:url(images/div_bg.jpg)">您输入的E-mail地址不正确！</div></td>
                </tr>-->
                <!--<tr>
                  <td height="40" align="right">E-mail地址：</td>
                  <td height="40" align="left"><input name="email" type="text" size="35" onblur="checkEmail(this.value)">
                    &nbsp;* 请输入有效的E-mail地址，在找回密码时应用 </td>
                </tr>-->
                <tr>
                  <td height="40">&nbsp;</td>
                  <td height="40" align="center"><input name="btn_sumbit" type="button" class="btn_grey" value="提交" onclick="save()">
                    &nbsp;
                    <input name="btn_reset" type="reset" value="重置">
					&nbsp;
                    </td>
                </tr>

              </tbody></table></td>
            </tr>
          </tbody></table></td>
      </tr>
      <tr>
        <td height="10" align="center" valign="top" bgcolor="#FEFEFC">&nbsp;找回密码--第一步</td>
      </tr>
    </tbody></table>
	</form>
  </div>
</body></html>