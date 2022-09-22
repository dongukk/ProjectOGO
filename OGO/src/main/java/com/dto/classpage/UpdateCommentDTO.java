package com.dto.classpage;

public class UpdateCommentDTO {
	int CLASSNUM;
	String userid;
	String textarea;
	public UpdateCommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UpdateCommentDTO(int cLASSNUM, String userid, String textarea) {
		super();
		CLASSNUM = cLASSNUM;
		this.userid = userid;
		this.textarea = textarea;
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
	public String getTextarea() {
		return textarea;
	}
	public void setTextarea(String textarea) {
		this.textarea = textarea;
	}
	@Override
	public String toString() {
		return "UpdateCommentDTO [CLASSNUM=" + CLASSNUM + ", userid=" + userid + ", textarea=" + textarea + "]";
	}
	
	
}
