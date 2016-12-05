<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:directive.page import="com.wy.form.ArticleTypeForm" />
<jsp:directive.page import="java.util.List" />
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link type="text/css" rel="stylesheet" href="CSS/style.css">
		<script language="javascript" type="text/javascript"
			src="JS/validate.js"></script>
		<script src="KingCalendar/jquery_1_7.js" language="javascript" type="text/javascript"></script>
        <script type="text/javascript" src="KingCalendar/King-Calendar.js" language="javascript"></script>
		<title>-后台管理</title>
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
	<jsp:useBean id="countTime" scope="page" class="com.wy.tool.CountTime"></jsp:useBean>
	<jsp:useBean id="articleTypeDao" scope="page" class="com.wy.dao.ArticleTypeDao"></jsp:useBean>
	<%
List list=articleTypeDao.queryArticleType();
if(list.size()==0){
out.print("<script language=javascript>alert('公示类型还没有添加，请添加！');window.location.href='back_ArticleTypeAdd.jsp';</script>");
}
%>





	<body>
		<jsp:include page="back_Top.jsp" flush="true" />
		<table width="800" border="0" align="center" cellpadding="0"
			cellspacing="0" background="images/back1.gif">
			<tr>
				<td width="227" valign="top">
					<jsp:include page="back_Left.jsp" flush="true" />
				</td>
				<td width="573" valign="top">
					<table width="227" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<img src="images/back_noword_03.jpg" width="573" height="25">
							</td>
						</tr>
					</table>
					<table width="573" border="0" cellpadding="0" cellspacing="0"
						background="images/back_noword_05.jpg">
						<tr>
							<td valign="top" align="center">

								<%out.println("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;公示添加</p>");%>
								<form name="form" method="post" action="ArticleServlet?method=2"
									onSubmit="return addArticle()">

<table width="600" border="1">

<tr >
      <td ><div align="center">招聘部门</div></td>
      <td><label>
        <select name="ypbm" id="ypbm">
        <option value="-1">==请选择==</option>
<%
    List list2=articleTypeDao.queryArticleType();
    for(int i=0;i<list2.size();i++){
    ArticleTypeForm articleTypeForm=(ArticleTypeForm)list2.get(i);
    %>
         <option value=<%=articleTypeForm.getId()%>><%=articleTypeForm.getTypeName() %></option>
          
    <%}%>
        </select>
      </label></td>

      <td><div align="center">招聘职位</div></td>
      <td><label>
        <select name="ypzw" id="ypzw">
        <option>==请选择==</option>
        <option>开发人员</option>
        <option>测试人员</option>
        <option>分析师</option>
        <option>会计</option>
        </select>
      </label></td>
</td>
    </tr>
    <tr>
       <td><div align="center">公示类型</div></td>
      <td><label>
        <select name="gslx" id="gslx">
        <option value="-1">==请选择==</option>
        <option value="0">笔试通知</option>
        <option value="1">面试通知</option>
        <option value="2">录取通知</option>
        </select>
      </label></td>
      
</tr>
 <tr>
      <td><div align="center">时间</div></td>
      <td>

<input name ="kssj" type="text" onFocus="StartCalendar({id:'kssj',lunarShow:true});" value="==请选择==" size="24" id="kssj" ></td>
      
      
      <td><input name="shi" type="text" id="shi"   value="10" size="3"></td>
    <td> <label  for="shi">点</label></td>
      <td><input name="fen" type="text" id="fen"   value="00" size="3"></td>
      <td><div align="center">分</div></td>
	  
	  
	  </td>
 </tr>
  <tr>
      <td ><div align="center">地点</div></td>
      <td><input name="ksdd" type="text" id="ksdd"    size="30"></td>
    </tr>
       <tr>
      <td height="181"><div align="center">详细信息</div></td>
      <td colspan="4"><label>
        <textarea name="xxxx" cols="70" rows="13" id="xxxx"></textarea>
      </label></td>
    </tr>
    
  </table>
  <p>&nbsp;</p>

								
								
		<br>
									<input type="image" class="inputinputinput"
										src="images/save.gif">
									&nbsp;&nbsp;
									<a href="#" onClick="javascript:form.reset()"><img
											src="images/reset.gif">
									</a>
								</form>

								<%
										if (request.getAttribute("result") != null) {
										out.print(request.getAttribute("result"));
									}
								%>
							</td>
						</tr>
					</table>
					<table width="227" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<img src="images/back_noword_18.jpg" width="573" height="21">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<jsp:include page="back_Down.jsp" flush="true" />
	</body>
</html>
