<table width="227" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/back_noword_19.jpg" width="800" height="56"></td>
  </tr>
</table>
<%
if(session.getAttribute("form")==null){
  out.print("<script language=javascript>alert('您已经与服务器断开，请重新登录！！！');window.location.href='index.jsp';</script>");
}
%>