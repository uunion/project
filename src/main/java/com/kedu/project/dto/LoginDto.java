package com.kedu.project.dto;
//화면에서 전달되는 데이터를 수집
public class LoginDto {

	private String memberid;
	private String pwd;
	private boolean useCookie;
	
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

	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	@Override
	public String toString() {
		return "LoginDto [memberid=" + memberid + ", pwd=" + pwd + ", useCookie=" + useCookie + "]";
	}
	
	

	
	
	
}
