package com.service.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.notice.MySqlSessionFactory;
import com.dao.notice.FaqDAO;
import com.dto.notice.FaqDTO;

public class FaqService {
	FaqDAO dao = new  FaqDAO();
	
	public List<FaqDTO> selectAll() {
		SqlSession session = MySqlSessionFactory.getSession();
		List<FaqDTO> list = null;
		try {
			list = dao.selectAll(session);
		} finally {
			session.close();
		}
		return list;
	}

}
