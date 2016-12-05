<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.form.VoteForm"/>
<jsp:directive.page import="com.wy.form.ArticleTypeForm"/>
<jsp:useBean id="articleTypeDao" scope="request" class="com.wy.dao.ArticleTypeDao"></jsp:useBean>
<jsp:useBean id="discussDao" scope="request" class="com.wy.dao.DiscussDao"></jsp:useBean>
<jsp:useBean id="voteDao" class="com.wy.dao.VoteDao" scope="page"></jsp:useBean>
<jsp:useBean id="countTime" scope="page" class="com.wy.tool.CountTime"></jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" type="text/css"  rel="stylesheet">
<title>前台-投简历</title>
<%@ page language="java" import="java.util.*" %>
<script src="KingCalendar/jquery_1_7.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript" src="KingCalendar/King-Calendar.js" language="javascript"></script>
<script type="text/javascript">    
 function preview(file)  
 {  
	 var prevDiv = document.getElementById('preview');  
	 if (file.files && file.files[0])  
	 {  
		 var reader = new FileReader();  
		 reader.onload = function(evt)
		 {  
		 prevDiv.innerHTML = '<img  id="red" src="' + evt.target.result + '" />';  
		 }    
	 	 reader.readAsDataURL(file.files[0]);  
	 }  
	 else    
	 {  
	 	prevDiv.innerHTML = '<div id="red1" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';  
	 }  
 }  
 </script>
<% List list1=articleTypeDao.queryArticleType(); %>
 <script type="text/javascript">    
 function select1changed(locationid)  
 {  
	 
	  document.getElementById("ypzw").length   =   0;   //初始化下拉列表   清空下拉数据     
	  document.getElementById("ypzw").options[0]   =   new   Option('==请选择==','');  //给第一个值  
	 var list2=<%=list1 %>;
	   
		 for(i =0;i<list2.size();i++){
			document.getElementById("ypzw").options.add(new Option(i,2));          
		 }
		
	  
	
 }  
 </script>
<style type="text/css">  
 #red
 {  
 width:117px;  
 height:156px;  
 } 
  #red1
 {  
 width:117px;  
 height:156px;  
 } 
 #preview
 {  
 width:117px;  
 height:156px;  
 }  
 #preview  
 {  
border:1px solid #000;  
}  
 </style> 

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
</style>
</head>

<body>

<!--网页头部分-->
<jsp:include page="head_top.jsp" flush="true" />
<%@page import="com.wy.form.ConsumerForm"%>

