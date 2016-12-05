<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:directive.page import="com.wy.form.VoteForm" />
<jsp:directive.page import="java.util.List" />
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link type="text/css" rel="stylesheet" href="CSS/style.css">
		<script language="javascript" type="text/javascript"
			src="JS/validate.js"></script>
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
	<jsp:useBean id="countTime" scope="page" class="com.wy.tool.CountTime"></jsp:useBean>
	<jsp:useBean id="voteDao" scope="page" class="com.wy.dao.VoteDao"></jsp:useBean>
	<%
VoteForm voteForm=voteDao.queryVote(Integer.valueOf(request.getParameter("id")));
%>





	<body>
		<jsp:include page="back_Top.jsp" flush="true" />
		<table width="800" border="0" align="center" cellpadding="0"
			cellspacing="0" background="images/back1.gif">
			<tr>
<%-- 				<td width="227" valign="top">=<jsp:include page="back_Left.jsp" flush="true" /> --%>
<!-- 				</td> -->
				<td width="573" valign="top">
					<table width="227" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<img src="images/back_noword_03.jpg" width="573" height="25">
							</td>
						</tr>
					</table>
		
		
		
		<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="74"><img src="images/head_06.jpg" width="74" height="846"></td>
    <td height="846" valign="top" background="images/head_07.jpg" width="407">

		<%out.println("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;简历审核</p>");%><br>
		<form name="form" method="post" action="VoteServlet?method=2" onSubmit="return voteAdd()" >

         <table width="650" border="1">
    <tr>
      <td width="83"><div align="center">姓名</div></td>
      <td width="178"><label>
        <input name="xm" type="text" id="xm" readonly="readonly" value="<%=voteForm.getXm()%>"/>
        <input name="yhbh" type="hidden" id="yhbh"  value="<%=voteForm.getYhbh() %>" />
        <input name="id" type="hidden" id="id" value="<%=voteForm.getId() %>"/>
      </label></td>
      
      <td width="68"><div align="center">性别</div></td>
      <td width="176"><label>
        <input name="xb" type="text" id="xb" readonly="readonly" value="<%=voteForm.getXb() %>"/>
      </label></td>
      
      
      
      <td width="120" rowspan="7">
      
 <div align="right" id="preview"></div>  
 <img alt="证件照" width="117" height="156" src="<%=voteForm.getZplj() %>">
    </td>
    
    
    
    </tr>
    <tr>
      <td><div align="center">身份证号</div></td>
      <td><label>
      <input name="sfzh" type="text" id="sfzh" readonly="readonly" value="<%=voteForm.getSfzh() %>"/>
      </label></td>
      <td><div align="center">民族</div></td>
      <td><label>
      <input name="mz" type="text" id="mz" readonly="readonly" value="<%=voteForm.getMz() %>"/>
       
      </label></td>
    </tr>
    <tr>
    
      <td><div align="center">出生日期</div></td>
      <td>
      <input name="csrq" type="text" id="csrq" readonly="readonly" value="<%=voteForm.getCsrq().substring(0,10) %>"/>
     
     
      <td><div align="center">政治面貌</div></td>
      <td><label>
      <input name="zzmm" type="text" id="zzmm" readonly="readonly" value="<%=voteForm.getZzmm() %>"/>
       
      </label></td>
    </tr>
    <tr>
      <td><div align="center">籍贯</div></td>
      <td><label>
      <input name="jg" type="text" id="jg" readonly="readonly" value="<%=voteForm.getJg() %>"/>
      </label></td>
      <td><div align="center">毕业时间</div></td>
      <td>
      <input name="bysj" type="text" id="bysj" readonly="readonly" value="<%=voteForm.getBysj().substring(0,10) %>"/>
	  
	  </td>
    </tr>
    <tr>
      <td><div align="center">计算机能力</div></td>
      <td><label>
      <input name="jsjnl" type="text" id="jsjnl" readonly="readonly" value="<%=voteForm.getJsjnl() %>"/>
       
      </label></td>
      <td><div align="center">英语能力</div></td>
      <td><label>
      <input name="yynl" type="text" id="yynl" readonly="readonly" value="<%=voteForm.getYynl() %>"/>
      </label></td>
    </tr>
    <tr>
      <td><div align="center">学历</div></td>
      <td><label>
      <input name="xl" type="text" id="xl" readonly="readonly" value="<%=voteForm.getXl() %>"/>
      </label></td>
      <td><div align="center">联系电话</div></td>
      <td><label>
      <input name="lxdh" type="text" id="lxdh" readonly="readonly" value="<%=voteForm.getLxdh() %>"/>
      </label></td>
    </tr>
    <tr>
      <td><div align="center">应聘部门</div></td>
      <td><label>
      <input name="ypbm" type="text" id="ypbm" readonly="readonly" value="<%=voteForm.getBmmc() %>"/>
      </label></td>
       <td><div align="center">应聘职位</div></td>
      <td><label>
      <input name="ypzw" type="text" id="ypzw" readonly="readonly" value="<%=voteForm.getZwmc() %>"/>
      </label></td>
    </tr>
    <tr>
      <td height="181"><div align="center">教育背景</div></td>
      <td colspan="4"><label>
        <textarea name="jybj" cols="90" rows="13" id="jybj" readonly="readonly"><%=voteForm.getJybj() %></textarea>
      </label></td>
    </tr>
    <tr>
      <td height="197"><div align="center">工作经历</div></td>
      <td colspan="4"><label>
        <textarea name="gzjl" cols="90" rows="14" id="gzjl" readonly="readonly"><%=voteForm.getGzjl() %></textarea>
      </label></td>
    </tr>
    <tr>
      <td height="198"><div align="center">自我评价</div></td>
      <td colspan="4"><label>
        <textarea name="zwpj" cols="90" rows="14" id="zwpj" readonly="readonly"><%=voteForm.getZwpj() %></textarea>
      </label></td>
    </tr>
    <tr>
      <td height="50"><div align="center">审核结果</div></td>
      <td ><label><input width="100" name="jlzt" type="radio" value="1" />通过</label> </td>
          <td><label><input width="100" name="jlzt" type="radio" value="2" />不通过 </label> </td>
          
       
    </tr>
  </table>
  <p>&nbsp;</p>
        
        <br>		
          <div align="center">
              <input type="image" class="inputinputinput" src="images/vote.jpg" width="51" height="20">
&nbsp;&nbsp;
   <a href="#" onclick="javascript:history.go(-1);"><img src="images/back.gif"></a>
          </div>
		        </form>	        
		        <% %>
</td>

  </tr>
</table>
		
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
