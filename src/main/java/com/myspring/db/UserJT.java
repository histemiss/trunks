package com.myspring.db;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.database.dao.UserDAO;
import com.database.mapper.UserMapper;
import com.mybean.UserBean;

public class UserJT implements UserDAO,UserDetailsService{
	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource ds) {
		// TODO Auto-generated method stub
		this.jdbcTemplateObject = new JdbcTemplate(ds);
	}

	public UserBean create(String strName, String strPasswd) {
		// TODO Auto-generated method stub
		String SQL = "insert into user_info(name, password) values (?, ?)";
		jdbcTemplateObject.update( SQL, strName, strPasswd);

		SQL = "select * from user_info where name = ?";
		return jdbcTemplateObject.queryForObject(SQL, new Object[] { strName }, new UserMapper());
	}

	public List<UserBean> listAllUsers() {
		// TODO Auto-generated method stub
		String SQL = "select * from user_info";
		List<UserBean> users = (List<UserBean>) jdbcTemplateObject.query(SQL,  new UserMapper());
		return users;
	}

	public UserDetails loadUserByUsername(String strName) throws UsernameNotFoundException, DataAccessException {
		String SQL = "select * from user_info where name = ?";
		return (UserDetails)jdbcTemplateObject.queryForObject(SQL,  new Object[]{strName}, new UserMapper());
	}

}
