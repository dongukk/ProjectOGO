package com.service.classpage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.classcomment.MySqlSessionFactory;
import com.dao.classpage.ClassCommentDAO;
import com.dto.classpage.ClassCommentDTO;
import com.dto.classpage.ClassComment_rowDTO;
import com.dto.classpage.UpdateCommentDTO;
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
	public int cmtAdd(ClassCommentDTO cmt_dto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			ClassCommentDAO dao = new ClassCommentDAO();
			n = dao.cmtAdd(session, cmt_dto);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}
	public int cmtUpdate(UpdateCommentDTO cmtupdatedto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.cmtUpdate(session,cmtupdatedto);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}
	public int cmtDelete(String classnum) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.cmtDelete(session,classnum);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	

	
	
}//end class
