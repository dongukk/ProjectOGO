package com.dto.ClassList;

public class ClassListCategoryDto {
	
	int classNum;
	String className;
	String userId;
	int price;
	String schedule1;
	String place;
	String subcategory;
	String cate_id;
	public ClassListCategoryDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ClassListCategoryDto(int classNum, String className, String userId, int price, String schedule1,
			String place, String subcategory, String cate_id) {
		super();
		this.classNum = classNum;
		this.className = className;
		this.userId = userId;
		this.price = price;
		this.schedule1 = schedule1;
		this.place = place;
		this.subcategory = subcategory;
		this.cate_id = cate_id;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSchedule1() {
		return schedule1;
	}
	public void setSchedule1(String schedule1) {
		this.schedule1 = schedule1;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public String getCate_id() {
		return cate_id;
	}
	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}
	@Override
	public String toString() {
		return "ClassListCategoryDto [classNum=" + classNum + ", className=" + className + ", userId=" + userId
				+ ", price=" + price + ", schedule1=" + schedule1 + ", place=" + place + ", subcategory=" + subcategory
				+ ", cate_id=" + cate_id + "]";
	}
	
	
	
}//end class