package com.dto.classpage;

public class ContentDTO {
	int classNum;
	String con_class;
	String con_tutor;
	String con_attention;
	String con_notice;
	
	public ContentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ContentDTO(int classNum, String con_class, String con_tutor, String con_attention, String con_notice) {
		super();
		this.classNum = classNum;
		this.con_class = con_class;
		this.con_tutor = con_tutor;
		this.con_attention = con_attention;
		this.con_notice = con_notice;
	}

	public int getClassNum() {
		return classNum;
	}

	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}

	public String getCon_class() {
		return con_class;
	}

	public void setCon_class(String con_class) {
		this.con_class = con_class;
	}

	public String getCon_tutor() {
		return con_tutor;
	}

	public void setCon_tutor(String con_tutor) {
		this.con_tutor = con_tutor;
	}

	public String getCon_attention() {
		return con_attention;
	}

	public void setCon_attention(String con_attention) {
		this.con_attention = con_attention;
	}

	public String getCon_notice() {
		return con_notice;
	}

	public void setCon_notice(String con_notice) {
		this.con_notice = con_notice;
	}

	@Override
	public String toString() {
		return "ContentDTO [classNum=" + classNum + ", con_class=" + con_class + ", con_tutor=" + con_tutor
				+ ", con_attention=" + con_attention + ", con_notice=" + con_notice + "]";
	}
	
}
