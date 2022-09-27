package com.dto.pay;

public class paymentDTO {
	String date;
	String schedule;
	public paymentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public paymentDTO(String date, String schedule) {
		super();
		this.date = date;
		this.schedule = schedule;
	}
	@Override
	public String toString() {
		return "paymentDTO [date=" + date + ", schedule=" + schedule + "]";
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	
	
}
