package com.service.classpage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.classcomment.MySqlSessionFactory;
import com.dao.classpage.ClassCommentDAO;
import com.dto.classpage.ClassCommentDTO;
import com.dto.classpage.ClassComment_rowDTO;
import com.dto.notice.PageDTO;

public class ClassCommentService {
	static ClassCommentDAO dao = new ClassCommentDAO();
	public static List<ClassCommentDTO> view() {
		SqlSession session =MySqlSessionFactory.getSession();
		List<ClassCommentDTO> list =null;
		try {
			list = dao.view(session);
		} finally {
			session.close();
		}
		return list;
	}

	

	public ClassComment_rowDTO selectPage(int currentPage) {
		SqlSession session = MySqlSessionFactory.getSession();
		ClassComment_rowDTO cmt_rowDTO = null;
		try {
			cmt_rowDTO = dao.selectPage(session,currentPage);
		} finally {
			session.close();
		}
		return cmt_rowDTO;

	}


	
	
	
}//end class
