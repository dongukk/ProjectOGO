package com.service.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.notice.MySqlSessionFactory;
import com.dao.notice.NoticeDAO;
import com.dto.notice.NoticeDTO;
import com.dto.notice.PageDTO;

public class NoticeService {
	NoticeDAO dao = new NoticeDAO();

	public List<NoticeDTO> selectAll() {
		SqlSession session = MySqlSessionFactory.getSession();
		List<NoticeDTO> list = null;
		try {
			list = dao.selectAll(session);
		} finally {
			session.close();
		}
		return list;
	}

	public NoticeDTO selectContent(String nnum) {
		SqlSession session = MySqlSessionFactory.getSession();
		NoticeDTO dto = null;
		try {
			dto = dao.selectContent(session,nnum);
		} finally {
			session.close();
		}
		return dto;
	}

	public PageDTO selectP(int curPage) {
		SqlSession session = MySqlSessionFactory.getSession();
		PageDTO pDTO = null;
		try {
			pDTO = dao.selectP(session,curPage);
		} finally {
			session.close();
		}
		return pDTO;
	}

	public int new_notice(NoticeDTO ndto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int Cnum = 0;
		try {
			Cnum = dao.new_notice(session,ndto);
			session.commit();
		} finally {
			session.close();
		}
		return Cnum;
	}

	public int update(NoticeDTO ndto) {
		SqlSession session = MySqlSessionFactory.getSession();
		int num = 0;
		try {
			num = dao.update(session,ndto);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int delete(String nnum) {
		SqlSession session = MySqlSessionFactory.getSession();
		int num = 0;
		try {
			num = dao.delete(session,nnum);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

}
