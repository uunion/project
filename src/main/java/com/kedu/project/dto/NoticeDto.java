package com.kedu.project.dto;

import java.util.Arrays;
import java.util.Date;

public class NoticeDto {
	
	private Integer	nbno;
	private String	nname;
	private String	ncontent;
	private String	nwriter;
	private Date	nregdate;
	private int		nviewcnt;
	private int 	nreplycnt;
	
	private String[] files;

	public Integer getNbno() {
		return nbno;
	}

	public void setNbno(Integer nbno) {
		this.nbno = nbno;
	}

	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNwriter() {
		return nwriter;
	}

	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}

	public Date getNregdate() {
		return nregdate;
	}

	public void setNregdate(Date nregdate) {
		this.nregdate = nregdate;
	}

	public int getNviewcnt() {
		return nviewcnt;
	}

	public void setNviewcnt(int nviewcnt) {
		this.nviewcnt = nviewcnt;
	}

	public int getNreplycnt() {
		return nreplycnt;
	}

	public void setNreplycnt(int nreplycnt) {
		this.nreplycnt = nreplycnt;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "NoticeVO [nbno=" + nbno + ", nname=" + nname + ", ncontent=" + ncontent + ", nwriter=" + nwriter
				+ ", nregdate=" + nregdate + ", nviewcnt=" + nviewcnt + ", nreplycnt=" + nreplycnt + ", files="
				+ Arrays.toString(files) + "]";
	}
	
}
