package com.wy.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wy.form.ArticleForm;
import com.wy.form.VoteForm;
import com.wy.tool.JDBConnection;

public class VoteDao {
	private JDBConnection connection = null;

	public VoteDao() {

		connection = new JDBConnection();
	}

	public boolean operationVote(String operation, VoteForm voteForm) {
		boolean flag = false;
		String sql = null;
		if (operation.equals("É¾³ý")) {
			sql = "delete from tb_jl where jlbh='" + voteForm.getId() + "'";
		}
		if (operation.equals("Ìí¼Ó"))
			sql = "insert into tb_jl values('" + voteForm.getYhbh() + "','" + voteForm.getZpbh() + "','"
					+ voteForm.getXm() + "','" + voteForm.getXb() + "','" + voteForm.getLxdh() + "','"
					+ voteForm.getSfzh() + "','" + voteForm.getCsrq() + "','" + voteForm.getZzmm() + "','"
					+ voteForm.getMz() + "','" + voteForm.getJg() + "','" + voteForm.getXl() + "','"
					+ voteForm.getJsjnl() + "','" + voteForm.getYynl() + "','" + voteForm.getBysj() + "','"
					+ voteForm.getJybj() + "','" + voteForm.getGzjl() + "','" + voteForm.getZwpj() + "','"
					+ voteForm.getZplj() + "','" + voteForm.getJlzt() + "')";

		if (operation.equals("ÐÞ¸Ä"))
			sql = "update tb_jl set jlzt='" + voteForm.getJlzt() + "' where jlbh='" + voteForm.getId() + "'";
		if (connection.executeUpdate(sql))
			flag = true;
		return flag;
	}

	public int getZpbh(int bmbh, String zwmc) {
		int zpbh = 0;
		String sql = "select zpbh from tb_zpzw where bmbh='" + bmbh + "' and  zwmc ='" + zwmc + "'";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				zpbh = rs.getInt("zpbh");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return zpbh;

	}

	public Integer MaxQueryID() {
		Integer maxID = Integer.valueOf(0);
		String sql = "select max(jlbh) as id from tb_jl";
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				maxID = Integer.valueOf(rs.getInt("id")) + 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return maxID;
	}

	public List queryVoteList(Integer bmbh) {
		List list = new ArrayList();
		String sql = null;
		VoteForm form = null;
		if (bmbh == null) {
			sql = "select * from tb_jl";
		} else {
			sql = "select * from tb_jl where zpbh in ( select zpbh from tb_zpzw where bmbh ='" + bmbh
					+ "')order by jlbh desc";
		}
		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				form = new VoteForm();
				form.setId(rs.getInt("jlbh"));
				form.setYhbh(rs.getInt("yhbh"));
				form.setZpbh(rs.getInt("zpbh"));
				form.setXm(rs.getString("xm"));
				form.setXb(rs.getString("xb"));
				form.setLxdh(rs.getString("lxdh"));
				form.setSfzh(rs.getString("sfzh"));
				form.setCsrq(rs.getString("csrq"));
				form.setZzmm(rs.getString("zzmm"));
				form.setMz(rs.getString("mz"));
				form.setJg(rs.getString("jg"));
				form.setXl(rs.getString("xl"));
				form.setJsjnl(rs.getString("jsjnl"));
				form.setYynl(rs.getString("yynl"));
				form.setBysj(rs.getString("bysj"));
				form.setJybj(rs.getString("jybj"));
				form.setGzjl(rs.getString("gzjl"));
				form.setZwpj(rs.getString("zwpj"));
				form.setZplj(rs.getString("zplj"));
				form.setJlzt(rs.getInt("jlzt"));

				ResultSet rs1 = connection.executeQuery("select bmbh,zwmc from tb_zpzw where zpbh='" + form.getZpbh()
						+ "'");
				rs1.next();
				form.setZwmc(rs1.getString("zwmc"));
				form.setBmbh(rs1.getInt("bmbh"));
				ResultSet rs2 = connection.executeQuery("select bmmc from tb_bm where bmbh='" + form.getBmbh() + "'");
				rs2.next();
				form.setBmmc(rs2.getString("bmmc"));
				System.out.println("¼òÀú±àºÅ£¨dao£©" + form.getId());
				list.add(form);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public VoteForm queryVote(Integer jlbh) {
		String sql = null;
		VoteForm form = null;

		sql = "select * from tb_jl where jlbh  ='" + jlbh + "'";

		ResultSet rs = connection.executeQuery(sql);
		try {
			while (rs.next()) {
				form = new VoteForm();
				form.setId(rs.getInt("jlbh"));
				form.setYhbh(rs.getInt("yhbh"));
				form.setZpbh(rs.getInt("zpbh"));
				form.setXm(rs.getString("xm"));
				form.setXb(rs.getString("xb"));
				form.setLxdh(rs.getString("lxdh"));
				form.setSfzh(rs.getString("sfzh"));
				form.setCsrq(rs.getString("csrq"));
				form.setZzmm(rs.getString("zzmm"));
				form.setMz(rs.getString("mz"));
				form.setJg(rs.getString("jg"));
				form.setXl(rs.getString("xl"));
				form.setJsjnl(rs.getString("jsjnl"));
				form.setYynl(rs.getString("yynl"));
				form.setBysj(rs.getString("bysj"));
				form.setJybj(rs.getString("jybj"));
				form.setGzjl(rs.getString("gzjl"));
				form.setZwpj(rs.getString("zwpj"));
				form.setZplj(rs.getString("zplj"));
				form.setJlzt(rs.getInt("jlzt"));

				ResultSet rs1 = connection.executeQuery("select bmbh,zwmc from tb_zpzw where zpbh='" + form.getZpbh()
						+ "'");
				rs1.next();
				form.setZwmc(rs1.getString("zwmc"));
				form.setBmbh(rs1.getInt("bmbh"));
				ResultSet rs2 = connection.executeQuery("select bmmc from tb_bm where bmbh='" + form.getBmbh() + "'");
				rs2.next();
				form.setBmmc(rs2.getString("bmmc"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return form;
	}
}
