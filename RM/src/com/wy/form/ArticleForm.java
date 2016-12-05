package com.wy.form;

import java.util.Map;

public class ArticleForm {
	public ArticleForm() {
	}

	private Integer id = Integer.valueOf(-1);
	private Integer zpbh = Integer.valueOf(-1);
	private Integer bmbh = Integer.valueOf(-1);
	private Integer gslx = Integer.valueOf(-1);
	private String kssj = "";
	private String ksdd = "";
	private String xxxx = "";
	private String bmmc = null;
	private String zwmc = null;
	private Map<String, String> idcard_name = null;

	public Map<String, String> getIdcard_name() {
		return idcard_name;
	}

	public void setIdcard_name(Map<String, String> idcard_name) {
		this.idcard_name = idcard_name;
	}

	public String getZwmc() {
		return zwmc;
	}

	public void setZwmc(String zwmc) {
		this.zwmc = zwmc;
	}

	public String getBmmc() {
		return bmmc;
	}

	public void setBmmc(String bmmc) {
		this.bmmc = bmmc;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getZpbh() {
		return zpbh;
	}

	public void setZpbh(Integer zpbh) {
		this.zpbh = zpbh;
	}

	public Integer getBmbh() {
		return bmbh;
	}

	public void setBmbh(Integer bmbh) {
		this.bmbh = bmbh;
	}

	public Integer getGslx() {
		return gslx;
	}

	public void setGslx(Integer gslx) {
		this.gslx = gslx;
	}

	public String getKssj() {
		// return kssj.substring(0, 16);
		return kssj;
	}

	public void setKssj(String kssj) {
		this.kssj = kssj.substring(0, 16);
	}

	public String getKsdd() {
		return ksdd;
	}

	public void setKsdd(String ksdd) {
		this.ksdd = ksdd;
	}

	public String getXxxx() {
		return xxxx;
	}

	public void setXxxx(String xxxx) {
		this.xxxx = xxxx;
	}

	public String getTitle() {
		switch (gslx) {
		case 0:
			return zwmc + "笔试通知";
		case 1:
			return zwmc + "面试通知";
		case 2:
			return zwmc + "录取通知";

		default:
			return zwmc;
		}
	}

	public String getType() {
		switch (gslx) {
		case 0:
			return "参加笔试";
		case 1:
			return "参加面试";
		case 2:
			return "报到";

		default:
			return "";
		}
	}

}
