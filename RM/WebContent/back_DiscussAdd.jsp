<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.form.ConsumerForm"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.ArticleTypeForm"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link type="text/css" rel="stylesheet" href="CSS/style.css">
<script language="javascript" type="text/javascript" src="JS/validate.js"></script>
<script src="KingCalendar/jquery_1_7.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript" src="KingCalendar/King-Calendar.js" language="javascript"></script>
<title> -后台管理</title>
<style type="text/css">
<!--
.style1 {color: #FFCD00}
.style2 {
	color: #a54400;
	font-weight: bold;
}
body {
	background-color: #F0F0F0;
}
.style4 {color: #666666}
-->
</style>
</head>
<jsp:useBean id="articleTypeDao" scope="request" class="com.wy.dao.ArticleTypeDao"></jsp:useBean>
<jsp:useBean id="countTime" scope="page" class="com.wy.tool.CountTime"></jsp:useBean>
<body>
<jsp:include page="back_Top.jsp" flush="true" />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="images/back1.gif">
  <tr>
    <td width="227" valign="top"><jsp:include page="back_Left.jsp" flush="true" /></td>
    <td width="573" valign="top"><table width="227" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="images/back_noword_03.jpg" width="573" height="25"></td>
      </tr>
    </table>
      <table width="573" border="0" cellpadding="0" cellspacing="0" background="images/back_noword_05.jpg">
        <tr>
          <td valign="top" align="center">		
		  
		  <%out.println("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;招聘信息添加</p>");%>
		  <form name="form" method="post" action="DiscussServlet?method=0" onSubmit="return addDiscuss()">
		  


<table width="550" border="1">

<tr>
      <td><div align="center">招聘部门</div></td>
      <td><label>
        <select name="ypbm" id="ypbm">
        <option value="-1">==请选择==</option>
<%
    List list=articleTypeDao.queryArticleType();
    for(int i=0;i<list.size();i++){
    ArticleTypeForm articleTypeForm=(ArticleTypeForm)list.get(i);
    %>
         <option value=<%=articleTypeForm.getId()%>><%=articleTypeForm.getTypeName() %></option>
          
    <%}%>
        </select>
      </label></td>

      <td><div align="center">招聘职位</div></td>
      <td width="178"><label>
        <input name="ypzw" type="text" id="ypzw" />
      </label></td>
</td>
    </tr>
    <tr>
      <td width="83"><div align="center">招聘人数（个）</div></td>
      <td width="178"><label>
        <input name="zprs" type="text"  id="zprs" />
      </label></td>
       <td width="83"><div align="center">承诺月薪(元)</div></td>
      <td width="178"><label>
        <input name="cnyx" type="text" id="cnyx" />
      </label></td>

      
    </tr>
    <tr>
      <td height="181"><div align="center">具体要求</div></td>
      <td colspan="4"><label>
        <textarea name="jtyq" cols="70" rows="13" id="jtyq"></textarea>
      </label></td>
    </tr>
    <tr>
      <td><div align="center">开始时间</div></td>
      <td>

<input type="kssj" onFocus="StartCalendar({id:'kssj',lunarShow:true});" value="选择日期" size="24" id="kssj" ></td>
      
      <td><div align="center">截止时间</div></td>
      <td>
	  
<input name="jzsj" type="text" id="jzsj"  onFocus="StartCalendar({id:'jzsj',lunarShow:true});" value="选择日期" 

size="24"></td>
	  
	  
	  </td>
 </tr>
    
  </table>
  <p>&nbsp;</p>
            <br>
 <input type="image" class="inputinputinput" src="images/save.gif">
&nbsp;&nbsp;
 <a href="#" onClick="javascript:form.reset()"><img src="images/reset.gif"></a>
            </form>
			
			<%if(request.getAttribute("result")!=null){
			out.print(request.getAttribute("result"));
			} %></td>
        </tr>
      </table>
      <table width="227" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="images/back_noword_18.jpg" width="573" height="21"></td>
        </tr>
      </table></td>
  </tr>
</table>
<jsp:include page="back_Down.jsp" flush="true" />
</body>
</html>
