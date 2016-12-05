package com.wy.form;

public class ConsumerForm {
	public ConsumerForm() {
	}

	private Integer id = Integer.valueOf(0);
	private String account = null;
	private String password = null;
	private String eMail = null;
	private String manageLevel = null;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEMail() {
		// System.out.println("email-------------" + eMail);
		return eMail;
	}

	public void setEMail(String eMail) {
		this.eMail = eMail;
	}

	public String getManageLevel() {
		return manageLevel;
	}

	public void setManageLevel(String manageLevel) {
		this.manageLevel = manageLevel;
	}

}
