package com.service.classpage;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.classpage.MySqlSessionFactory;
import com.dao.classpage.ClassDAO;
import com.dao.classpage.ContentDAO;

public class ContentService {

	ContentDAO dao;
	
	public HashMap selectContent(int classNum) {
		SqlSession session= MySqlSessionFactory.getSession();
		HashMap con_class = null;
		try {
			dao= new ContentDAO();
			con_class= dao.selectContent(session, classNum);
		} finally {
			session.close();
		}
		return con_class;
	}

	public int saveContent(HashMap<String, Object> contentMap) {
		SqlSession session= MySqlSessionFactory.getSession();
		int num=0;
		try {
			dao= new ContentDAO();
			num= dao.saveContent(session, contentMap);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}
}
