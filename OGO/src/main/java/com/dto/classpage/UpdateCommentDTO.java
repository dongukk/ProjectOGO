package com.dto.classpage;

public class UpdateCommentDTO {
	int CLASSNUM;
	String userid;
	String comment_notice;
	String comment_date;
	public UpdateCommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UpdateCommentDTO(int cLASSNUM, String userid, String comment_notice, String comment_date) {
		super();
		CLASSNUM = cLASSNUM;
		this.userid = userid;
		this.comment_notice = comment_notice;
		this.comment_date = comment_date;
	}
	public int getCLASSNUM() {
		return CLASSNUM;
	}
	public void setCLASSNUM(int cLASSNUM) {
		CLASSNUM = cLASSNUM;
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
		return "UpdateCommentDTO [CLASSNUM=" + CLASSNUM + ", userid=" + userid + ", comment_notice=" + comment_notice
				+ ", comment_date=" + comment_date + "]";
	}
	
}
