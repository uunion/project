package com.kedu.project.dto;

import java.util.Date;

public class ReplyDto {

	private Integer	rbno;
	private Integer nbno;
	private String	rcontent;
	private String	rwriter;
	
	private Date	rregdate;
	private Date	updatedate;
	public Integer getRbno() {
		return rbno;
	}
	public void setRbno(Integer rbno) {
		this.rbno = rbno;
	}
	public Integer getNbno() {
		return nbno;
	}
	public void setNbno(Integer nbno) {
		this.nbno = nbno;
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
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	@Override
	public String toString() {
		return "ReplyVO [rbno=" + rbno + ", nbno=" + nbno + ", rcontent=" + rcontent + ", rwriter=" + rwriter
				+ ", rregdate=" + rregdate + ", updatedate=" + updatedate + "]";
	}
	
}
