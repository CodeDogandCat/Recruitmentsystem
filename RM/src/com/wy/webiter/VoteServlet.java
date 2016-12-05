package com.wy.webiter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.wy.dao.VoteDao;
import com.wy.form.VoteForm;

public class VoteServlet extends HttpServlet {
	private VoteDao voteDao = null;
	private int method;

	public VoteServlet() {
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		method = Integer.parseInt(request.getParameter("method"));
		if (method == 0) {
			addVote(request, response);
		}
		if (method == 1) {
			deleteVote(request, response);
		}
		if (method == 2) {
			updateVote(request, response);
		}
	}

	public void deleteVote(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		VoteForm voteForm = new VoteForm();
		voteDao = new VoteDao();
		voteForm.setId(Integer.valueOf(request.getParameter("id")));
		if (voteDao.operationVote("删除", voteForm)) {
			out.print("<script language=javascript>alert('删除此简历成功，请重新进行查询！');window.location.href='back_VoteSelect.jsp';</script>");
		} else {
			out.print("<script language=javascript>alert('删除此简历失败！');history.go(-1);</script>");
		}
	}

	public void addVote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VoteForm form = new VoteForm();
		voteDao = new VoteDao();
		SmartUpload su = new SmartUpload();

		Integer maxID = Integer.valueOf(0);
		if (voteDao.MaxQueryID() != null) {
			maxID = voteDao.MaxQueryID();
		}
		String result = "可能由于上传的照片格式和大小有问题,提交简历失败，请重新提交！";
		String type = null;
		String[] imageType = { "JPG", "jpg", "gif", "bmp", "BMP" };

		String filedir = "file/";
		System.out.println("保存路径" + filedir);
		long maxsize = 1024 * 1024 * 5;
		try {
			su.initialize(getServletConfig(), request, response);
			su.setMaxFileSize(maxsize);
			su.upload();
			Files files = su.getFiles();
			System.out.println("files count`````````````````````````````" + files.getCount());
			for (int i = 0; i < files.getCount(); i++) {
				com.jspsmart.upload.File singlefile = files.getFile(i);
				type = singlefile.getFileExt();

				for (int ii = 0; ii < imageType.length; ii++) {
					if ((imageType[ii].equals(type)) && (!singlefile.isMissing())) {

						form.setYhbh(Integer.valueOf(su.getRequest().getParameter("yhbh")));

						form.setBmbh(Integer.valueOf(su.getRequest().getParameter("ypbm")));
						form.setZwmc(su.getRequest().getParameter("ypzw"));
						System.out.println("部门编号--职位名称：" + form.getBmbh() + form.getZwmc());
						form.setZpbh(voteDao.getZpbh(form.getBmbh(), form.getZwmc()));

						form.setXm(su.getRequest().getParameter("xm"));
						form.setXb(su.getRequest().getParameter("xb"));
						form.setLxdh(su.getRequest().getParameter("lxdh"));
						form.setSfzh(su.getRequest().getParameter("sfzh"));
						form.setCsrq(su.getRequest().getParameter("csrq"));
						form.setZzmm(su.getRequest().getParameter("zzmm"));
						form.setMz(su.getRequest().getParameter("mz"));
						form.setJg(su.getRequest().getParameter("jg"));
						form.setXl(su.getRequest().getParameter("xl"));
						form.setJsjnl(su.getRequest().getParameter("jsjnl"));
						form.setYynl(su.getRequest().getParameter("yynl"));
						form.setBysj(su.getRequest().getParameter("bysj"));
						form.setJybj(su.getRequest().getParameter("jybj"));
						form.setGzjl(su.getRequest().getParameter("gzjl"));
						form.setZwpj(su.getRequest().getParameter("zwpj"));
						form.setJlzt(0);

						filedir = filedir + maxID + "." + singlefile.getFileExt();
						form.setZplj(filedir);
						if (voteDao.operationVote("添加", form)) {
							System.out.println("文件大小-----" + singlefile.getSize());
							singlefile.saveAs(filedir, com.jspsmart.upload.SmartUpload.SAVE_VIRTUAL);
							result = "投递简历成功";
							// break;
						}
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		out.print("<script language=javascript>alert('" + result + "');window.location.href='head_main.jsp';</script>");

	}

	public void updateVote(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		VoteForm form = new VoteForm();
		voteDao = new VoteDao();
		String result = "提交审核结果失败";
		try {
			form.setId(Integer.valueOf(request.getParameter("id")));
			form.setJlzt(Integer.valueOf(request.getParameter("jlzt")));
			if (voteDao.operationVote("修改", form)) {
				result = "提交审核结果成功";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		out.print("<script language=javascript>alert('" + result
				+ "');window.location.href='back_VoteSelect.jsp';</script>");

	}

}
