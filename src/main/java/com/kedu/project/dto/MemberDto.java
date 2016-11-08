package com.kedu.project.dto;

public class MemberDto {
	
	private int mno;
	private String memberid;
	private String pwd;
	private String name;
	private String email;
	private int admin;
	private String phone;
	private String birth;
	private String addr;
	private String deaddr;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDeaddr() {
		return deaddr;
	}
	public void setDeaddr(String deaddr) {
		this.deaddr = deaddr;
	}
	@Override
	public String toString() {
		return "MemberDto [mno=" + mno + ", memberid=" + memberid + ", pwd=" + pwd + ", name=" + name + ", email="
				+ email + ", admin=" + admin + ", phone=" + phone + ", birth=" + birth + ", addr=" + addr + ", deaddr="
				+ deaddr + "]";
	}
	
	
	
	
}
