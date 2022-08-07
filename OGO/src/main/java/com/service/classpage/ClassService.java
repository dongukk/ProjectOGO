package com.service.classpage;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.classpage.MySqlSessionFactory;
import com.dao.classpage.ClassDAO;
import com.dto.classpage.ClassDTO;

public class ClassService {
	ClassDAO dao;
	
	public ClassService() {
		dao= new ClassDAO();
	}
	
	public ClassDTO select(int classNum) {
		
		SqlSession session= MySqlSessionFactory.getSession();
		ClassDTO dto= null;
		try {
			dto= dao.select(session, classNum);
		} finally {
			session.close();
		}
		return dto;
	}

	public String selectNickName(String tuterId) {
		SqlSession session= MySqlSessionFactory.getSession();
		String name="";
		try {
			name= dao.selectNickName(session, tuterId);
		} finally {
			session.close();
		}
		return name;
	}

//	public String selectClass(String classId) {
//		SqlSession session= MySqlSessionFactory.getSession();
//		String con_class = null;
//		try {
//			con_class= dao.selectClass(session, classId);
//		} finally {
//			session.close();
//		}
//		return con_class;
//	}
	
	public HashMap selectContent(int classNum) {
		SqlSession session= MySqlSessionFactory.getSession();
		HashMap con_class = null;
		try {
			con_class= dao.selectContent(session, classNum);
		} finally {
			session.close();
		}
		return con_class;
	}

	public int classOpen(ClassDTO cDTO) {
		SqlSession session= MySqlSessionFactory.getSession();
		int num=0;
		try {
			num= dao.classOpen(session, cDTO);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

}
