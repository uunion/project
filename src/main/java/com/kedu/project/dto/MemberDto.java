package com.kedu.project.dto;

public class MemberDto {
	
	private String memberid;
	private String pwd;
	private String name;
	private String email;
	private int admin;
	private String phone;
	private String addr;
	
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	@Override
	public String toString() {
		return "MemberDto [memberid=" + memberid + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", admin="
				+ admin + ", phone=" + phone + ", addr=" + addr + "]";
	}
	
	
	
}
