package com.wy.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wy.form.GradeForm;
import com.wy.tool.JDBConnection;

public class GradeDao {
	private JDBConnection connection = null;
	
	private GradeForm gradeForm = null;
	
	public GradeDao()
	{
		connection = new JDBConnection();
	}
	
	public List ListGrade()          //将成绩信息一行行列出来
	{
		List list = new ArrayList();
		String sql = null;
		sql ="select * from tb_cj";
		
		ResultSet rs = connection.executeQuery(sql);
		
		try{
			while(rs.next()){
				gradeForm = new GradeForm();
				gradeForm.setCjbh(Integer.valueOf(rs.getInt(1)));
				gradeForm.setJlbh(Integer.valueOf(rs.getInt(2)));
				gradeForm.setBscj(Integer.valueOf(rs.getInt(3)));
				gradeForm.setMscj(Integer.valueOf(rs.getInt(4)));
				gradeForm.setZzzt(Integer.valueOf(rs.getInt(5)));
				
				list.add(gradeForm);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public GradeForm getform(int id)
	{
		GradeForm get = new GradeForm();
		String sql = null;
		sql ="select * from tb_cj where cjbh="+id;
		
		ResultSet rs = connection.executeQuery(sql);
		
		try{
			while(rs.next()){
				get.setCjbh(Integer.valueOf(rs.getInt(1)));
				get.setJlbh(Integer.valueOf(rs.getInt(2)));
				get.setBscj(Integer.valueOf(rs.getInt(3)));
				get.setMscj(Integer.valueOf(rs.getInt(4)));
				get.setZzzt(Integer.valueOf(rs.getInt(5)));
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return get;
	}
}
