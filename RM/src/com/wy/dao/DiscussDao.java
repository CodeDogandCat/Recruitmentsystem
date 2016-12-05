package com.wy.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wy.form.ArticleForm;
import com.wy.form.DiscussForm;
import com.wy.tool.JDBConnection;

public class DiscussDao {
	private JDBConnection connection = null;

	public DiscussDao() {
		connection = new JDBConnection();
	}

	public boolean operationDiscuss(String operation, DiscussForm disussForm) {
		boolean flag = false;
		String sql = null;
		if (operation.equals("É¾³ý"))
			sql = "delete from tb_zpzw where zpbh='" + disussForm.getId() + "'";
		if (operation.equals("Ìí¼Ó"))
			sql = "insert into tb_zpzw values ('" + disussForm.getBmbh() + "','" + disussForm.getZwmc() + "','"
					+ disussForm.getZprs() + "','" + disussForm.getCnyx() + "','" + disussForm.getJtyq() + "','"
					+ disussForm.getKssj() + "','" + disussForm.getJzsj() + "')";
		if (operation.equals("ÐÞ¸Ä")) {
			sql = "update tb_zpzw set bmbh='" + disussForm.getBmbh() + "',zwmc='" + disussForm.getZwmc() + "',Zprs='"
					+ disussForm.getZprs() + "',Cnyx='" + disussForm.getCnyx() + "',Jtyq='" + disussForm.getJtyq()
					+ "',Kssj='" + disussForm.getKssj() + "',Jzsj='" + disussForm.getJzsj() + "' where zpbh='"
					+ disussForm.getId() + "'";
		}

		if (connection.executeUpdate(sql))
			flag = true;
		return flag;
	}

	public List queryDiscuss() {
		List list = new ArrayList();
		DiscussForm form = null;
		String sql = "select * from tb_zpzw order by zpbh desc";
		try {
			ResultSet rs = connection.executeQuery(sql);
			while (rs.next()) {
				form = new DiscussForm();
				form.setId(Integer.valueOf(rs.getString(1)));
				form.setBmbh(Integer.valueOf(rs.getString(2)));
				form.setZwmc(rs.getString(3));
				form.setZprs(Integer.valueOf(rs.getString(4)));
				form.setCnyx(rs.getString(5).substring(0, rs.getString(5).indexOf('.')));
				form.setJtyq(rs.getString(6));
				form.setKssj(rs.getString(7).substring(0, 10));
				form.setJzsj(rs.getString(8).substring(0, 10));

				String sql2 = "select bmmc from tb_bm where bmbh ='" + form.getBmbh() + "'";
				ResultSet rs2 = connection.executeQuery(sql2);
				rs2.next();
				form.setBmmc(rs2.getString(1));
				list.add(form);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public DiscussForm queryDiscuss(Integer id) {
		DiscussForm form = null;
		String sql = "select * from tb_zpzw where zpbh='" + id + "'";
		try {
			ResultSet rs = connection.executeQuery(sql);
			while (rs.next()) {
				form = new DiscussForm();
				form.setId(Integer.valueOf(rs.getString(1)));
				form.setBmbh(Integer.valueOf(rs.getString(2)));
				form.setZwmc(rs.getString(3));
				form.setZprs(Integer.valueOf(rs.getString(4)));
				form.setCnyx(rs.getString(5).substring(0, rs.getString(5).indexOf('.')));
				form.setJtyq(rs.getString(6));
				form.setKssj(rs.getString(7).substring(0, 10));
				form.setJzsj(rs.getString(8).substring(0, 10));

				String sql2 = "select bmmc from tb_bm where bmbh ='" + form.getBmbh() + "'";
				ResultSet rs2 = connection.executeQuery(sql2);
				rs2.next();
				form.setBmmc(rs2.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return form;
	}

	public List queryZwmc(Integer typeId) {
		List list = new ArrayList();
		String sql = null;
		if (typeId == null) {
			sql = "select zwmc from tb_zpzw";
		} else {
			sql = "select distinct(zwmc) from tb_zpzw where bmbh='" + typeId + "' ";
		}
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				list.add(rs.getString("zwmc"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
