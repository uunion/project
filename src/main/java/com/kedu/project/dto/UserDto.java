package com.kedu.project.dto;

public class UserDto {
	private String uid;
	private String upw;
	private String uemail;
	private int upoint;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public int getUpoint() {
		return upoint;
	}
	public void setUpoint(int upoint) {
		this.upoint = upoint;
	}
	@Override
	public String toString() {
		return "UserDto [uid=" + uid + ", upw=" + upw + ", uemail=" + uemail + ", upoint=" + upoint + "]";
	}
	
	
}
