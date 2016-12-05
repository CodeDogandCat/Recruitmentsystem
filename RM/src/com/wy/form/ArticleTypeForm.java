package com.wy.form;

public class ArticleTypeForm {
	public ArticleTypeForm() {
	}

	private Integer id = Integer.valueOf(-1);
	private String typeName = "";

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

}
