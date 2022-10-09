package com.service.classpage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.config.classcomment.MySqlSessionFactory;
import com.dao.classpage.ClassCommentDAO;
import com.dto.classpage.ClassCommentDTO;
import com.dto.classpage.ClassCommentPageDTO;
import com.dto.classpage.DeleteCommentDTO;
import com.dto.classpage.UpdateCommentDTO;
import com.dto.notice.PageDTO;

public class ClassCommentService {
	static ClassCommentDAO dao = new ClassCommentDAO();
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
	public int cmtDelete(DeleteCommentDTO cmtdto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int n = 0;
		try {
			n = dao.cmtDelete(session,cmtdto);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}
	public ClassCommentPageDTO viewPage(int curpage) {
		SqlSession session = MySqlSessionFactory.getSession();
		ClassCommentPageDTO dto = null;
		try {
			 dto = dao.viewPage(session,curpage);
		} finally {
			session.close();
		}
		
		return dto;
	}


	

	
	
}//end class
