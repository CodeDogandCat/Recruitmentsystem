/*     */package com.wy.webiter;

/*     */
/*     *//*     */import java.io.IOException;
/*     */
import java.io.PrintWriter;

/*     */
import javax.servlet.RequestDispatcher;
/*     */
import javax.servlet.ServletException;
/*     */
import javax.servlet.http.HttpServlet;
/*     */
import javax.servlet.http.HttpServletRequest;
/*     */
import javax.servlet.http.HttpServletResponse;

import com.wy.dao.LinkDao;
/*     */
import com.wy.form.LinkForm;
/*     */
import com.wy.tool.Chinese;

/*     */
/*     */
/*     */
/*     */
/*     */
/*     */
/*     */public class LinkServlet
/*     */extends HttpServlet
/*     */{
	/*     */private static final long serialVersionUID = 1L;
	/* 23 */private LinkDao linkDao = null;
	/*     */private int method;

	/*     */
	/*     */public LinkServlet() {
	}

	/*     */
	/*     */@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	/*     */{
		/* 30 */method = Integer.parseInt(request.getParameter("method"));
		/* 31 */if (method == 0) {
			/* 32 */addLink(request, response);
			/*     */}
		/* 34 */if (method == 1) {
			/* 35 */deleteLink(request, response);
			/*     */}
		/* 37 */if (method == 2) {
			/* 38 */queryLinkForm(request, response);
			/*     */}
		/* 40 */if (method == 3) {
			/* 41 */updateLink(request, response);
			/*     */}
		/*     */}

	/*     */
	/*     */
	/*     */public void updateLink(HttpServletRequest request, HttpServletResponse response)
	/*     */throws ServletException, IOException
	/*     */{
		/* 49 */response.setContentType("text/html;charset=GBK");
		/* 50 */PrintWriter out = response.getWriter();
		/* 51 */linkDao = new LinkDao();
		/* 52 */LinkForm friendForm = new LinkForm();
		/* 53 */friendForm.setId(Integer.valueOf(request.getParameter("id")));
		/* 54 */friendForm.setName(Chinese.toChinese(request.getParameter("name")));
		/* 55 */friendForm.setUrl(request.getParameter("url"));
		/*     */
		/* 57 */if (linkDao.updateLink(friendForm)) {
			/* 58 */out
					.print("<script language=javascript>alert('修改此友情链接成功，请重新进行查询！');window.location.href='back_LinkSelect.jsp';</script>");
			/*     */} else {
			/* 60 */out.print("<script language=javascript>alert('修改友情链接失败！');history.go(-1);</script>");
			/*     */}
		/*     */}

	/*     */
	/*     */
	/*     */public void queryLinkForm(HttpServletRequest request, HttpServletResponse response)
	/*     */throws ServletException, IOException
	/*     */{
		/* 68 */linkDao = new LinkDao();
		/* 69 */request.setAttribute("form",
		/* 70 */linkDao.queryLinkForm(request.getParameter("id")));
		/*     */
		/* 72 */RequestDispatcher requestDispatcher = request
		/* 73 */.getRequestDispatcher("back_LinkUpdate.jsp");
		/* 74 */requestDispatcher.forward(request, response);
		/*     */}

	/*     */
	/*     */
	/*     */public void deleteLink(HttpServletRequest request, HttpServletResponse response)
	/*     */throws IOException, ServletException
	/*     */{
		/* 81 */response.setContentType("text/html;charset=GBK");
		/* 82 */PrintWriter out = response.getWriter();
		/* 83 */linkDao = new LinkDao();
		/* 84 */Integer id = Integer.valueOf(request.getParameter("id"));
		/*     */
		/* 86 */if (linkDao.deleteLink(id)) {
			/* 87 */out
					.print("<script language=javascript>alert('删除此友情链接成功，请重新进行查询！');window.location.href='back_LinkSelect.jsp';</script>");
			/*     */} else {
			/* 89 */out.print("<script language=javascript>alert('删除友情链接失败！');history.go(-1);</script>");
			/*     */}
		/*     */}

	/*     */
	/*     */
	/*     */public void addLink(HttpServletRequest request, HttpServletResponse response)
	/*     */throws IOException, ServletException
	/*     */{
		/* 97 */linkDao = new LinkDao();
		/* 98 */LinkForm friendForm = new LinkForm();
		/* 99 */friendForm.setName(Chinese.toChinese(request.getParameter("name")));
		/* 100 */friendForm.setUrl(Chinese.toChinese(request.getParameter("url")));
		/*     */
		/* 102 */String result = "添加友情链接失败！";
		/* 103 */if (linkDao.addLink(friendForm)) {
			/* 104 */result = "添加友情链接成功！";
			/*     */}
		/* 106 */request.setAttribute("result", result);
		/*     */
		/* 108 */RequestDispatcher requestDispatcher = request
		/* 109 */.getRequestDispatcher("back_LinkAdd.jsp");
		/* 110 */requestDispatcher.forward(request, response);
		/*     */}

	/*     */
	/*     */
	/*     */@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	/*     */throws ServletException, IOException
	/*     */{
		/* 117 */doGet(request, response);
		/*     */}
	/*     */
}

/*
 * Location: D:\workspace\javaee\Blog\WebContent\WEB-INF\classes Qualified Name:
 * com.wy.webiter.LinkServlet Java Class Version: 7 (51.0) JD-Core Version:
 * 0.7.1
 */