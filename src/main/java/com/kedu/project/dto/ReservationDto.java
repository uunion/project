package com.kedu.project.dto;

public class ReservationDto {
	private int rno;
	private String rname;
	private String email;
	private String phone;
	private String rdate;
	private String rtime;
	private String check;
	
	
	
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	@Override
	public String toString() {
		return "ReservationDto [rno=" + rno + ", rname=" + rname + ", email=" + email + ", phone=" + phone + ", rdate="
				+ rdate + ", rtime=" + rtime + ", check=" + check + "]";
	}
	
	
}
