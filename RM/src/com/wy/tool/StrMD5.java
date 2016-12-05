/*    */package com.wy.tool;

/*    */
/*    */import java.security.MessageDigest;

/*    */
/*    */public class StrMD5 {
	/*    */public StrMD5() {
	}

	/*    */
	/*    */public static String MD5(String sourceStr) {
		/* 9 */String result = "";
		/*    */try {
			/* 11 */MessageDigest md = MessageDigest.getInstance("MD5");
			/* 12 */md.update(sourceStr.getBytes());
			/* 13 */byte[] b = md.digest();
			/*    */
			/* 15 */StringBuffer buf = new StringBuffer("");
			/* 16 */for (int offset = 0; offset < b.length; offset++) {
				/* 17 */int i = b[offset];
				/* 18 */if (i < 0)
					/* 19 */i += 256;
				/* 20 */if (i < 16)
					/* 21 */buf.append("0");
				/* 22 */buf.append(Integer.toHexString(i));
				/*    */}
			/* 24 */result = buf.toString();
			/*    */
			/*    */}
		/*    */catch (java.security.NoSuchAlgorithmException e)
		/*    */{
			/* 29 */System.out.println(e);
			/*    */}
		/* 31 */return result;
		/*    */}
	/*    */
}

/*
 * Location: D:\workspace\javaee\Blog\WebContent\WEB-INF\classes Qualified Name:
 * com.wy.tool.StrMD5 Java Class Version: 7 (51.0) JD-Core Version: 0.7.1
 */