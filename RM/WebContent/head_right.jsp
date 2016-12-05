<%@page import="com.wy.form.LinkForm"%>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.wy.form.DiscussForm"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<style type="text/css">
<!--
.style1 {color: #663200}
-->
</style>
</head>
<%@ page language="java" import="java.util.*" %>
<%! String days[]; %>
<%
days=new String[42];
for(int i=0;i<42;i++)
{
days[i]="";
}
%>


<%
GregorianCalendar currentDay = new GregorianCalendar();
int today=currentDay.get(Calendar.DAY_OF_MONTH);
int month=currentDay.get(Calendar.MONTH);
int year= currentDay.get(Calendar.YEAR);
Calendar thisMonth=Calendar.getInstance();
thisMonth.set(Calendar.MONTH, month );
thisMonth.set(Calendar.YEAR, year );
thisMonth.setFirstDayOfWeek(Calendar.SUNDAY);
thisMonth.set(Calendar.DAY_OF_MONTH,1);
int firstIndex=thisMonth.get(Calendar.DAY_OF_WEEK)-1;
int maxIndex=thisMonth.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i=0;i<maxIndex;i++)
{
days[firstIndex+i]=String.valueOf(i+1);
}
%>

<jsp:useBean id="discussDao" scope="page" class="com.wy.dao.DiscussDao"></jsp:useBean>
<jsp:useBean id="linkDao" scope="page" class="com.wy.dao.LinkDao"></jsp:useBean>
<%
//友情链接添加
List linkList=linkDao.queryLink();
%>
<%
List discussList=discussDao.queryDiscuss();
%>
<body onselectstart="return false">


	<table width="184" height="35" border="0" cellpadding="0" cellspacing="0" background="images/head_09.jpg">
      <tr>
        <td valign="top"><table width="146" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="23" height="28">&nbsp;</td>
            <td width="123" valign="bottom"><a href="head_main.jsp" class="head-01"><strong>首页</strong></a> <span class="style5 style1"></span></td>
          </tr>
        </table></td>
      </tr>
    </table>

      <table width="184" height="29" border="0" cellpadding="0" cellspacing="0" background="images/head_12.jpg">
        <tr>
          <td valign="top"><table width="146" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="23" height="24">&nbsp;</td>
                <td width="123" valign="bottom"><a href="head_ArticleList.jsp" class="head-01"><strong>审核公示</strong></a> <span class="style5 style1"></span></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="184" height="29" border="0" cellpadding="0" cellspacing="0" background="images/head_13.jpg">
        <tr>
          <td valign="top"><table width="146" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="23" height="24">&nbsp;</td>
                <td width="123" valign="bottom"><a href="head_disussList.jsp" class="head-01"><strong>招聘信息</strong></a> <span class="style5 style1"></span></td>
              </tr>
          </table></td>
        </tr>
      </table>
 
  
     
      <table width="184" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/head_16.jpg" width="184" height="16"></td>
        </tr>
        <tr>
          <td><img src="images/head_17.jpg" width="184" height="17"></td>
        </tr>
      </table>
      <table width="184" height="179" border="0" cellpadding="0" cellspacing="0" background="images/head_18.jpg" bgcolor="#FAFAFA">
        <tr>
          <td>
            <table width="180" height="81" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="CBB180">
              <tr bgcolor="FFFCF1">
                <td height="15" colspan="7" align="center"><%=year%>年<%=month+1%>月</td>
              </tr>
              <tr bgcolor="C9B65A">
                <td width="25" height="15" ><font color="red">日</font> </td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">一</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">二</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">三</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">四</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><strong><font color="#FFFFFF">五</font></strong></td>
                <td width="25" height="16" bgcolor="C9B65A"><font color="red">六</font></td>
              </tr>
              <% for(int j=0;j<6;j++) { %>
              <tr bgcolor="FFFCF1">
                <% for(int i=j*7;i<(j+1)*7;i++) { %>
                <td width="25" height="15" align="center" valign="middle">
                  <%if((i-firstIndex+1)==today){
%>
                  <b> <font color="red"><%=days[i]%></font></b>
                  <%
} else {
%>
                  <%=days[i]%>
                  <%
}
%></td>
                <% } %>
              </tr>
              <% } %>
          </table></td>
        </tr>
</table>
      <table width="184" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/head_19.jpg" width="184" height="27"></td>
        </tr>
      </table>
      <table width="184" height="158" border="0" cellpadding="0" cellspacing="0" bgcolor="#FAFAFA">
        <tr>
          <td valign="top">
		  <br>
		  <table width="93%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <%
           int discussNumber=discussList.size();
           if(discussNumber>10){
           discussNumber=9;
           }
            for(int i=0;i<discussNumber;i++){
            DiscussForm discussForm=(DiscussForm)discussList.get(i);
            String title=discussForm.getZwmc()+"   "+discussForm.getCnyx()+"元/月";
//             if(title.length()>9){
//             title=title.substring(0,9)+"......";
//              }
             %>
            <tr>
              <td width="9%" height="22"><img src="images/front_17.jpg" width="7" height="7"></td>
              <td width="91%"><a href="head_disussForm.jsp?id=<%=discussForm.getId()%>" title="请查看详细内容"><%=title%></a></td>
            </tr>
            <%}%>
			
		
          </table>
		  <table width="174" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="9%" height="22"><img src="images/front_17.jpg" width="7" height="7"></td>
              <td><div align="left"><a href="head_disussList.jsp">更多...</a></div></td>
            </tr>
          </table>		  </td>
        </tr>
</table>
      <table width="184" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/head_21.jpg" width="184" height="33"></td>
        </tr>
      </table>
      <table width="184" height="106" border="0" cellpadding="0" cellspacing="0" background="images/head_22.jpg">
        <tr>
          <td><table width="135" height="30" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="10">&nbsp;</td>
              <td width="125">
              <a href="head_VoteAdd.jsp"><img src="images/liuyan2.jpg" width="80" height="50"></a>
              </td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="184" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/head_23.jpg" width="184" height="34"></td>
        </tr>
      </table>
      <table width="184" height="96" border="0" cellpadding="0" cellspacing="0" background="images/head_24.jpg">
        <tr>
          <td><table width="68%" height="24"  border="0" align="center" cellpadding="0" cellspacing="0">
            <%for(int pageNumber=0;pageNumber<linkList.size();pageNumber++){
            	LinkForm linkForm=(LinkForm)linkList.get(pageNumber);
            	String name=linkForm.getName();
            	String url=linkForm.getUrl();

            %>
            <tr>
              <td width="16%" height="22"><img src="images/front_19.jpg" width="10" height="9"></td>
              <td width="56%"><a href=<%=url%> title="请单击"><%=name%> </a></td>
              <td width="28%">&nbsp;</td>
            </tr>
            <%}%>
          </table></td>
        </tr>
      </table>






</body>
</html>
