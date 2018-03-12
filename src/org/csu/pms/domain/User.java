package org.csu.pms.domain;

import java.io.Serializable;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String userId;
	
	private String password;
	
	private String userName;
	
	private String sex;
	
	private String phone;
	
	private int roleType;

	private int sexId;
	
	private int typeId;
	
	public int getSexId() {
		return sexId;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setSexId(int sexId) {
		this.sexId = sexId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getRoleType() {
		return roleType;
	}

	public void setRoleType(int roleType) {
		this.roleType = roleType;
	}
	
}
