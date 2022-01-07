package com.erp.vo;

public class Users {
	private String 	user_num;
	private String 	user_pw;
	private String 	user_name;
	private String	dept_num;
	private String 	user_tel;
	private String 	user_email; 	
	private String 	user_addr;

	public Users() {}

	public Users(String user_num, String user_pw, String user_name, String dept_num, String user_tel, String user_email,
			String user_addr) {
		this.user_num = user_num;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.dept_num = dept_num;
		this.user_tel = user_tel;
		this.user_email = user_email;
		this.user_addr = user_addr;
	}

	public String getUser_num() {
		return user_num;
	}

	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getDept_num() {
		return dept_num;
	}

	public void setDept_num(String dept_num) {
		this.dept_num = dept_num;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	
}
