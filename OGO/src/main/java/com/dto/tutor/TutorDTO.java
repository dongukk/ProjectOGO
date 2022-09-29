package com.dto.tutor;

public class TutorDTO {
	String timg;
	String tname;
	String tcertificate;
	String tcategory_id;
	String tintroduce;
	String userid;
	
	public TutorDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TutorDTO(String timg, String tname, String tcertificate, String tcategory_id, String tintroduce,
			String userid) {
		super();
		this.timg = timg;
		this.tname = tname;
		this.tcertificate = tcertificate;
		this.tcategory_id = tcategory_id;
		this.tintroduce = tintroduce;
		this.userid = userid;
	}
	public String getTimg() {
		return timg;
	}
	public void setTimg(String timg) {
		this.timg = timg;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTcertificate() {
		return tcertificate;
	}
	public void setTcertificate(String tcertificate) {
		this.tcertificate = tcertificate;
	}
	public String getTcategory_id() {
		return tcategory_id;
	}
	public void setTcategory_id(String tcategory_id) {
		this.tcategory_id = tcategory_id;
	}
	public String getTintroduce() {
		return tintroduce;
	}
	public void setTintroduce(String tintroduce) {
		this.tintroduce = tintroduce;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "TutorDTO [timg=" + timg + ", tname=" + tname + ", tcertificate=" + tcertificate + ", tcategory_id="
				+ tcategory_id + ", tintroduce=" + tintroduce + ", userid=" + userid + "]";
	}

	
	
	
	
	
	
	
}
