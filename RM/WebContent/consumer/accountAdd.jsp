<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" type="text/css" rel="stylesheet">
<script language="javascript" type="text/javascript" src="../JS/validate.js"></script>
<title>xx招聘管理系统-用户注册</title>
<style type="text/css">
<!--
body {
	background-image: url(../images/bg_01.gif);
}
-->
</style></head>

<body>
<div align="center">

<table width="800" height="689" border="0" cellpadding="0" cellspacing="0" background="../images/enrol.jpg">
  <tr>
    <td>	
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
	
	<form name="form" method="post" action="../ConsumerServlet?method=1&sign=1" onSubmit="return accountADD()">

  <table width="357" border="0" align="center">
    
    <tr>
      <td width="78" height="30">用户名：</td>
      <td width="263"><input name="account" type="text" class="inputinput" size="40"></td>
    </tr>
    <tr>
      <td height="30">密码：</td>
      <td><input name="password" type="password" class="inputinput"  size="40"></td>
    </tr>
    <tr>
      <td height="30">重复密码：</td>
      <td><input name="repeatPassword" type="password" class="inputinput"  size="40"></td>
    </tr>
    <tr>
      <td height="30">E-mail：</td>
      <td><input name="eMail" type="text" class="inputinput"  size="40"></td>
    </tr>
    <tr>
      <td height="30" colspan="2" align="center">
           <input type="image" class="inputinputinput" src="../images/save.gif">
&nbsp;&nbsp;
 <a href="#" onClick="javascript:form.reset()"><img src="../images/reset.gif"></a>
&nbsp;&nbsp;
<a href="#" onClick="window.location.href='../index.jsp'"><img src="../images/back.gif"></a>

       </td>
    </tr> 
  </table></form>
	
	
	</td>
  </tr>
</table>
</div>
</body>
</html>
