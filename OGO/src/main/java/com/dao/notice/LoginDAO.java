package com.dao.notice;

import org.apache.ibatis.session.SqlSession;

import com.dto.notice.MemberDTO;

public class LoginDAO {

	public MemberDTO userid(SqlSession session, String username) {
		MemberDTO dto = session.selectOne("loginMapper.userid",username);
		return dto;
	}

}
