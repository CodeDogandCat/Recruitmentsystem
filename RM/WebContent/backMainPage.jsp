<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link type="text/css" rel="stylesheet" href="CSS/style.css">
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

<body>
<jsp:include page="back_Top.jsp" flush="true" />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="227" valign="top" background="images/back1.gif">
		<jsp:include page="back_Left.jsp" flush="true" />   </td>
    <td width="573" valign="top" background="images/back1.gif"><table width="227" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/back1.gif"><img src="images/back_noword_03.jpg" width="573" height="25"></td>
      </tr>
    </table>
      <table width="573" border="0" cellpadding="0" cellspacing="0" background="images/back_noword_05.jpg">
        <tr>
          <td valign="middle"><table border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
            <td width="81"><a href="back_DiscussAdd.jsp"><img src="images/review.jpg" width="81" height="72"></a></td>
              <td width="140"><a href="back_DiscussAdd.jsp" class="aaaa">发布招聘信息</a><br>
			  
			    <span class="style4">这里提供最方便的方式来发布招聘信息</span></td>
              <td width="81" height="88"><a href="back_ArticleAdd.jsp" ><img src="images/article.jpg" width="81" height="72"></a></td>
              <td width="140" height="88"><a href="back_ArticleAdd.jsp" class="aaaa">发布公示信息</a><br>
			    <span class="style4">这里提供最方便的方式来发布公示信息</span></td>
              
            </tr>
            <tr>
              <td height="94"><a href="back_VoteSelect.jsp"><img src="images/liuyan.jpg" width="81" height="72"></a></td>
              <td height="94" ><a href="back_VoteSelect.jsp" class="aaaa">简历管理</a><br>
                <span class="style4">这里提供最方便的方式来管理简历</span></td>
              <td height="94"><a href="back_consumerSelect.jsp"><img src="images/account.jpg" width="81" height="72"></a></td>
              <td height="94" ><a href="back_consumerSelect.jsp" class="aaaa">用户管理</a><br>
               <span class="style4">这里提供最方便的方式来管理用户</span></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="227" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="images/back_noword_18.jpg" width="573" height="300"></td>
        </tr>
    </table></td>
  </tr>
</table>
<jsp:include page="back_Down.jsp" flush="true" />
</body>
</html>


