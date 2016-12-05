<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.form.ArticleForm"/>
<jsp:directive.page import="com.wy.form.ConsumerForm"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" type="text/css"  rel="stylesheet">
<title>前台-公示详细查询</title>
<%@ page language="java" import="java.util.*" %>
<style type="text/css">
<!--
body {
	background-image: url(images/bg_01.gif);
}
-->
</style></head>
<jsp:useBean id="pagination" class="com.wy.tool.MyPagination" scope="session"></jsp:useBean>
<jsp:useBean id="consumerDao" class="com.wy.dao.ConsumerDao" scope="request"></jsp:useBean>
<jsp:useBean id="articleDao" class="com.wy.dao.ArticleDao" scope="request"></jsp:useBean>
<%
ConsumerForm consumerForm=(ConsumerForm)session.getAttribute("form");
String id=request.getParameter("id");
ArticleForm articleForm=articleDao.queryArticleForm(Integer.valueOf(id));
Map<String,String> idcard_name=articleForm.getIdcard_name();
%>
<body>
<!--网页头部分-->
<jsp:include page="head_top.jsp" flush="true" />

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="74"><img src="images/head_06.jpg" width="74" height="846"></td>
    <td valign="top" background="images/head_07.jpg" width="407" height="846">

<%
out.println("<br><p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;"+articleForm.getBmmc()+"--"+articleForm.getZwmc()  +"</p>");
%>
	
	  <table width="500" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#fece62">
	   <tr>
          <td valign="top" bgcolor="#fece62">&nbsp;&nbsp;&nbsp;&nbsp;详细信息：</td>
        </tr>
	   <tr>
          <td height="200" width="500" valign="top" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;<%=articleForm.getXxxx() %></td>
        </tr>
        <tr>
          <td valign="top"  bgcolor="#fece62">&nbsp;&nbsp;&nbsp;&nbsp;<%="请下表中的应聘者于"+articleForm.getKssj()+"到"+articleForm.getKsdd()+articleForm.getType() %></td>
        </tr>
      </table>
	  <table width="500" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" >
        <tr>
	    <td width="250" bgcolor="#fece62" height="22"><b>姓名</b></td>
	    <td width="250" bgcolor="#fece62" height="22"><b>身份证号</b></td>
  		</tr>
        <%
        for(Map.Entry<String, String> entry:idcard_name.entrySet()){ 

		%>
		  <tr>
		    <td width="250" height="22"><b><%=entry.getValue() %></b></td>
		    <td width="250" height="22"><b><%=entry.getKey() %></b></td>
		  </tr>
<%} %>
      </table>
	  <table width="373"  border="0">
       
      </table>
	  <table width="373" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="36" align="right"><div align="center"><a href="#" onclick="javascript:history.go(-1);"><img src="images/back.gif"></a></div></td>
        </tr>
      </table>  

  </td>
    <td width="10"><img src="images/head_08.jpg" width="13" height="846"></td>
    <td width="184" valign="top"><jsp:include page="head_right.jsp" flush="true" />
	  
    </td>
    <td width="122"><img src="images/head_10.jpg" width="122" height="846"></td>
  </tr>
</table>
<!--网页尾部分-->
<jsp:include page="head_down.jsp" flush="true" />


</body>
</html>
