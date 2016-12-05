/*    */package com.wy.tool;

/*    */
/*    *//*    */import java.sql.Connection;
/*    */
import java.sql.SQLException;
/*    */
import java.sql.Statement;

/*    */
/*    */public class JDBConnection
/*    */{

	private final String url = "jdbc:sqlserver://localhost:1433;DatabaseName=db_rm";
	/* 11 */private final String userName = "sa";
	/* 12 */private final String password = "123456";
	/* 13 */private Connection con = null;
	/*    */
	/*    */static
	/*    */{
		/*    */try {
			/* 18 */Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
			/*    */} catch (Exception ex) {
			/* 20 */System.out.println("数据库加载失败");
			/*    */}
		/*    */}

	/*    */
	/*    */public JDBConnection() {
	}

	/*    */
	/*    */public boolean creatConnection() {
		/* 27 */try {
			con = java.sql.DriverManager.getConnection(url, userName, password);
			/* 28 */con.setAutoCommit(true);
			/*    */}
		/*    */catch (SQLException e) {
			/* 31 */System.out.println(e.getMessage());
			/* 32 */System.out.println("creatConnectionError!");
			/*    */}
		/* 34 */return true;
		/*    */}

	/*    */
	/*    */public boolean executeUpdate(String sql)
	/*    */{
		/* 39 */if (con == null) {
			/* 40 */creatConnection();
			/*    */}
		/*    */try {
			/* 43 */Statement stmt = con.createStatement();
			/* 44 */int iCount = stmt.executeUpdate(sql);
			/* 45 */System.out.println("操作成功，所影响的记录数为" + String.valueOf(iCount));
			/* 46 */return true;
			/*    */} catch (SQLException e) {
			/* 48 */System.out.println(e.getMessage());
		}
		/* 49 */return false;
		/*    */}

	/*    */
	/*    */
	/*    */public java.sql.ResultSet executeQuery(String sql)
	/*    */{
		java.sql.ResultSet rs;
		/*    */try
		/*    */{
			/* 57 */if (con == null) {
				/* 58 */creatConnection();
				/*    */}
			/*    */
			/* 61 */Statement stmt = con.createStatement();
			/*    */try {
				/* 63 */rs = stmt.executeQuery(sql);
				/*    */} catch (SQLException e) {

				/* 65 */System.out.println(e.getMessage());
				/* 66 */return null;
				/*    */}

			/*    */}
		/*    */catch (SQLException e)
		/*    */{
			/* 69 */System.out.println(e.getMessage());
			/* 70 */System.out.println("executeQueryError!");
			/* 71 */return null;
			/*    */}

		return rs;
		/*    */}
	/*    */
}
