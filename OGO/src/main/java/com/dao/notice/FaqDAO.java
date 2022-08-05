package com.dao.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.notice.FaqDTO;

public class FaqDAO {

	public List<FaqDTO> selectAll(SqlSession session) {
		List<FaqDTO> list = session.selectList("faqMapper.selectAll");
		return list;
	}

}
