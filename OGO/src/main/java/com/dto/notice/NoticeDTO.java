package com.dto.notice;

public class NoticeDTO {
	int Nnum;
	String Nickname;
	String Ntitle;
	String Ncontent;
	String Ndate;
	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeDTO(int nnum, String nickname, String ntitle, String ncontent, String ndate) {
		super();
		Nnum = nnum;
		Nickname = nickname;
		Ntitle = ntitle;
		Ncontent = ncontent;
		Ndate = ndate;
	}
	@Override
	public String toString() {
		return "NoticeDTO [Nnum=" + Nnum + ", Nickname=" + Nickname + ", Ntitle=" + Ntitle + ", Ncontent=" + Ncontent
				+ ", Ndate=" + Ndate + "]";
	}
	public int getNnum() {
		return Nnum;
	}
	public void setNnum(int nnum) {
		Nnum = nnum;
	}
	public String getNickname() {
		return Nickname;
	}
	public void setNickname(String nickname) {
		Nickname = nickname;
	}
	public String getNtitle() {
		return Ntitle;
	}
	public void setNtitle(String ntitle) {
		Ntitle = ntitle;
	}
	public String getNcontent() {
		return Ncontent;
	}
	public void setNcontent(String ncontent) {
		Ncontent = ncontent;
	}
	public String getNdate() {
		return Ndate;
	}
	public void setNdate(String ndate) {
		Ndate = ndate;
	}
		 
}
