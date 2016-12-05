package com.wy.webiter;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.wy.dao.ConsumerDao;
import com.wy.form.ConsumerForm;
import com.wy.tool.Chinese;
import com.wy.tool.StrMD5;

public class ConsumerServlet extends HttpServlet {
	private ConsumerDao consumerDao = null;
	private int method;

	/*     */public ConsumerServlet() {
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	/*     */@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 24 */method = Integer.parseInt(request.getParameter("method"));
		/* 25 */if (method == 0) {
			/* 26 */checkConsumer(request, response);
			/*     */}
		/* 28 */if (method == 1) {
			/* 29 */registerConsumer(request, response);
			/*     */}
		/* 31 */if (method == 2) {
			/* 32 */queryConsumerForm(request, response);
			/*     */}
		/* 34 */if (method == 3) {
			/* 35 */deleteConsumerForm(request, response);
			/*     */}
		/* 37 */if (method == 4) {
			/* 38 */queryConsumerHostForm(request, response);
			/*     */}
		/* 40 */if (method == 5) {
			/* 41 */updateConsumerHostForm(request, response);
			/*     */}
		/* 43 */if (method == 6) {
			/* 44 */front_updateConsumerForm(request, response);
			/*     */}
		/*     */}

	/*     */public void front_updateConsumerForm(HttpServletRequest request, HttpServletResponse response)
	/*     */throws ServletException, IOException
	/*     */{
		/* 52 */response.setContentType("text/html;charset=GBK");
		/* 53 */PrintWriter out = response.getWriter();
		/* 54 */ConsumerForm form = new ConsumerForm();
		/* 55 */consumerDao = new ConsumerDao();
		/* 56 */form.setAccount(Chinese.toChinese(request.getParameter("account")));
		/* 57 */form.setPassword(Chinese.toChinese(request.getParameter("password")));
		/* 63 */form.setId(Integer.valueOf(request.getParameter("id")));
		/* 64 */form.setEMail(request.getParameter("eMail"));
		/* 65 */if (consumerDao.front_updateConsumerForm(form)) {
			/* 66 */out
					.print("<script language=javascript>alert('修改用户成功，请重新登录！');window.location.href='dealwith.jsp?sign=2';</script>");
			/*     */} else {
			/* 68 */out.print("<script language=javascript>alert('修改用户信息失败！');history.go(-1);</script>");
			/*     */}
		/*     */}

	/*     */public void updateConsumerHostForm(HttpServletRequest request, HttpServletResponse response)
	/*     */throws ServletException, IOException
	/*     */{
		/* 76 */request.setCharacterEncoding("gb2312");
		/* 77 */ConsumerForm form = new ConsumerForm();
		/* 78 */consumerDao = new ConsumerDao();
		/* 79 */form.setAccount(Chinese.toChinese(request.getParameter("account")));
		/* 80 */form.setPassword(Chinese.toChinese(request.getParameter("password")));
		/* 86 */form.setEMail(request.getParameter("eMail"));
		/* 87 */form.setManageLevel("高级");
		/* 88 */String result = "修改管理员信息失败！";
		/*     */
		/* 90 */if (consumerDao.updateConsumerForm(form)) {
			/* 91 */result = "修改管理员信息成功！";
			/*     */}
		/*     */
		/* 94 */request.setAttribute("result", result);
		/* 95 */request.setAttribute("form",
		/* 96 */consumerDao.getConsumerForm(form.getAccount()));
		/*     */
		/* 98 */RequestDispatcher requestDispatcher = request
		/* 99 */.getRequestDispatcher("back_consumerSelectHostForm.jsp");
		/* 100 */requestDispatcher.forward(request, response);
		/*     */}

