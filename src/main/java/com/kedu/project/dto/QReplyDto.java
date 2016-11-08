package com.kedu.project.dto;

import java.util.Date;

public class QReplyDto {
	
	private Integer qbno;
	private Integer rno;
	private String rcontent;
	private String rwriter;
	private Date rregdate;
	public Integer getQbno() {
		return qbno;
	}
	public void setQbno(Integer qbno) {
		this.qbno = qbno;
	}
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public Date getRregdate() {
		return rregdate;
	}
	public void setRregdate(Date rregdate) {
		this.rregdate = rregdate;
	}
	@Override
	public String toString() {
		return "ReplyDto [qbno=" + qbno + ", rno=" + rno + ", rcontent=" + rcontent + ", rwriter=" + rwriter
				+ ", rregdate=" + rregdate + ", toString()=" + super.toString() + "]";
	}
	
	
}
