package com.service.classpage;

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
	
	
}
