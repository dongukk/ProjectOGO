package com.dao.classpage;

import org.apache.ibatis.session.SqlSession;

import com.dto.classpage.ClassOrderDTO;

public class ClassOrderDAO {

	public int classOrder(SqlSession session, ClassOrderDTO oDTO) {
		int num=session.insert("ClassOrderMapper.classOrder", oDTO);
		return num;
	}

}
