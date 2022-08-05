package com.dto.notice;

public class MemberDTO {
	public String userid;
	public String userpasswd;
	public String username;
	public String nickname;
	public String gender;
	
	public String birth;
	public String phone1;
	public String phone2;
	public String phone3;
	public String post;
	
	public String address1;
	public String address2;
	public String email1;
	public String email2;
	public String profilePhoth;
	public String hobby;
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(String userid, String userpasswd, String username, String nickname, String gender, String birth,
			String phone1, String phone2, String phone3, String post, String address1, String address2, String email1,
			String email2, String profilePhoth, String hobby) {
		super();
		this.userid = userid;
		this.userpasswd = userpasswd;
		this.username = username;
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
		this.profilePhoth = profilePhoth;
		this.hobby = hobby;
	}
	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", userpasswd=" + userpasswd + ", username=" + username + ", nickname="
				+ nickname + ", gender=" + gender + ", birth=" + birth + ", phone1=" + phone1 + ", phone2=" + phone2
				+ ", phone3=" + phone3 + ", post=" + post + ", address1=" + address1 + ", address2=" + address2
				+ ", email1=" + email1 + ", email2=" + email2 + ", profilePhoth=" + profilePhoth + ", hobby=" + hobby
				+ "]";
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpasswd() {
		return userpasswd;
	}
	public void setUserpasswd(String userpasswd) {
		this.userpasswd = userpasswd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getProfilePhoth() {
		return profilePhoth;
	}
	public void setProfilePhoth(String profilePhoth) {
		this.profilePhoth = profilePhoth;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	
	
}
