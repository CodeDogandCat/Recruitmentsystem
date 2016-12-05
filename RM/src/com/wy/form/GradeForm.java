package com.wy.form;

public class GradeForm {

	public GradeForm(){
	}
	
	private Integer cjbh = Integer.valueOf(-1);
	private Integer jlbh = Integer.valueOf(-1);
	private Integer bscj = Integer.valueOf(-1);
	private Integer mscj = Integer.valueOf(-1);
	private Integer zzzt = Integer.valueOf(0);
	
	public void setCjbh(Integer cjbh)
	{
		this.cjbh = cjbh;
	}
	
	public void setJlbh(Integer jlbh)
	{
		this.jlbh = jlbh;
	}
	public void setBscj(Integer bscj)
	{
		this.bscj = bscj;
	}
	
	public void setMscj(Integer mscj)
	{
		this.mscj = mscj;
	}
	
	public void setZzzt(Integer zzzt)
	{
		this.zzzt = zzzt;
	}

	public Integer getCjbh() {
		return cjbh;
	}

	public Integer getJlbh() {
		return jlbh;
	}

	public Integer getBscj() {
		return bscj;
	}

	public Integer getMscj() {
		return mscj;
	}

	public Integer getZzzt() {
		
		return zzzt;
	}
	
	public String Zzzt_Result() {
		String result = null;
		switch(zzzt)
		{
		case 0:
			result="Î´ÉóºË";break;
		case 1:
			result="Â¼È¡";break;
		case 2:
			result="²»Â¼È¡";
		}
		return result;
		
	}
	
}
