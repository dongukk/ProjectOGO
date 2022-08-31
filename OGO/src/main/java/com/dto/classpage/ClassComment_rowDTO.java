package com.dto.classpage;

import java.util.List;

public class ClassComment_rowDTO {

	private int totalCount; // 전체 게시글 수 (get)
	private int currentPage; // 현재 페이지 (get)
	private int totalPage; // 전체 페이지 수 (get)
	private List<ClassCommentDTO> list;
	
	//pagination
	private int commentPage = 5; // 한 페이지에 몇 개의 페이지 (선택 set)
	private int commentRow = 3; // 한 페이지에 몇 개의 로우 (선택 set)
	private int startPage; // 페이징 시작 페이지 수
	private int endPage;
	public ClassComment_rowDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ClassComment_rowDTO(int totalCount, int currentPage, int totalPage, List<ClassCommentDTO> list,
			int commentPage, int commentRow, int startPage, int endPage) {
		super();
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.totalPage = totalPage;
		this.list = list;
		this.commentPage = commentPage;
		this.commentRow = commentRow;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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
	public int getCommentPage() {
		return commentPage;
	}
	public void setCommentPage(int commentPage) {
		this.commentPage = commentPage;
	}
	public int getCommentRow() {
		return commentRow;
	}
	public void setCommentRow(int commentRow) {
		this.commentRow = commentRow;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	@Override
	public String toString() {
		return "ClassCommnet_rowDTO [totalCount=" + totalCount + ", currentPage=" + currentPage + ", totalPage="
				+ totalPage + ", list=" + list + ", commentPage=" + commentPage + ", commentRow=" + commentRow
				+ ", startPage=" + startPage + ", endPage=" + endPage + "]";
	} 
	
	
	
	
}//class
