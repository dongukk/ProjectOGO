package com.service.classpage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.classcomment.MySqlSessionFactory;
import com.dao.classpage.ClassCommentDAO;
import com.dto.classpage.ClassCommentDTO;

public class ClassCommentService {
	public static List<ClassCommentDTO> view() {
		ClassCommentDAO dao = new ClassCommentDAO();
		SqlSession session =MySqlSessionFactory.getSession();
		List<ClassCommentDTO> list =null;
		try {
			list = dao.view(session);
		} finally {
			session.close();
		}
		return list;
	}


	
	
	
}//end class
