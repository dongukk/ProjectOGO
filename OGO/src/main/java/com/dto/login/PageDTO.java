package com.dto.login;

import java.util.List;

public class PageDTO {
	private int curPage;
	private int perPage = 10;
	private int totalCount;
	private List<MemberDTO> list;
	
	
	public PageDTO(int curPage, int perPage, int totalCount, List<MemberDTO> list) {
		super();
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalCount = totalCount;
		this.list = list;
	}
	public PageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "PageDTO [curPage=" + curPage + ", perPage=" + perPage + ", totalCount=" + totalCount + ", list=" + list
				+ "]";
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public List<MemberDTO> getList() {
		return list;
	}
	public void setList(List<MemberDTO> list) {
		this.list = list;
	}
	
	
	
	
}
