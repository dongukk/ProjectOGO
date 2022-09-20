package com.dto.login;

import java.util.List;

public class PageDTO {

	private List<MemberDTO> list;   // 현재페이지에 들어갈 레코드를 perPage만큼만 저장 
	private int curPage;    //현재 볼 페이지 번호 
	private int perPage=6;  //한페이지에 보여질 목록 수 
	private int totalCount; //전체 레코드 갯수 
	public List<MemberDTO> getList() {
		return list;
	}
	public void setList(List<MemberDTO> list) {
		this.list = list;
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
	
	
}
