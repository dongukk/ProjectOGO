package com.service.classpage;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.classpage.MySqlSessionFactory;
import com.dao.classpage.ClassDAO;
import com.dto.classpage.ClassDTO;
import com.dto.classpage.ClassImgDTO;

public class ClassService {
	ClassDAO dao;
	
//	public ClassService() {
//		dao= new ClassDAO();
//	}
	
	public ClassDTO selectClass(int classNum) {
		
		SqlSession session= MySqlSessionFactory.getSession();
		ClassDTO dto= null;
		try {
			dao= new ClassDAO();
			dto= dao.selectClass(session, classNum);
		} finally {
			session.close();
		}
		return dto;
	}

	public String selectNickName(String tuterId) {
		
		SqlSession session= MySqlSessionFactory.getSession();
		String name="";
		try {
			dao= new ClassDAO();
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
	


	public int classOpen(ClassDTO cDTO) {
		SqlSession session= MySqlSessionFactory.getSession();
		int num=0;
		try {
			dao= new ClassDAO();
			num= dao.classOpen(session, cDTO);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int searchClassNum(HashMap<String, String> map) {
		SqlSession session= MySqlSessionFactory.getSession();
		int num=0;
		try {
			dao= new ClassDAO();
			num= dao.searchClassNum(session, map);
		} finally {
			session.close();
		}
		return num;
	}

	public ClassImgDTO getImage(int classNum) {
		SqlSession session= MySqlSessionFactory.getSession();
		ClassImgDTO imgDTO= null;
		try {
			dao= new ClassDAO();
			imgDTO= dao.getImage(session, classNum);
		} finally {
			session.close();
		}
		return imgDTO;
	}

	public int searchClassName(HashMap<String, Object> map) {
		SqlSession session= MySqlSessionFactory.getSession();
		int num=0;
		try {
			dao= new ClassDAO();
			num= dao.searchClassName(session, map);
		} finally {
			session.close();
		}
		return num;
	}

	public String getTintroduce(String userId) {
		SqlSession session= MySqlSessionFactory.getSession();
		String tintroduce= null;
		try {
			dao= new ClassDAO();
			tintroduce= dao.getTintroduce(session, userId);
		} finally {
			session.close();
		}
		return tintroduce;
	}

}
