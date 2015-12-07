package com.database.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import com.mybean.FileBean;


public class FileMapper implements RowMapper<FileBean> {
	   public FileBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		      FileBean file = new FileBean();
		      file.setUllId(rs.getLong("id"));
		      file.setUllUserId(rs.getLong("user_id"));
		      file.setStrName(rs.getString("name"));
		      file.setStrPath(rs.getString("path"));

		      return file;
		   }
}
