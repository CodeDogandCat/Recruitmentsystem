/*   */package com.wy.tool;

/*   */
/*   */import java.text.DateFormat;

/*   */
/*   */public class CountTime {
	public CountTime() {
	}

	/*   */
	/* 7 */public String currentlyTime() {
		java.util.Date date = new java.util.Date();
		/* 8 */DateFormat dateFormat = DateFormat.getDateInstance(0);
		/* 9 */return dateFormat.format(date);
		/*   */}
	/*   */
}

/*
 * Location: D:\workspace\javaee\Blog\WebContent\WEB-INF\classes Qualified Name:
 * com.wy.tool.CountTime Java Class Version: 7 (51.0) JD-Core Version: 0.7.1
 */