package com.erp.vo;

public class Supplier {
	private String supp_id;
	private String supp_name;
	private String supp_addr;
	private String supp_tel;
	private String user_num;
	private String user_tel;
	private String supp_type;
	private String supp_note;
	
	public Supplier() {}

	public Supplier(String supp_id, String supp_name, String supp_addr, String supp_tel, String user_num, String user_tel,
			String supp_type, String supp_note) {
		this.supp_id = supp_id;
		this.supp_name = supp_name;
		this.supp_addr = supp_addr;
		this.supp_tel = supp_tel;
		this.user_num = user_num;
		this.user_tel = user_tel;
		this.supp_type = supp_type;
		this.supp_note = supp_note;
	}

	public String getSupp_id() {
		return supp_id;
	}

	public void setSupp_id(String supp_id) {
		this.supp_id = supp_id;
	}

	public String getSupp_name() {
		return supp_name;
	}
	
	public void setSupp_name(String supp_name) {
		this.supp_name = supp_name;
	}
	
	public String getSupp_addr() {
		return supp_addr;
	}

	public void setSupp_addr(String supp_addr) {
		this.supp_addr = supp_addr;
	}

	public String getSupp_tel() {
		return supp_tel;
	}

	public void setSupp_tel(String supp_tel) {
		this.supp_tel = supp_tel;
	}

	public String getUser_num() {
		return user_num;
	}

	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getSupp_type() {
		return supp_type;
	}

	public void setSupp_type(String supp_type) {
		this.supp_type = supp_type;
	}

	public String getSupp_note() {
		return supp_note;
	}

	public void setSupp_note(String supp_note) {
		this.supp_note = supp_note;
	}
	
}
