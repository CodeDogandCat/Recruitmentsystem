package com.wy.dao;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.util.ArrayList;

import java.util.List;

import com.wy.form.ConsumerForm;

import com.wy.tool.JDBConnection;

import com.wy.tool.StrMD5;

/*     */
/*     */public class ConsumerDao
/*     */{
	/* 13 */private JDBConnection connection = null;
	/*     */
	/* 15 */private ConsumerForm consumerForm = null;

	/*     */
	/*     */public ConsumerDao() {
		/* 18 */connection = new JDBConnection();
		/*     */}

	/*     */
	/*     */public boolean front_updateConsumerForm(ConsumerForm form)
	/*     */{
		/* 23 */boolean flag = false;
		/* 24 */String sql = "update tb_yh set yhm='" + form.getAccount() +
		/* 25 */"',mm='" + StrMD5.MD5(form.getPassword()) + "',yx='" +
		/* 29 */form.getEMail() + "' where yhbh='" + form.getId() + "'";
		/* 30 */if (connection.executeUpdate(sql)) {
			/* 31 */flag = true;
			/*     */}
		/* 33 */return flag;
		/*     */}

	/*     */
	/*     */
	/*     */public boolean updateConsumerForm(ConsumerForm form)
	/*     */{
		/* 39 */boolean flag = false;
		/* 40 */String sql = "update tb_yh set yhm='" + form.getAccount() +
		/* 41 */"',mm='" + StrMD5.MD5(form.getPassword()) + "',yx='" +
		/* 45 */form.getEMail() + "' where qxjb='" +
		/* 46 */form.getManageLevel() + "'";
		/* 47 */if (connection.executeUpdate(sql)) {
			/* 48 */flag = true;
			/*     */}
		/* 50 */return flag;
		/*     */}

	/*     */
	/*     */public boolean deleteConsumerForm(String account)
	/*     */{
		/* 55 */boolean flag = false;
		/* 56 */String sql = "delete from tb_yh where yhm='" + account + "'";
		/* 57 */if (connection.executeUpdate(sql)) {
			/* 58 */flag = true;
			/*     */}
		/* 60 */return flag;
		/*     */}

	/*     */
	/*     */public boolean addConsumerForm(ConsumerForm form)
	/*     */{
		/* 65 */boolean flag = false;
		/* 66 */String sql = "insert into tb_yh values ('" + form.getAccount() +
		/* 67 */"','" + StrMD5.MD5(form.getPassword()) + "','" + form.getEMail() + "','" +
		/* 71 */form.getManageLevel() + "')";
		/*     */
		/* 73 */if (connection.executeUpdate(sql)) {
			/* 74 */flag = true;
			/*     */}
		/* 76 */return flag;
		/*     */}

	/*     */
	/*     */public String getConsumerForm(Integer id) {
		/* 80 */String sql = "select * from tb_yh where yhbh='" + id + "'";
		/* 81 */String name = "";
		/*     */try {
			/* 83 */ResultSet rs = connection.executeQuery(sql);
			/* 84 */while (rs.next()) {
				/* 85 */name = rs.getString("yhm");
				/*     */}
			/*     */} catch (SQLException e) {
			/* 88 */e.printStackTrace();
			/*     */}
		/* 90 */return name;
		/*     */}

	/*     */
	/*     */public ConsumerForm getConsumerForm(String account)
	/*     */{
		/* 95 */String sql = "select * from tb_yh where yhm='" + account +
		/* 96 */"'";
		/*     */try {
			/* 98 */ResultSet rs = connection.executeQuery(sql);
			/* 99 */while (rs.next()) {
				/* 100 */consumerForm = new ConsumerForm();
				/* 101 */consumerForm.setId(Integer.valueOf(rs.getString(1)));
				/* 102 */consumerForm.setAccount(rs.getString(2));
				/* 103 */consumerForm.setPassword(rs.getString(3));
				/* 109 */consumerForm.setEMail(rs.getString(4));
				/* 110 */consumerForm.setManageLevel(rs.getString(5));
				/*     */}
			/*     */} catch (SQLException e) {
			/* 113 */e.printStackTrace();
			/*     */}
		/* 115 */return consumerForm;
		/*     */}

	/*     */
	/*     */public List getConsumerList(String manageLevel)
	/*     */{
		/* 120 */List list = new ArrayList();
		/* 121 */String sql = "select * from tb_yh where qxjb='" +
		/* 122 */manageLevel + "'";
		/*     */try {
			/* 124 */ResultSet rs = connection.executeQuery(sql);
			/* 125 */while (rs.next()) {
				/* 126 */consumerForm = new ConsumerForm();
				/* 127 */consumerForm.setId(Integer.valueOf(rs.getString(1)));
				/* 128 */consumerForm.setAccount(rs.getString(2));
				/* 129 */consumerForm.setPassword(rs.getString(3));
				/* 135 */consumerForm.setEMail(rs.getString(4));
				/* 136 */consumerForm.setManageLevel(rs.getString(5));
				/* 137 */list.add(consumerForm);
				/*     */}
			/*     */} catch (SQLException e) {
			/* 140 */e.printStackTrace();
			/*     */}
		/*     */
		/* 143 */return list;
		/*     */}
	/*     */
}
