/*    */package com.wy.dao;

/*    */
/*    *//*    */import java.sql.ResultSet;
/*    */
import java.sql.SQLException;
/*    */
import java.util.ArrayList;
/*    */
import java.util.List;

import com.wy.form.ArticleTypeForm;
/*    */
import com.wy.tool.JDBConnection;

/*    */
/*    */public class ArticleTypeDao
/*    */{
	/* 12 */private JDBConnection connection = null;

	/*    */
	/*    */public ArticleTypeDao() {
		/* 15 */connection = new JDBConnection();
		/*    */}

	/*    */
	/*    */public boolean operationArticleType(String operation, ArticleTypeForm form) {
		/* 19 */boolean flag = false;
		/* 20 */String sql = null;
		/* 21 */if (operation.equals("Ìí¼Ó"))
			/* 22 */sql =
			/* 23 */"insert into tb_bm values ('" + form.getId() + "','" + form.getTypeName() + "')";
		/* 24 */if (operation.equals("É¾³ý"))
			/* 25 */sql = "delete from tb_bm where bmbh='" + form.getId() + "'";
		/* 26 */if (connection.executeUpdate(sql)) {
			/* 27 */flag = true;
			/*    */}
		/* 29 */return flag;
		/*    */}

	/*    */
	/*    */
	/*    */public String queryArticleTypeName(Integer id)
	/*    */{
		/* 35 */String typeName = null;
		/* 36 */String sql = "select * from tb_bm where bmbh='" + id + "'";
		/* 37 */ResultSet rs = connection.executeQuery(sql);
		/*    */try {
			/* 39 */while (rs.next()) {
				/* 40 */typeName = rs.getString("bmmc");
				/*    */}
			/*    */} catch (SQLException e) {
			/* 43 */e.printStackTrace();
			/*    */}
		/* 45 */return typeName;
		/*    */}

	/*    */
	/*    */public List queryArticleType() {
		/* 49 */List list = new ArrayList();
		/* 50 */ArticleTypeForm form = null;
		/* 51 */String sql = "select * from tb_bm";
		/* 52 */ResultSet rs = connection.executeQuery(sql);
		/*    */try {
			/* 54 */while (rs.next()) {
				/* 55 */form = new ArticleTypeForm();
				/* 56 */form.setId(Integer.valueOf(rs.getInt(1)));
				/* 57 */form.setTypeName(rs.getString(2));
				/* 59 */list.add(form);
				/*    */}
			/*    */} catch (SQLException e) {
			/* 62 */e.printStackTrace();
			/*    */}
		/* 64 */return list;
		/*    */}
	/*    */
}
