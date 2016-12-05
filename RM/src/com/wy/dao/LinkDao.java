/*    */package com.wy.dao;

/*    */
/*    *//*    */import java.sql.ResultSet;
/*    */
import java.sql.SQLException;
/*    */
import java.util.ArrayList;
/*    */
import java.util.List;

import com.wy.form.LinkForm;
/*    */
import com.wy.tool.JDBConnection;

/*    */
/*    */public class LinkDao
/*    */{
	/* 12 */private JDBConnection connection = null;

	/*    */
	/*    */public LinkDao() {
		/* 15 */connection = new JDBConnection();
		/*    */}

	/*    */
	/*    */public boolean updateLink(LinkForm form)
	/*    */{
		/* 20 */boolean flag = false;
		/* 21 */String sql = "update tb_link set name='" + form.getName() + "',url='" +
		/* 22 */form.getUrl() + "'" + "where id='" + form.getId() + "'";
		/* 23 */if (connection.executeUpdate(sql)) {
			/* 24 */flag = true;
			/*    */}
		/* 26 */return flag;
		/*    */}

	/*    */
	/*    */public boolean addLink(LinkForm form)
	/*    */{
		/* 31 */boolean flag = false;
		/* 32 */String sql = "insert into tb_link values ('" + form.getName() + "','" +
		/* 33 */form.getUrl() + "')";
		/* 34 */if (connection.executeUpdate(sql)) {
			/* 35 */flag = true;
			/*    */}
		/* 37 */return flag;
		/*    */}

	/*    */
	/*    */public boolean deleteLink(Integer id)
	/*    */{
		/* 42 */boolean flag = false;
		/* 43 */String sql = "delete from tb_link where id='" + id + "'";
		/* 44 */if (connection.executeUpdate(sql)) {
			/* 45 */flag = true;
			/*    */}
		/* 47 */return flag;
		/*    */}

	/*    */
	/*    */public List queryLink()
	/*    */{
		/* 52 */List list = new ArrayList();
		/* 53 */LinkForm form = null;
		/* 54 */String sql = "select * from tb_link";
		/* 55 */ResultSet rs = connection.executeQuery(sql);
		/*    */try {
			/* 57 */while (rs.next()) {
				/* 58 */form = new LinkForm();
				/* 59 */form.setId(Integer.valueOf(rs.getString(1)));
				/* 60 */form.setName(rs.getString(2));
				/* 61 */form.setUrl(rs.getString(3));
				/*    */
				/* 63 */list.add(form);
				/*    */}
			/*    */} catch (SQLException e) {
			/* 66 */e.printStackTrace();
			/*    */}
		/*    */
		/* 69 */return list;
		/*    */}

	/*    */
	/*    */public LinkForm queryLinkForm(String id)
	/*    */{
		/* 74 */LinkForm form = null;
		/* 75 */String sql = "select * from tb_link where id='" + id + "'";
		/* 76 */ResultSet rs = connection.executeQuery(sql);
		/*    */try {
			/* 78 */while (rs.next()) {
				/* 79 */form = new LinkForm();
				/* 80 */form.setId(Integer.valueOf(rs.getString(1)));
				/* 81 */form.setName(rs.getString(2));
				/* 82 */form.setUrl(rs.getString(3));
				/*    */}
			/*    */} catch (SQLException e) {
			/* 85 */e.printStackTrace();
			/*    */}
		/* 87 */return form;
		/*    */}
	/*    */
}

/*
 * Location: D:\workspace\javaee\Blog\WebContent\WEB-INF\classes Qualified Name:
 * com.wy.dao.LinkDao Java Class Version: 7 (51.0) JD-Core Version: 0.7.1
 */