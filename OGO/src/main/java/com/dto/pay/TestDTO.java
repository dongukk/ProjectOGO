package com.dto.pay;

public class TestDTO {
	String name;
	int age;
	public TestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TestDTO(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	@Override
	public String toString() {
		return "TestDTO [name=" + name + ", age=" + age + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
}
