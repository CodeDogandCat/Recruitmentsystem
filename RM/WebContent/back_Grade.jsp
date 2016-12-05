<%@ page language="java" contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
	
<jsp:directive.page import="com.wy.form.GradeForm" />
<jsp:directive.page import="java.util.List" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="CSS/table.css" type="text/css" />
<script language="javascript" type="text/javascript"
			src="JS/validate.js"></script>
<title>成绩管理</title>

</head>
<jsp:useBean id="countTime" scope="page" class="com.wy.tool.CountTime"></jsp:useBean>
<jsp:useBean id="gradeDao" scope="page" class="com.wy.dao.GradeDao"></jsp:useBean>

<body>
<jsp:include page="back_Top.jsp" flush="true" />
		<table width="800" border="0" align="center" cellpadding="0"
			cellspacing="0" background="images/back1.gif">
			<tr>
				<td width="227" valign="top"><jsp:include page="back_Left.jsp" flush="true" />
				</td>
				<td width="573" valign="top">
					<table width="227" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<img src="images/back_noword_03.jpg" width="573" height="25">
							</td>
						</tr>
		</table>
		<br></br>
		<table class = table1>
                 <td width="70" height="30" align="center" >成绩编号</td>
                 <td width="70" height="30" align="center" >简历编号</td>
                 <td width="70" height="30" align="center" >笔试成绩</td>
                 <td width="70" height="30" align="center" >面试成绩</td>
                 <td width="100" height="30" align="center" >状态</td>
        <%List list=gradeDao.ListGrade();
            for(int i=0;i<list.size();i++)
                {
                GradeForm gradeForm =(GradeForm)list.get(i);
            %>
             <tr>
                 <td width="80" height="30" align="center" ><%=gradeForm.getCjbh()%></td>
                 <td width="80" height="30" align="center" ><%=gradeForm.getJlbh()%></td>
                 <td width="80" height="30" align="center" ><%=gradeForm.getBscj()%></td>
                 <td width="80" height="30" align="center" ><%=gradeForm.getMscj()%></td>
                 <td width="100" height="30" align="center" > <%=gradeForm.Zzzt_Result()%> </td>
                 <td><a href="back_perGrade.jsp?id=<%=gradeForm.getCjbh()%>"><input type="submit" value="修改" style="font-size:20px; width:70px; height:30px"></td>
                </tr>
            <%
                   }
            %>
      </table>
      
</body>
</html>