package com.service.notice;

import java.io.Console;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import com.config.notice.MySqlSessionFactory;
import com.dao.notice.LoginDAO;
import com.dto.notice.MemberDTO;

public class LoginService {

	LoginDAO dao = new  LoginDAO();
	
	public MemberDTO userid(String username) {
		SqlSession session = MySqlSessionFactory.getSession();
		MemberDTO dto = null;
		try {
			dto = dao.userid(session, username);
		} finally {
			session.close();
		}
		return dto;
	}

}
