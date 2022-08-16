package com.dto.heartlist;

public class heartlistDTO {
	int classNum;
	String className;
	int price;
	String userId;
	int num;
	
	
	public heartlistDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public heartlistDTO(int classNum, String className, int price, String userId, int num) {
		super();
		this.classNum = classNum;
		this.className = className;
		this.price = price;
		this.userId = userId;
		this.num = num;
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


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	@Override
	public String toString() {
		return "heartlistDTO [classNum=" + classNum + ", className=" + className + ", price=" + price + ", userId="
				+ userId + ", num=" + num + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}