	/*     */public void deleteConsumerForm(HttpServletRequest request, HttpServletResponse response)
	/*     */throws ServletException, IOException
	/*     */{
		/* 106 */response.setContentType("text/html;charset=GBK");
		/* 107 */String account = Chinese.toChinese(request.getParameter("account"));
		/* 108 */consumerDao = new ConsumerDao();
		/* 109 */PrintWriter out = response.getWriter();
		/* 110 */if (consumerDao.deleteConsumerForm(account)) {
			/* 111 */out
					.print("<script language=javascript>alert('删除此用户成功，请重新进行查询！');window.location.href='back_consumerSelect.jsp';</script>");
			/*     */} else {
			/* 113 */out.print("<script language=javascript>alert('删除用户信息失败！');history.go(-1);</script>");
			/*     */}
		/*     */}

	/*     */public void queryConsumerHostForm(HttpServletRequest request, HttpServletResponse response)
	/*     */throws ServletException, IOException
	/*     */{
		/* 121 */consumerDao = new ConsumerDao();
		/* 122 */request.setAttribute("form", consumerDao.getConsumerForm("sysadmin"));
		/* 123 */RequestDispatcher requestDispatcher = request
		/* 124 */.getRequestDispatcher("back_consumerSelectHostForm.jsp");
		/* 125 */requestDispatcher.forward(request, response);
		/*     */}

	/*     */public void queryConsumerForm(HttpServletRequest request, HttpServletResponse response)
	/*     */throws ServletException, IOException
	/*     */{
		/* 132 */consumerDao = new ConsumerDao();
		/* 133 */String account = Chinese.toChinese(request.getParameter("account"));
		/* 134 */request.setAttribute("form", consumerDao.getConsumerForm(account));
		/* 135 */RequestDispatcher requestDispatcher = request
		/* 136 */.getRequestDispatcher("back_consumerSelectForm.jsp");
		/* 137 */requestDispatcher.forward(request, response);
		/*     */}

	/*     */public void registerConsumer(HttpServletRequest request, HttpServletResponse response)
	/*     */throws ServletException, IOException
	/*     */{
		/* 143 */request.setCharacterEncoding("gb2312");
		/* 144 */ConsumerForm form = new ConsumerForm();
		/* 145 */consumerDao = new ConsumerDao();
		/* 146 */form.setAccount(Chinese.toChinese(request.getParameter("account")));
		/* 147 */form.setPassword(Chinese.toChinese(request.getParameter("password")));
		/* 153 */form.setEMail(request.getParameter("eMail"));
		/* 154 */form.setManageLevel("普通");
		/* 155 */String result = "fail";
		/* 156 */if ((consumerDao.getConsumerForm(form.getAccount()) == null) &&
		/* 157 */(consumerDao.addConsumerForm(form))) {
			/* 158 */request.setAttribute("form",
			/* 159 */consumerDao.getConsumerForm(form.getAccount()));
			/* 160 */result = "success";
			/*     */}
		/*     */
		/* 163 */request.setAttribute("result", result);
		/* 164 */RequestDispatcher requestDispatcher = request
		/* 165 */.getRequestDispatcher("dealwith.jsp");
		/* 166 */requestDispatcher.forward(request, response);
		/*     */}

	/*     */public void checkConsumer(HttpServletRequest request, HttpServletResponse response)
	/*     */throws ServletException, IOException
	/*     */{
		/* 172 */request.setCharacterEncoding("gb2312");
		/* 173 */String account = request.getParameter("account");
		/* 174 */consumerDao = new ConsumerDao();
		/* 175 */ConsumerForm consumerForm = consumerDao.getConsumerForm(account);
		/* 176 */if (consumerForm == null) {
			/* 177 */request.setAttribute("information", "您输入的用户名不存在，请重新输入！");
			/*     */}
		/* 179 */else if (!consumerForm.getPassword().equals(StrMD5.MD5(request.getParameter("password")))) {
			/* 180 */request.setAttribute("information", "您输入的登录密码有误，请重新输入！");
			/*     */}
		/*     */else {
			/* 183 */request.setAttribute("form", consumerForm);
			/*     */}
		/* 185 */RequestDispatcher requestDispatcher = request
		/* 186 */.getRequestDispatcher("dealwith.jsp");
		/* 187 */requestDispatcher.forward(request, response);
		/*     */}

}
