package com.dto.classpage;

public class ClassOrderDTO {
	public int orderNum;
	public String userId;
	public int classNum;
	public int price;
	public String orderDate;
	public String orderStatus;
	public String schedule1;
	public String schedule2;
	public String schedule3;
	public String schedule4;
	public String schedule5;
	public String schedule6;
	public String schedule7;
	public String schedule8;
	public String schedule9;
	public String schedule10;
	
	public ClassOrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ClassOrderDTO(int orderNum, String userId, int classNum, int price, String orderDate, String orderStatus,
			String schedule1, String schedule2, String schedule3, String schedule4, String schedule5, String schedule6,
			String schedule7, String schedule8, String schedule9, String schedule10) {
		super();
		this.orderNum = orderNum;
		this.userId = userId;
		this.classNum = classNum;
		this.price = price;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.schedule1 = schedule1;
		this.schedule2 = schedule2;
		this.schedule3 = schedule3;
		this.schedule4 = schedule4;
		this.schedule5 = schedule5;
		this.schedule6 = schedule6;
		this.schedule7 = schedule7;
		this.schedule8 = schedule8;
		this.schedule9 = schedule9;
		this.schedule10 = schedule10;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getClassNum() {
		return classNum;
	}

	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getSchedule1() {
		return schedule1;
	}

	public void setSchedule1(String schedule1) {
		this.schedule1 = schedule1;
	}

	public String getSchedule2() {
		return schedule2;
	}

	public void setSchedule2(String schedule2) {
		this.schedule2 = schedule2;
	}

	public String getSchedule3() {
		return schedule3;
	}

	public void setSchedule3(String schedule3) {
		this.schedule3 = schedule3;
	}

	public String getSchedule4() {
		return schedule4;
	}

	public void setSchedule4(String schedule4) {
		this.schedule4 = schedule4;
	}

	public String getSchedule5() {
		return schedule5;
	}

	public void setSchedule5(String schedule5) {
		this.schedule5 = schedule5;
	}

	public String getSchedule6() {
		return schedule6;
	}

	public void setSchedule6(String schedule6) {
		this.schedule6 = schedule6;
	}

	public String getSchedule7() {
		return schedule7;
	}

	public void setSchedule7(String schedule7) {
		this.schedule7 = schedule7;
	}

	public String getSchedule8() {
		return schedule8;
	}

	public void setSchedule8(String schedule8) {
		this.schedule8 = schedule8;
	}

	public String getSchedule9() {
		return schedule9;
	}

	public void setSchedule9(String schedule9) {
		this.schedule9 = schedule9;
	}

	public String getSchedule10() {
		return schedule10;
	}

	public void setSchedule10(String schedule10) {
		this.schedule10 = schedule10;
	}
	
	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "ClassOrderDTO [orderNum=" + orderNum + ", userId=" + userId + ", classNum=" + classNum + ", price="
				+ price + ", orderDate=" + orderDate + ", orderStatus=" + orderStatus + ", schedule1=" + schedule1
				+ ", schedule2=" + schedule2 + ", schedule3=" + schedule3 + ", schedule4=" + schedule4 + ", schedule5="
				+ schedule5 + ", schedule6=" + schedule6 + ", schedule7=" + schedule7 + ", schedule8=" + schedule8
				+ ", schedule9=" + schedule9 + ", schedule10=" + schedule10 + "]";
	}

}
