package com.database.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.mybean.UserBean;

public class UserMapper implements RowMapper<UserBean> {
	public UserBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		long ullId = rs.getLong("id");
		String strName = rs.getString("name");
		String strPasswd = rs.getString("password");
		
		return new UserBean(ullId, strName, strPasswd);
	}
}
