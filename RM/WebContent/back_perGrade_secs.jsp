<%@ page language="java" contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
	
<jsp:directive.page import="com.wy.form.GradeForm" />
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="java.sql.ResultSet"/>
<jsp:directive.page import="com.wy.tool.JDBConnection"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="refresh" content="0;url=back_Grade.jsp">
<link rel="stylesheet" href="CSS/table.css" type="text/css" />
<script language="javascript" type="text/javascript"
			src="JS/validate.js"></script>
<title>成绩管理</title>

</head>
<jsp:useBean id="countTime" scope="page" class="com.wy.tool.CountTime"></jsp:useBean>
<jsp:useBean id="gradeDao" scope="page" class="com.wy.dao.GradeDao"></jsp:useBean>
<jsp:useBean id="connection" scope="page" class="com.wy.tool.JDBConnection"></jsp:useBean>
<body>
<jsp:include page="back_Top.jsp" flush="true" />
<%
connection = new JDBConnection();
boolean flag = false;
int  bs = Integer.parseInt(request.getParameter("bscj"));
int  ms = Integer.parseInt(request.getParameter("mscj"));
int  zz = Integer.parseInt(request.getParameter("zzzt"));
int  cj = Integer.parseInt(request.getParameter("id"));

try{
String sql = null;
sql ="update tb_cj set bscj="+bs+","+"mscj="+ms+","+"zzzt="+zz+" where cjbh="+cj;
connection.executeUpdate(sql);
}catch(Exception e) {
}
%>
</body>
</html>