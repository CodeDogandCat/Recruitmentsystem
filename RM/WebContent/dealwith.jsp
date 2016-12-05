<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<%
	Integer sign = Integer.valueOf(request.getParameter("sign"));
	if (sign == 0) {
		if (request.getAttribute("information") != null) {
			String information = (String) request
			.getAttribute("information");
			out.print("<script language=javascript>alert('"
			+ information + "');history.go(-1);</script>");
		} else {
			session.setAttribute("form", request.getAttribute("form"));
			out
			.print("<script language=javascript>alert('用户登录成功！');window.location.href='head_main.jsp';</script>");
		}
	}
	if (sign == 1) {
		String result = (String) request.getAttribute("result");
		if (result.equals("success")) {
			session.setAttribute("form", request.getAttribute("form"));
			out
			.print("<script language=javascript>alert('用户注册成功！');window.location.href='head_main.jsp';</script>");
		}
		if (result.equals("fail")) {
			out
			.print("<script language=javascript>alert('用户注册失败！');history.go(-1);</script>");
		}
	}

	if (sign == 2) {
		session.invalidate();
		response.sendRedirect("index.jsp");
	}
	if (sign == 3) {
		

	}

	if (sign == 4) {
	}
%>
