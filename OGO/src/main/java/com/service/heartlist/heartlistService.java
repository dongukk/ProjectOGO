package com.service.heartlist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.classpage.MySqlSessionFactory;
import com.dao.heartlist.heartlistDAO;
import com.dto.heartlist.heartlistDTO;

public class heartlistService {

	public List<heartlistDTO> heartList(String userid) {

		SqlSession session=MySqlSessionFactory.getSession();
		List<heartlistDTO> list=null;
		try {
			heartlistDAO hdao=new heartlistDAO();
			list=hdao.heartList(session, userid);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}

		return list;
	}

	
	
	
	public int heartlistdel(int num) {
		
		SqlSession session=MySqlSessionFactory.getSession();
		int n=0;
		try {
			heartlistDAO dao=new heartlistDAO();
			n=dao.heartlistdel(session, num);
			session.commit();
		}finally {
			session.close();
		}
		
		return n;
	}



	
	

	public int heartlistdelall(List<String> list) {
		
		SqlSession session=MySqlSessionFactory.getSession();
		int n=0;
		try {
			heartlistDAO dao=new heartlistDAO();
			n=dao.heartlistdelall(session, list);
			session.commit();
		}finally {
			session.close();
		}
		
		return n;
	}

	
	
	
}
