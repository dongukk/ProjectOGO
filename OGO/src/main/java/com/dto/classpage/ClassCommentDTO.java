package com.dto.classpage;

public class ClassCommentDTO {

	int comment_no;
	String comment_notice;
	String comment_date;
	public ClassCommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ClassCommentDTO(int comment_no, String comment_notice, String comment_date) {
		super();
		this.comment_no = comment_no;
		this.comment_notice = comment_notice;
		this.comment_date = comment_date;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public String getComment_notice() {
		return comment_notice;
	}
	public void setComment_notice(String comment_notice) {
		this.comment_notice = comment_notice;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	@Override
	public String toString() {
		return "ClassCommentDTO [comment_no=" + comment_no + ", comment_notice=" + comment_notice + ", comment_date="
				+ comment_date + "]";
	}
	
	
	
}//end class
