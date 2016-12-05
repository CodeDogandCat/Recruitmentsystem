package com.wy.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wy.form.ArticleForm;
import com.wy.tool.JDBConnection;

public class ArticleDao {
	private JDBConnection connection = null;

	private ArticleForm articleForm = null;

	public ArticleDao() {
		connection = new JDBConnection();
	}

	public int getZpbh(int bmbh, String zwmc) {
		int zpbh = 0;
		String sql = "select zpbh from tb_zpzw where bmbh='" + bmbh + "' and  zwmc ='" + zwmc + "'";
		ResultSet rs = connection.executeQuery(sql);
		try {
			rs.next();
			zpbh = rs.getInt("zpbh");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return zpbh;

	}

	/*    */
	public boolean operationArticle(String operation, ArticleForm form) {
		boolean flag = false;
		String sql = null;
		if (operation.equals("添加"))
			sql = "insert into tb_gs values ('" + form.getZpbh() + "','" + form.getGslx() + "','" + form.getKssj()
					+ "','" + form.getKsdd() + "','" + form.getXxxx() + "')";
		if (operation.equals("修改"))
			sql = "update tb_gs set zpbh='" + form.getZpbh() + "',gslx='" + form.getGslx() + "',kssj='"
					+ form.getKssj() + "',ksdd='" + form.getKsdd() + "',xxxx='" + form.getXxxx() + "' where gsbh='"
					+ form.getId() + "'";

		if (operation.equals("删除"))
			sql = "delete from tb_gs where gsbh='" + form.getId() + "'";

		if (connection.executeUpdate(sql)) {
			flag = true;
		}
		return flag;
	}

	/*    */
	public List queryArticle(Integer typeId) {
		List list = new ArrayList();
		String sql = null;
		String sql2 = null;
		String sql3 = null;
		if (typeId == null) {
			sql = "select * from tb_gs";
		} else {
			sql = "select * from tb_gs where tb_gs.zpbh in ( select zpbh from tb_zpzw where bmbh ='" + typeId
					+ "')order by gsbh desc";
		}
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				articleForm = new ArticleForm();
				articleForm.setId(Integer.valueOf(rs.getInt(1)));
				articleForm.setZpbh(Integer.valueOf(rs.getInt(2)));
				articleForm.setGslx(Integer.valueOf(rs.getInt(3)));
				articleForm.setKssj(rs.getString(4));
				articleForm.setKsdd(rs.getString(5));
				articleForm.setXxxx(rs.getString(6));
				// System.out.println("招聘编号" + articleForm.getZpbh());
				sql2 = "select * from tb_zpzw where zpbh = ' " + articleForm.getZpbh() + "'";
				ResultSet rs2 = connection.executeQuery(sql2);
				rs2.next();
				// System.out.println("招聘职位名称" + rs2.getString("zwmc"));
				articleForm.setZwmc(rs2.getString("zwmc"));

				sql3 = "select bmmc from tb_bm where bmbh = ' " + rs2.getString("bmbh") + "'";
				ResultSet rs3 = connection.executeQuery(sql3);
				rs3.next();
				articleForm.setBmmc(rs3.getString("bmmc"));

				list.add(articleForm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/*    */
	public ArticleForm queryArticleForm(Integer id) {
		String sql = "select * from tb_gs where gsbh='" + id + "'";
		String sql2 = null;
		String sql3 = null;
		String sql4 = null;
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				articleForm = new ArticleForm();
				articleForm.setId(Integer.valueOf(rs.getInt(1)));
				articleForm.setZpbh(Integer.valueOf(rs.getInt(2)));
				articleForm.setGslx(Integer.valueOf(rs.getInt(3)));
				articleForm.setKssj(rs.getString(4));
				articleForm.setKsdd(rs.getString(5));
				articleForm.setXxxx(rs.getString(6));

				// System.out.println("招聘编号" + articleForm.getZpbh());
				sql2 = "select * from tb_zpzw where zpbh = ' " + articleForm.getZpbh() + "'";
				ResultSet rs2 = connection.executeQuery(sql2);
				rs2.next();
				// System.out.println("招聘职位名称" + rs2.getString("zwmc"));
				articleForm.setZwmc(rs2.getString("zwmc"));

				sql3 = "select bmmc from tb_bm where bmbh = ' " + rs2.getString("bmbh") + "'";
				ResultSet rs3 = connection.executeQuery(sql3);
				rs3.next();
				articleForm.setBmmc(rs3.getString("bmmc"));
				ResultSet rs4;
				Map<String, String> idcard_name = new HashMap<String, String>();
				if (articleForm.getGslx() == 0) {// 通知来参加笔试

					sql4 = "select xm,sfzh from tb_jl where zpbh = '" + articleForm.getZpbh() + "' and jlzt = 1";
					rs4 = connection.executeQuery(sql4);
					while (rs4.next()) {
						idcard_name.put(rs4.getString("sfzh"), rs4.getString("xm"));
					}
					articleForm.setIdcard_name(idcard_name);
				} else if (articleForm.getGslx() == 1) {// 通知来参加面试

					sql4 = "select xm,sfzh from tb_jl where jlbh in (select jlbh from tb_cj where bscj > 75 and mscj is null and zzzt = 0 and jlbh in ( select jlbh from tb_jl where jlzt = 1 and zpbh ='"
							+ articleForm.getZpbh() + "'))";
					rs4 = connection.executeQuery(sql4);
					while (rs4.next()) {
						idcard_name.put(rs4.getString("sfzh"), rs4.getString("xm"));
					}
					articleForm.setIdcard_name(idcard_name);
				} else {// 录取通知
					sql4 = "select xm,sfzh from tb_jl where jlbh in" + "(select jlbh"
							+ " from tb_cj where  zzzt = 1 and jlbh in"
							+ "( select jlbh from tb_jl where jlzt = 1 and zpbh = '" + articleForm.getZpbh() + "'))";
					rs4 = connection.executeQuery(sql4);
					while (rs4.next()) {
						idcard_name.put(rs4.getString("sfzh"), rs4.getString("xm"));
					}
					articleForm.setIdcard_name(idcard_name);
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return articleForm;
	}
}
