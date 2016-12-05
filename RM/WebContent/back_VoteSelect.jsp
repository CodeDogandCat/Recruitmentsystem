<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.form.VoteForm"/>
<jsp:directive.page import="com.wy.form.ArticleTypeForm"/>
<jsp:directive.page import="java.util.List"/>
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
<jsp:useBean id="voteDao" class="com.wy.dao.VoteDao" scope="session"></jsp:useBean>
<jsp:useBean id="articleTypeDao" scope="session" class="com.wy.dao.ArticleTypeDao"></jsp:useBean>
<%
Integer typeId=null;
if(request.getParameter("typeId")!=null){
typeId=Integer.valueOf(request.getParameter("typeId"));
}

String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=voteDao.queryVoteList(typeId);
	for(int i=0;i<list.size();i++){
		System.out.println("简历编号（刚刚接收）" + ((VoteForm)list.get(i)).getId());
	}
	System.out.print("部门编号-------------------"+typeId);
	System.out.print("list 长度-------------------"+list.size());
	int pagesize=8;      //指定每页显示的记录数
	list=pagination.getInitPage(list,Page,pagesize);     //初始化分页信息
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //获取指定页的数据
}
%>




<script type="text/javascript">
function deleteForm(id){
if(confirm("确定要删除此简历吗？")){
window.location.href="VoteServlet?method=1&id="+id;
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
    
    
    
    <table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
    <%
    List typeList=articleTypeDao.queryArticleType();
    for(int i=0;i<typeList.size();i++){
    ArticleTypeForm articleTypeForm=(ArticleTypeForm)typeList.get(i);
    %>
   
	<a href="back_VoteSelect.jsp?typeId=<%=articleTypeForm.getId()%>"> [<%=articleTypeForm.getTypeName()%>]</a>&nbsp;
	
	<%     
   }
   %>	
   
    </td>
  </tr>
</table>



      <table width="573" border="0" cellpadding="0" cellspacing="0" background="images/back_noword_05.jpg">
        <tr>
          <td valign="top" align="center">		
		  
		  <%
		  
		  if(pagination.getRecordSize()<=0){
	out.println("<p align=center><img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;没有简历内容！</p>");
}else{
		  
		  
		  out.println("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;审核简历</p>");%>
		  
			
			<table border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FECE62">
              <tr bgcolor="#FECE62">
                <td width="50" height="20"><div align="center">编号</div></td>
                <td width="100"><div align="center">应聘职位</div></td>
                <td width="100"><div align="center">姓名</div></td>
                <td width="100"><div align="center">状态</div></td>
                <td width="100"><div align="center">操作</div></td>
               </tr>
              <%
			  
			  String [] status={"未审核","通过","不通过"};
              for(int i=0;i<list.size();i++){
              VoteForm voteForm=(VoteForm)list.get(i);
              System.out.println("简历编号----------"+voteForm.getId());
              %>
              <tr bgcolor="#FFFFFF">
                <td height="25"><div align="center"><%=voteForm.getId()%></div></td>
                <td><div align="center"><%=voteForm.getZwmc() %></div></td>
                <td><div align="center"><%=voteForm.getXm() %></div></td>
                <td><div align="center"><%=status[voteForm.getJlzt()] %></div></td>
              <td><div align="center">
              <%if (voteForm.getJlzt()==0) {%>
              <a href="back_VoteUpdate.jsp?id=<%=voteForm.getId()%>" >审核</a>
              <%}else{  %>
              <a href="#" >审核</a>
               <%}%>
<%--               &nbsp;&nbsp;<a href="javascript:deleteForm('<%=voteForm.getId()%>')">删除</a></div></td> --%>
              </tr>
              <%}%>
            </table>
			<%=pagination.printCtrl(Page) %>
			<%}%>
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
