package com.kedu.project.dto;

import java.util.Arrays;
import java.util.Date;

public class QboardDto {

	private Integer qbno;	// 글번호 
	private String qname;	// 글제목
	private String qcontent;// 글내용
	private String qwriter;	// 글쓴이	
	private Date qregdate;	// 글 작성날짜
	private int qviewcnt;	// 글 본수(조회수)
	private int qreplycnt;	// 댓글수
	private String[] files; // 파일업로드
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public int getQreplycnt() {
		return qreplycnt;
	}
	public void setQreplycnt(int qreplycnt) {
		this.qreplycnt = qreplycnt;
	}
	public Integer getQbno() {
		return qbno;
	}
	public void setQbno(Integer qbno) {
		this.qbno = qbno;
	}
	public String getQname() {
		return qname;
	}
	public void setQname(String qname) {
		this.qname = qname;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQwriter() {
		return qwriter;
	}
	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}
	public Date getQregdate() {
		return qregdate;
	}
	public void setQregdate(Date qregdate) {
		this.qregdate = qregdate;
	}
	public int getQviewcnt() {
		return qviewcnt;
	}
	public void setQviewcnt(int qviewcnt) {
		this.qviewcnt = qviewcnt;
	}
	@Override
	public String toString() {
		return "QboardDto [qbno=" + qbno + ", qname=" + qname + ", qcontent=" + qcontent + ", qwriter=" + qwriter
				+ ", qregdate=" + qregdate + ", qviewcnt=" + qviewcnt + ", qreplycnt=" + qreplycnt + ", files="
				+ Arrays.toString(files) + ", toString()=" + super.toString() + "]";
	}
	
	
}
