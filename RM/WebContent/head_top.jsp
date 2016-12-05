<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<style type="text/css">
<!--
.style1 {color: #c97802}
.style2 {color: #976600}
-->
</style>
</head>



<%
//判断服务器form是否存在
if(session.getAttribute("form")==null){
out.print("<script language=javascript>alert('您已经与服务器断开，请重新登录！');window.location.href='index.jsp';</script>");
}
//网页计数器
Integer number=1;
if(application.getAttribute("number")!=null){
  number=(Integer)application.getAttribute("number");
  number++;
}
application.setAttribute("number",number);
//博主信息
com.wy.dao.ConsumerDao consumerDao=new com.wy.dao.ConsumerDao();
com.wy.form.ConsumerForm consumerForm1=(com.wy.form.ConsumerForm)session.getAttribute("form");
java.util.List consumerlist=consumerDao.getConsumerList("高级");
//万年日历的应用
%>


<script language="javascript" src="JS/validate.js"></script>
<body>



<!--页面头部分1-->
<!--页面头部分2-->
<!--页面头部分3-->
<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/head_03.jpg" width="800"></td>
  </tr>
</table>
<!--页面头部分4-->
<table width="800" height="71" border="0" align="center" cellpadding="0" cellspacing="0" background="images/head_04.jpg">
  <tr>
    <td width="31">&nbsp;</td>
    <td width="640"><table width="619" border="0" align="center" cellpadding="0" cellspacing="0">
      <%
        for(int host=0;host<consumerlist.size();host++){
        com.wy.form.ConsumerForm consumerHostForm=(com.wy.form.ConsumerForm)consumerlist.get(host);
         %>
      <tr>
        <td  height="20"><span class="style1">用户信息&nbsp;【<a href="dealwith.jsp?sign=2">退出</a>】</span></td>
        <td colspan="2">
          <%if(consumerForm1.getManageLevel().equals("高级")){%>
          <div align="right"><span class="style2">【</span><a href="backMainPage.jsp" class="in">进入后台</a><span class="style2">】</span></div>
           <tr>
        <td height="20" ><span class="style3 style2">用户名：<%=consumerHostForm.getAccount()%></span></td>
      </tr>
      <tr>
        <td><span class="style3 style2">邮箱：<%=consumerHostForm.getEMail()%></span></td>
      </tr>
          
          <%}%>
        </td>
      </tr>
     
      <%} %>
    </table></td>
    <td width="129">&nbsp;</td>
  </tr>
</table>
<!--页面头部分5-->
<table width="800" height="26" border="0" align="center" cellpadding="0" cellspacing="0" background="images/head_05.jpg">
  <tr>
    <td width="37">&nbsp;</td>
    <td width="626">
	         <marquee direction="left"  scrollAmount="1" scrollDelay="1" class="tdtd">
            <span class="style4 style1">欢迎使用xx招聘管理系统</span>
      </marquee>	</td>
    <td width="137">&nbsp;</td>
  </tr>
</table>















</body>
</html>
