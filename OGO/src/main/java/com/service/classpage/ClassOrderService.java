package com.service.classpage;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.classpage.MySqlSessionFactory;
import com.dao.classpage.ClassOrderDAO;
import com.dto.classpage.ClassOrderDTO;

public class ClassOrderService {
	ClassOrderDAO dao;

	public int classOrder(ClassOrderDTO oDTO) {
		SqlSession session= MySqlSessionFactory.getSession();
		int num=0;
		try {
			dao= new ClassOrderDAO();
			num =dao.classOrder(session, oDTO);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return num;
	}

	public int findOrder(ClassOrderDTO prevDTO) {
		SqlSession session= MySqlSessionFactory.getSession();
		int num=0;
		try {
			dao= new ClassOrderDAO();
			num =dao.findOrder(session, prevDTO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return num;
	}

	public int findSched(HashMap<String, Object> map) {
		System.out.println("schedule: "+map.get("sched"));
//		System.out.println("classNum: "+map.get("classNum"));
//		System.out.println("userId: "+map.get("userId"));
		SqlSession session= MySqlSessionFactory.getSession();
		int num=0;
		try {
			dao= new ClassOrderDAO();
			num =dao.findSched(session, map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return num;
	}

	public ClassOrderDTO findSched2(HashMap<String, Object> map) {
		SqlSession session= MySqlSessionFactory.getSession();
		ClassOrderDTO orderDTO = null;
		try {
			dao= new ClassOrderDAO();
			orderDTO =dao.findSched2(session, map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return orderDTO;
	}

	public HashMap findRecord(HashMap<String, Object> map) {
		SqlSession session= MySqlSessionFactory.getSession();
		HashMap resultMap = null;
		try {
			dao= new ClassOrderDAO();
			resultMap =dao.findRecord(session, map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return resultMap;
	}
	
	
}
