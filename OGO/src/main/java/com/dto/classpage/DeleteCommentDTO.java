package com.dto.classpage;

public class DeleteCommentDTO {

	int classnum;
	String userid;
	public DeleteCommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DeleteCommentDTO(int classnum, String userid) {
		super();
		this.classnum = classnum;
		this.userid = userid;
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
	@Override
	public String toString() {
		return "DeleteCommentDTO [classnum=" + classnum + ", userid=" + userid + "]";
	}
	
	
	
	
}//end class
