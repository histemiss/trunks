package com.myspring.db;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.database.dao.FileDAO;
import com.database.mapper.FileMapper;
import com.mybean.FileBean;

public class FileJT implements FileDAO {
	   private DataSource dataSource;
	   private JdbcTemplate jdbcTemplateObject;

	   public void setDataSource(DataSource dataSource) {
		      this.dataSource = dataSource;
		      this.jdbcTemplateObject = new JdbcTemplate(this.dataSource);
		   }

	   //上传文件
	   public void create(long ullUserId, String strName, String strPath) {
		   String SQL = "insert into file_info(user_id, name, path) values (?, ?, ?)";
		      jdbcTemplateObject.update( SQL, ullUserId, strName, strPath);
		      return;
	   }
	   
	   //根据文件名获取ID
	   public FileBean Fetch(String strName) {
		      String SQL = "select * from file_info where name = ?";
		      FileBean file = jdbcTemplateObject.queryForObject(SQL, 
		                        new Object[]{strName}, new FileMapper());
		      return file;
	   }

	   //遍历
	   public List<FileBean> listUserFiles(long ullUserId) {
		      String SQL = "select * from file_info where user_id = ?";
		      List<FileBean> files = jdbcTemplateObject.query(SQL, 
		    		  new Object[]{ullUserId}, new FileMapper());
		      return files;
	   }
}
