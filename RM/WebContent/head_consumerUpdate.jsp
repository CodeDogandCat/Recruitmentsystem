<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" type="text/css"  rel="stylesheet">
<title>前台-更改用户登录信息</title>
<%@ page language="java" import="java.util.*" %>
<style type="text/css">
<!--
body {
	background-image: url(images/bg_01.gif);
}
.style1 {
	color: #663403;
	font-weight: bold;
}
.style2 {color: #663403}
.style3 {color: #9a6400}
.style4 {
	color: #cc7800;
	font-size: 10pt;
}
.style5 {color: #663401}
-->
</style></head>
<%
com.wy.form.ConsumerForm consumerForm=(com.wy.form.ConsumerForm)session.getAttribute("form");
%>


<body>
<!--网页头部分-->
<jsp:include page="head_top.jsp" flush="true" />



<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="74"><img src="images/head_06.jpg" width="74" height="846"></td>
    <td height="846" valign="top" background="images/head_07.jpg">
	<!--登录用户部分-->
		<br>
		<jsp:include page="head_Consumer.jsp" flush="true" />&nbsp;
		
		<br>
		  <%out.println("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;更改用户信息</p>");%>
		  <form name="form" method="post" action="ConsumerServlet?method=6&id=<%=consumerForm.getId() %>" onSubmit="return hostUpdate()">
		  
            <table width="500" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FECE62">
              <tr>
                <td width="100" height="30"><div align="center">用户名：</div></td>
                <td width="219" bgcolor="#FFFFFF"><div align="center"><input name="account" type="text" class="inputinput" size="40" value="<%=consumerForm.getAccount()%>" readonly="readonly" onclick="alert('此文本框已设为只读，用户不能修改')"></div></td>
              </tr>
              <tr>
                <td width="100" height="30"><div align="center">密码：</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="password" type="password" class="inputinput" value="<%=consumerForm.getPassword() %>" size="40" ></div></td>
              </tr>
			   <tr>
                <td width="100" height="30"><div align="center">重复密码：</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="repeatPassword" type="password" class="inputinput"  value="<%=consumerForm.getPassword() %>"  size="40">
                </div></td>
              </tr>
              <tr>
                <td width="100" height="30"><div align="center">邮箱：</div></td>
                <td bgcolor="#FFFFFF"><div align="center"><input name="eMail" type="text" class="inputinput" size="40" value="<%=consumerForm.getEMail()%>"></div></td>
              </tr>
            </table>
            <div align="center"><br>
              <input type="image" class="inputinputinput" src="images/save.gif">
&nbsp;&nbsp;
   <a href="#" onClick="javascript:form.reset()"><img src="images/reset.gif"></a>
            </div>
		  </form>
			
		
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
