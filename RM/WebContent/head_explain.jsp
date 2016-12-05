<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.form.ArticleTypeForm"/>
<jsp:directive.page import="com.wy.form.ArticleForm"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" type="text/css"  rel="stylesheet">
<title>前台-说明</title>
<%@ page language="java" import="java.util.*" %>
<style type="text/css">
<!--
body {
	background-image: url(images/bg_01.gif);
}
-->
</style></head>
<jsp:useBean id="articleTypeDao" scope="request" class="com.wy.dao.ArticleTypeDao"></jsp:useBean>
<jsp:useBean id="articleDao" scope="request" class="com.wy.dao.ArticleDao"></jsp:useBean>

<body>
<!--网页头部分-->
<jsp:include page="head_top.jsp" flush="true" />



<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="74"><img src="images/head_06.jpg" width="74" height="846"></td>
    <td height="846" valign="top" background="images/head_07.jpg">
	<!--登录用户部分-->
		<br>
		
		




<table width="390" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#F7D069">
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">

    
      <div align="left"><strong>xx博客客户满意监督中心：</strong></div></td>
  </tr>
  <tr>
    <td height="55" valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;xx博客客户满意监督中心为了提供给您更好的服务，成立了“客户满意监督中心”。希望这样的监督机制进一步提供我们的服务水平！</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><div align="left"><strong>受理范围：</strong></div></td>
  </tr>
  <tr>
    <td height="61" valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;在服务及交易过程中员工个人的不正当行为，包括但不限于：服务态度差、服务方式不当、服务时效差的行为。</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><div align="left"><strong>投诉信箱：</strong></div></td>
  </tr>
  <tr>
    <td height="35" align="center" bgcolor="#FFFFFF"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;*****@****.com</div></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><div align="left"><strong>投诉电话：</strong></div></td>
  </tr>
  <tr>
    <td height="32" align="center" bgcolor="#FFFFFF"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;（0551）2514092</div></td>
  </tr>
</table>






















</td>
    <td width="10" background="images/head_07.jpg"><img src="images/head_08.jpg" width="13" height="846"></td>
    <td width="184" valign="top">
	
	
	
	
	  	<!--右侧操作部分-->
	  <jsp:include page="head_right.jsp" flush="true" />
	  
	  
	  
    </td>
    <td width="122"><img src="images/head_10.jpg" width="122" height="846"></td>
  </tr>
</table>
<!--网页尾部分-->
<jsp:include page="head_down.jsp" flush="true" />




</body>
</html>
