<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>BBS��̳--ע��</title>
<style type="text/css">    
 body{    
      background-image: url(../images/4.png);    
 }    
 </style> 
</head>
<body bgcolor="#BEBEBE">
	
<script language="javascript">
var flag_user=true;		//��¼�û��Ƿ�Ϸ�
var flag_pwd=true;			//��¼�����Ƿ�Ϸ�
var flag_repwd=true;		//ȷ�������Ƿ�ͨ��
var flag_email=true;		//��¼E-mail��ַ�Ƿ�Ϸ�

//��֤����
function checkPwd(str){
	if(str==""){		//������Ϊ��ʱ
		document.getElementById("div_pwd").innerHTML="���������룡";	//������ʾ����
		document.getElementById("tr_pwd").style.display='block';		//��ʾ��ʾ��Ϣ
		flag_pwd=false;
	}else if(!checkePwd(str)){		//�����벻�Ϸ�ʱ
		document.getElementById("div_pwd").innerHTML="����������벻�Ϸ�!";	//������ʾ����
		document.getElementById("tr_pwd").style.display='block';	//��ʾ��ʾ��Ϣ
		flag_pwd=false;
	}else{		//������Ϸ�ʱ
		document.getElementById("div_pwd").innerHTML="";	//�����ʾ����
		document.getElementById("tr_pwd").style.display='none';		//������ʾ��Ϣ��ʾ��
		flag_pwd=true;
	}
}
//��֤ȷ�������Ƿ���ȷ
function checkRepwd(str){
	if(str==""){		//��ȷ������Ϊ��ʱ
		document.getElementById("div_pwd").innerHTML="��ȷ�����룡";	//������ʾ����
		document.getElementById("tr_pwd").style.display='block';	//��ʾ��ʾ��Ϣ
		flag_repwd=false;
	}else if(form1.pwd.value!=str){		//��ȷ����������������벻һ��ʱ
		document.getElementById("div_pwd").innerHTML="������������벻һ�£�";	//������ʾ����
		document.getElementById("tr_pwd").style.display='block';	//��ʾ��ʾ��Ϣ
		flag_repwd=false;
	}else{	//���������������һ��ʱ
		document.getElementById("div_pwd").innerHTML="";	//�����ʾ����
		document.getElementById("tr_pwd").style.display='none';		//������ʾ��Ϣ��ʾ��
		flag_repwd=true;
	}
}

</script>
<script language="javascript">
//�����û�ע����Ϣ
function save(){
	if(form1.user.value==""){		//���û���Ϊ��ʱ
		alert("�������û�����");form1.user.focus();return;
	}
	if(form1.pwd.value==""){		//������Ϊ��ʱ
		alert("���������룡");form1.pwd.focus();return;
	}
	if(form1.repwd.value==""){		//��û������ȷ������ʱ
		alert("��ȷ�����룡");form1.repwd.focus();return;
	}
	if(form1.email.value==""){		//��E-mail��ַΪ��ʱ
		alert("������E-mail��ַ��");form1.email.focus();return;
	}
	document.getElementById("form1").submit();
}
</script>

  <div id="register" style="padding: 4px; position: absolute; z-index: 11; display: block; left: 270px; top: 100px; background-color: rgb(84, 107, 81);">
  <form name="form1" action="informationEntering.jsp" method="post" id="form1">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FEFEFC">
      <tbody><tr>
        <td height="408" align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tbody><tr>
            <td height="50" style="color:#1B7F5D;font-size: 14px;"><b>BBS��̳--�û�ע��</b></td>
          </tr>
        </tbody></table>
          <table width="94%" height="331" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
            <tbody><tr>
              <td height="310" valign="top" bgcolor="#FFFFFF"><table border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFEF9">
                <tbody><tr id="tr_user" style="display:none">
                  <td height="40" colspan="2" align="center"><div id="div_user" style="border:#FF6600 1px solid; color:#FF0000; width:90%; height:29px; padding-top:8px;"></div></td>
                </tr>
                <tr>
                  <td width="93" height="40" align="right">�û�����</td>
                  <td height="40" align="left"><input name="user" type="text">
                    &nbsp;*��������Ϊ10����λ�����ܰ������ţ�</td>
                </tr>
                <tr id="tr_pwd" style="display: block;">
                  <td height="40" colspan="2" align="center"><div id="div_pwd" style="border:#FF6600 1px solid; color:#FF0000; width:90%; height:29px; padding-top:8px; background-image:url(images/div_bg.jpg)">������������벻һ�£�</div></td>
                </tr>
                <tr>
                  <td height="40" align="right">���룺</td>
                  <td height="40" align="left"><input name="pwd" type="password" onblur="checkPwd(this.value)">
                    &nbsp;* ����ĳ��ȴ���6λС��30λ</td>
                </tr>
                <tr>
                  <td height="40" align="right">ȷ�����룺</td>
                  <td height="40" align="left"><input name="repwd" type="password" onblur="checkRepwd(this.value)">
                    &nbsp;* ��ȷ������ </td>
                </tr>
                <!--<tr id="tr_email" style="display: block;">
                  <td height="40" colspan="2" align="center"><div id="div_email" style="border:#FF6600 1px solid; color:#FF0000; width:90%; height:29px; padding-top:8px; background-image:url(images/div_bg.jpg)">�������E-mail��ַ����ȷ��</div></td>
                </tr>-->
                <tr>
                  <td height="40" align="right">E-mail��ַ��</td>
                  <td height="40" align="left"><input name="email" type="text" size="35" onblur="checkEmail(this.value)">
                    &nbsp;* ��������Ч��E-mail��ַ�����һ�����ʱӦ�� </td>
                </tr>
                <tr>
                  <td height="40">&nbsp;</td>
                  <td height="40" align="center"><input name="btn_sumbit" type="button" class="btn_grey" value="�ύ" onclick="save()">
                    &nbsp;
                    <input name="btn_reset" type="reset" value="����">
					&nbsp;
                    </td>
                </tr>

              </tbody></table></td>
            </tr>
          </tbody></table></td>
      </tr>
      <tr>
        <td height="10" align="center" valign="top" bgcolor="#FEFEFC">&nbsp;BBS��̳ע��</td>
      </tr>
    </tbody></table>
	</form>
  </div>
</body></html>