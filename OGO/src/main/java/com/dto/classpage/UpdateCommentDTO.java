package com.dto.classpage;

public class UpdateCommentDTO {
	int classnum;
	String userid;
	String comment_notice;
	String comment_date;
	public UpdateCommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UpdateCommentDTO(int classnum, String userid, String comment_notice, String comment_date) {
		super();
		this.classnum = classnum;
		this.userid = userid;
		this.comment_notice = comment_notice;
		this.comment_date = comment_date;
	}
	public int getClassnum() {
		return classnum;
	}
	public void setClassnum(int classnum) {
		this.classnum = classnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
		return "UpdateCommentDTO [classnum=" + classnum + ", userid=" + userid + ", comment_notice=" + comment_notice
				+ ", comment_date=" + comment_date + "]";
	}
	
}
