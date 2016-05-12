package com.wt.entity;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{

	private Integer user_id;
	private String user_name;
	private String user_email;
	private long user_phone;
	private String user_address;
	private String user_password;
	
	// 添加用户创建的时间，不能被修改
	private Date createTime;
	
	// 添加用户的状态，此属性只能有管理员改变
	// 1 为优秀； 2 为良好； 3 为不良 
	private Integer user_state;

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	public long getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(long user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public Integer getUser_state() {
		return user_state;
	}

	public void setUser_state(Integer user_state) {
		this.user_state = user_state;
	}

	public User() {
	}

	public User(Integer user_id, String user_name, String user_email,
			long user_phone, String user_address, String user_password,
			Date createTime, Integer user_state) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_address = user_address;
		this.user_password = user_password;
		this.createTime = createTime;
		this.user_state = user_state;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name
				+ ", user_email=" + user_email + ", user_phone=" + user_phone
				+ ", user_address=" + user_address + ", user_password="
				+ user_password + ", createTime=" + createTime
				+ ", user_state=" + user_state + "]";
	}
	
}
