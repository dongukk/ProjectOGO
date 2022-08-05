package com.dto.notice;

public class FaqDTO {
	String faqnum;
	String faqtitle;
	String faqcontent;
	
	public String getFaqnum() {
		return faqnum;
	}

	public void setFaqnum(String faqnum) {
		this.faqnum = faqnum;
	}

	public String getFaqtitle() {
		return faqtitle;
	}

	public void setFaqtitle(String faqtitle) {
		this.faqtitle = faqtitle;
	}

	public String getFaqcontent() {
		return faqcontent;
	}

	public void setFaqcontent(String faqcontent) {
		this.faqcontent = faqcontent;
	}

	@Override
	public String toString() {
		return "FaqDTO [faqnum=" + faqnum + ", faqtitle=" + faqtitle + ", faqcontent=" + faqcontent + "]";
	}

	public FaqDTO(String faqnum, String faqtitle, String faqcontent) {
		super();
		this.faqnum = faqnum;
		this.faqtitle = faqtitle;
		this.faqcontent = faqcontent;
	}

	public FaqDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
