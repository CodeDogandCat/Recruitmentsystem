/*    */package com.wy.tool;

/*    */
/*    */public class Chinese {
	/*    */public Chinese() {
	}

	/*    */
	/* 6 */public static String toChinese(String strvalue) {
		try {
			if (strvalue == null) {
				/* 7 */return "";
				/*    */}
			/* 9 */return new String(strvalue.getBytes("ISO8859_1"), "GBK");
			/*    */}
		/*    */catch (Exception e) {
		}
		/*    */
		/* 13 */return "";
		/*    */}
	/*    */
}

/*
 * Location: D:\workspace\javaee\Blog\WebContent\WEB-INF\classes Qualified Name:
 * com.wy.tool.Chinese Java Class Version: 7 (51.0) JD-Core Version: 0.7.1
 */