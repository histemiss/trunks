package com.database.dao;

import java.util.List;

import javax.sql.DataSource;

import com.mybean.FileBean;

public interface FileDAO {
	   public void setDataSource(DataSource ds);

	   //上传文件
	   public void create(long ullUserId, String strName, String strPath);
	   //插入后获取ID
	   public FileBean Fetch(String strName);
	   //遍历
	   public List<FileBean> listUserFiles(long ullUserId);
}
