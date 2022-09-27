package com.service.pay;

import java.util.List;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import com.config.pay.MySqlSessionFactory;
import com.dao.pay.PayDAO;
import com.dto.login.MemberDTO;
import com.dto.pay.PayDTO;

public class PayService {
	PayDAO dao = new PayDAO();
	
	public PayDTO selectOrder(String ordernum) {
		SqlSession session = MySqlSessionFactory.getSession();
		PayDTO dto = null;
		try {
			dto = dao.selectOrder(session, ordernum);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		return dto;
	}

	public int COS(String orderNum) {
		SqlSession session = MySqlSessionFactory.getSession();
		int COS = 0;
		try {
			COS = dao.COS(session, orderNum);
		} finally {
			session.commit();
			session.close();
		}
		return COS;
	}

	public List<PayDTO> getPaylist(String userId) {
		SqlSession session = MySqlSessionFactory.getSession();
		List<PayDTO> list = null;
		try {
			list = dao.getPaylist(session,userId);
		} finally {
			session.close();
		}
		return list;
	}




	
}
