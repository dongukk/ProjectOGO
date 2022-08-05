package com.dto.login;

import java.util.Arrays;

public class MemberDTO {

	private String userId;
	private String userPasswd;
	private String userName;
	private String nickname;
	private String gender;
	private String birth;
	private String phone1;
	private String phone2;
	private String phone3;
	private String post;
	private String address1;
	private String address2;
	private String email1;
	private String email2;
	private String profilePhoto;
	private String hobby;
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(String userId, String userPasswd, String userName, String nickname, String gender, String birth,
			String phone1, String phone2, String phone3, String post, String address1, String address2, String email1,
			String email2, String profilePhoto, String hobby) {
		super();
		this.userId = userId;
		this.userPasswd = userPasswd;
		this.userName = userName;
		this.nickname = nickname;
		this.gender = gender;
		this.birth = birth;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.post = post;
		this.address1 = address1;
		this.address2 = address2;
		this.email1 = email1;
		this.email2 = email2;
		this.profilePhoto = profilePhoto;
		this.hobby = hobby;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPasswd() {
		return userPasswd;
	}
	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getProfilePhoto() {
		return profilePhoto;
	}
	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", userPasswd=" + userPasswd + ", userName=" + userName + ", nickname="
				+ nickname + ", gender=" + gender + ", birth=" + birth + ", phone1=" + phone1 + ", phone2=" + phone2
				+ ", phone3=" + phone3 + ", post=" + post + ", address1=" + address1 + ", address2=" + address2
				+ ", email1=" + email1 + ", email2=" + email2 + ", profilePhoto=" + profilePhoto + ", hobby="
				+ hobby + "]";
	}

}
