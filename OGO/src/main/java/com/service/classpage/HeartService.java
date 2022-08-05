package com.service.classpage;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.classpage.MySqlSessionFactory;
import com.dao.classpage.HeartDAO;

public class HeartService {
	
	HeartDAO dao;
	
	public HeartService() {
		dao= new HeartDAO();
	}

	public int heartSearch(HashMap<String, Object> map) {
		SqlSession session= MySqlSessionFactory.getSession();
		int n=0;
		try {
			n= dao.heartSearch(session, map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;
	}
	public int heartCount(int classNum) { //클래스가 찜 된 개수
		SqlSession session= MySqlSessionFactory.getSession();
		int n=0;
		try {
			n= dao.heartCount(session, classNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;
	}

	public int heartdelete(HashMap<String, Object> map) {
		SqlSession session= MySqlSessionFactory.getSession();
		int n=0;
		try {
			n= dao.heartdelete(session, map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;
	}

	public int heartInsert(HashMap<String, Object> map) {
		SqlSession session= MySqlSessionFactory.getSession();
		int n=0;
		try {
			n= dao.heartInsert(session, map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return n;
	}

}
