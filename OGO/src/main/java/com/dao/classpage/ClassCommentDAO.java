package com.dao.classpage;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.classpage.ClassCommentDTO;
import com.dto.classpage.ClassComment_rowDTO;

public class ClassCommentDAO {

	public List<ClassCommentDTO> view(SqlSession session) {
		List<ClassCommentDTO> list = session.selectList("ClassCommentMapper.view");
		return list;
	}

	public ClassComment_rowDTO selectPage(SqlSession session, int currentPage) {
		ClassComment_rowDTO cmt_rowDTO = new ClassComment_rowDTO();
		int perPage = cmt_rowDTO.getCommentPage();
		int offset = (currentPage - 1) * perPage;

		System.out.println(offset+""+perPage);
		
		List<ClassCommentDTO> list = session.selectList("ClassCommentMapper.view_page", null ,new RowBounds(offset,perPage));
		
		cmt_rowDTO.setCurrentPage(currentPage);
		cmt_rowDTO.setList(list);
		cmt_rowDTO.setTotalCount( totalcount(session) );
		return cmt_rowDTO;
	}

	private int totalcount(SqlSession session) {
		int count = session.selectOne("ClassCommentMapper.view");
		System.out.println(count);
		return count;
	}

	
	
	
}//end class
