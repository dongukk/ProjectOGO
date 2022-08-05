package com.dto.classpage;

public class ClassDTO {
	int classNum;
	String className;
	String userId;
	String category;
	int price;
	String schedule;
	String place;
	
	public ClassDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ClassDTO(int classNum, String className, String userId, String category, int price, String schedule,
			String place) {
		super();
		this.classNum = classNum;
		this.className = className;
		this.userId = userId;
		this.category = category;
		this.price = price;
		this.schedule = schedule;
		this.place = place;
	}
	@Override
	public String toString() {
		return "ClassDTO [classNum=" + classNum + ", className=" + className + ", userId=" + userId + ", category="
				+ category + ", price=" + price + ", schedule=" + schedule + ", place=" + place + "]";
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	
	
	
}
