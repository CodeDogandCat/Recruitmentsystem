<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.wy.form.DiscussForm"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link type="text/css" rel="stylesheet" href="CSS/style.css">
<script language="javascript" type="text/javascript" src="JS/validate.js"></script>
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
<jsp:useBean id="pagination" class="com.wy.tool.MyPagination" scope="session"></jsp:useBean>
<jsp:useBean id="discussDao" class="com.wy.dao.DiscussDao" scope="session"></jsp:useBean>
<jsp:useBean id="articleTypeDao" class="com.wy.dao.ArticleTypeDao" scope="session"></jsp:useBean>
<%
String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=discussDao.queryDiscuss();
	int pagesize=15;      //指定每页显示的记录数
	list=pagination.getInitPage(list,Page,pagesize);     //初始化分页信息
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //获取指定页的数据
}
%>


<script type="text/javascript">
function deleteForm(id){
if(confirm("确定要删除此招聘信息吗？")){
window.location.href="DiscussServlet?method=1&id="+id;
}
}
</script>





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
		  
		              <%
if(pagination.getRecordSize()<=0){
	out.println("<p align=center><img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;&nbsp;&nbsp;没有招聘信息查询！</p>");
}else{
  
		  
		  
		  out.print("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;招聘查询</p>");%>
          <table width="550" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FECE62">
            <tr>
              <td width="120" height="25"><div align="center">招聘部门</div></td>
              <td width="120"><div align="center">招聘职位</div></td>
              <td width="120"><div align="center">开始日期</div></td>
              <td width="120"><div align="center">截止日期</div></td>
              <td width="70"><div align="center">操作</div></td>
            </tr>
            
         <%for(int i=0;i<list.size();i++){ 
         DiscussForm discussForm=(DiscussForm)list.get(i);
         
         
         %>   
            <tr bgcolor="#FFFFFF">
              <td height="25"><div align="center"><%=articleTypeDao.queryArticleTypeName(discussForm.getBmbh())%></div></td>
              <td><div align="center"><%=discussForm.getZwmc()%></div></td>
              <td ><div align="center"><%=discussForm.getKssj() %></div></td>
              <td ><div align="center"><%=discussForm.getJzsj() %></div></td>
              <td><div align="center"><a href="back_DiscussUpdate.jsp?id=<%=discussForm.getId()%>" title="可以查看相应的招聘内容">修改</a>&nbsp;&nbsp;<a href="javascript:deleteForm('<%=discussForm.getId()%>')">删除</a></div></td>
            </tr>
			<%} %>
			
          </table>
		  
		  
		 <%=pagination.printCtrl(Page) %>
<%} %>	 
		  
		  
		  
		  </td>
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
