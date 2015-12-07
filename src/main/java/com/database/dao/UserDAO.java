package com.database.dao;

import java.util.List;

import javax.sql.DataSource;

import com.mybean.UserBean;

public interface UserDAO {
	   public void setDataSource(DataSource ds);

	   //创建用户,并返回此用户信息
	   public UserBean create(String strName, String strPasswd);

	   //查询所有用户
	   public List<UserBean> listAllUsers();
}