<%
ConsumerForm consumerFormPT=(ConsumerForm)session.getAttribute("form");
%>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="74"><img src="images/head_06.jpg" width="74" height="846"></td>
    <td height="846" valign="top" background="images/head_07.jpg" width="407">

		<%out.println("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;用户进行投简历</p>");%><br>
		<form name="form" method="post" action="VoteServlet?method=0" onSubmit="return voteAdd()" enctype="multipart/form-data">

         <table width="650" border="1">
    <tr>
      <td width="83"><div align="center">姓名</div></td>
      <td width="178"><label>
        <input name="xm" type="text" id="xm" />
        <input name="yhbh" type="hidden" id="yhbh" value=<%=consumerFormPT.getId()%> />
      </label></td>
      
      <td width="68"><div align="center">性别</div></td>
      <td width="176"><label>
        <select name="xb" id="xb">
        <option>==请选择==</option>
          <option>男</option>
          <option>女</option>
          <option>其他</option>
        </select>
      </label></td>
      
      
      
      <td width="120" rowspan="7">
      
 <div align="right" id="preview"></div>  
 <input name="photo" style="width:70px; height:20px;" type="file" onchange="preview(this)" size="1" />
    </td>
    
    
    
    </tr>
    <tr>
      <td><div align="center">身份证号</div></td>
      <td><label>
        <input name="sfzh" type="text" id="sfzh" />
      </label></td>
      <td><div align="center">民族</div></td>
      <td><label>
        <select name="mz" id="mz">
        <option>==请选择==</option>
          <option>汉族</option>
          <option>壮族</option>
          <option>回族</option>
          <option>满族</option>
          <option>维吾尔族</option>
          <option>苗族</option>
          <option>彝族</option>
          <option>土家族</option>
          <option>藏族</option>
          <option>蒙古族</option>
          <option>其他</option>
        </select>
      </label></td>
    </tr>
    <tr>
    
      <td><div align="center">出生日期</div></td>
      <td><input name="csrq" id="csrq"  type="text" onFocus="StartCalendar({id:'csrq',lunarShow:true});" value="==请选择==" size="24" id="csrq" ></td>
     
     
      <td><div align="center">政治面貌</div></td>
      <td><label>
        <select name="zzmm" id="zzmm">
        <option>==请选择==</option>
          <option>群众</option>
          <option>党员</option>
          <option>其他</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td><div align="center">籍贯</div></td>
      <td><label>
        <input name="jg" type="text" id="jg" />
      </label></td>
      <td><div align="center">毕业时间</div></td>
      <td><input name="bysj" type="text" id="bysj"  onFocus="StartCalendar({id:'bysj',lunarShow:true});" value="==请选择==" size="24"></td>
	  
	  
	  </td>
    </tr>
    <tr>
      <td><div align="center">计算机能力</div></td>
      <td><label>
        <select name="jsjnl" id="jsjnl">
          <option>==请选择==</option>
          <option>1级</option>
          <option>2级</option>
          <option>3级</option>
          <option>4级</option>
          <option>5级</option>
          <option>6级</option>
          <option>其他</option>
        </select>
      </label></td>
      <td><div align="center">英语能力</div></td>
      <td><label>
        <select name="yynl" id="yynl">
        <option>==请选择==</option>
          <option>4级</option>
          <option>6级</option>
          <option>其他</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td><div align="center">学历</div></td>
      <td><label>
        <select name="xl" id="xl">
        <option>==请选择==</option>
          <option>本科</option>
          <option>硕士</option>
          <option>博士</option>
          <option>其他</option>
        </select>
      </label></td>
      <td><div align="center">联系电话</div></td>
      <td><label>
        <input name="lxdh" type="text" id="lxdh" />
      </label></td>
    </tr>
    <tr>
      <td><div align="center">应聘部门</div></td>
      <td><label>
        <select name="ypbm" id="ypbm" ">
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
       <td><div align="center">应聘职位</div></td>
      <td><label>
        <select name="ypzw" id="ypzw">
        <option>==请选择==</option>
        <option>开发人员</option>
        <option>测试人员</option>
        <option>分析师</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td height="181"><div align="center">教育背景</div></td>
      <td colspan="4"><label>
        <textarea name="jybj" cols="90" rows="13" id="jybj"></textarea>
      </label></td>
    </tr>
    <tr>
      <td height="197"><div align="center">工作经历</div></td>
      <td colspan="4"><label>
        <textarea name="gzjl" cols="90" rows="14" id="gzjl"></textarea>
      </label></td>
    </tr>
    <tr>
      <td height="198"><div align="center">自我评价</div></td>
      <td colspan="4"><label>
        <textarea name="zwpj" cols="90" rows="14" id="zwpj"></textarea>
      </label></td>
    </tr>
  </table>
  <p>&nbsp;</p>
        
        <br>		
          <div align="center">
              <input type="image" class="inputinputinput" src="images/vote.jpg" width="51" height="20">
&nbsp;&nbsp;
   <a href="#" onClick="javascript:form.reset()"><img src="images/reset.gif"></a>&nbsp;&nbsp;
   <a href="#" onclick="javascript:history.go(-1);"><img src="images/back.gif"></a>
          </div>
		        </form>	        
		        <% %>
</td>
<!--     <td width="10"><img src="images/head_08.jpg" width="13" height="846"></td> -->
<!--     <td width="184" valign="top"> -->

<%-- 	  	<jsp:include page="head_right.jsp" flush="true" /> --%>
  
<!--     </td> -->
<!--     <td width="122"><img src="images/head_10.jpg" width="122" height="846"></td> -->
  </tr>
</table>
<!--网页尾部分-->
<jsp:include page="head_down.jsp" flush="true" />




</body>
</html>
