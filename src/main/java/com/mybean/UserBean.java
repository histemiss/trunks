package com.mybean;

import org.springframework.security.core.authority.AuthorityUtils;

public class UserBean extends org.springframework.security.core.userdetails.User{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3974771372900973801L;
	
	private long ullId;

    public UserBean(long ullId, String strName, String strPasswd) {
    	
    	super(strName, strPasswd, true, true, true, true, AuthorityUtils.commaSeparatedStringToAuthorityList("ROLE_USER"));
    	
    	this.ullId = ullId;
    }

    public long getUllId() {
		return ullId;
	}

	public String getStrName() {
		return getUsername();
	}

	public String getStrPasswd() {
		return getPassword();
	}
}
