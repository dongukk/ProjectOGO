package com.dto.classpage;

import java.util.List;

public class ClassCommentPageDTO {

	int curPage;
	int perPage =3;
	int totalPage;
	List<ClassCommentDTO> list;
	public ClassCommentPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ClassCommentPageDTO(int curPage, int perPage, int totalPage, List<ClassCommentDTO> list) {
		super();
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalPage = totalPage;
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
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<ClassCommentDTO> getList() {
		return list;
	}
	public void setList(List<ClassCommentDTO> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "ClassCommentPageDTO [curPage=" + curPage + ", perPage=" + perPage + ", totalPage=" + totalPage
				+ ", list=" + list + "]";
	}
	
	
	
	
}//end class
