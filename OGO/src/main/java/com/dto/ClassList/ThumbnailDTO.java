package com.dto.ClassList;

public class ThumbnailDTO {
	int classNum;
	String classPhoto1;
	String classPhoto2;
	String classPhoto3;
	String classPhoto4;
	String classPhoto5;
	
	public ThumbnailDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ThumbnailDTO(int classNum, String classPhoto1, String classPhoto2, String classPhoto3, String classPhoto4,
			String classPhoto5) {
		super();
		this.classNum = classNum;
		this.classPhoto1 = classPhoto1;
		this.classPhoto2 = classPhoto2;
		this.classPhoto3 = classPhoto3;
		this.classPhoto4 = classPhoto4;
		this.classPhoto5 = classPhoto5;
	}

	public int getClassNum() {
		return classNum;
	}

	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}

	public String getClassPhoto1() {
		return classPhoto1;
	}

	public void setClassPhoto1(String classPhoto1) {
		this.classPhoto1 = classPhoto1;
	}

	public String getClassPhoto2() {
		return classPhoto2;
	}

	public void setClassPhoto2(String classPhoto2) {
		this.classPhoto2 = classPhoto2;
	}

	public String getClassPhoto3() {
		return classPhoto3;
	}

	public void setClassPhoto3(String classPhoto3) {
		this.classPhoto3 = classPhoto3;
	}

	public String getClassPhoto4() {
		return classPhoto4;
	}

	public void setClassPhoto4(String classPhoto4) {
		this.classPhoto4 = classPhoto4;
	}

	public String getClassPhoto5() {
		return classPhoto5;
	}

	public void setClassPhoto5(String classPhoto5) {
		this.classPhoto5 = classPhoto5;
	}

	@Override
	public String toString() {
		return "ThumbnailDTO [classNum=" + classNum + ", classPhoto1=" + classPhoto1 + ", classPhoto2=" + classPhoto2
				+ ", classPhoto3=" + classPhoto3 + ", classPhoto4=" + classPhoto4 + ", classPhoto5=" + classPhoto5
				+ "]";
	}
	
	
	

}
