package com.dao.classpage;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.classpage.ClassDTO;

public class ClassDAO {

	public ClassDTO select(SqlSession session, int classNum) {
		ClassDTO dto =session.selectOne("ClassMapper.select", classNum);
		return dto;
	}

	public String selectNickName(SqlSession session, String userId) {
		String name =session.selectOne("ClassMapper.selectNickName", userId);
		return name;
	}
	
	public HashMap selectContent(SqlSession session, int classNum) {
		HashMap con_class = session.selectOne("ContentMapper.selectContent", classNum);
		return con_class;
	}



//	public String selectClass(SqlSession session, String classId) {
//		String con_class = session.selectOne("ClassMapper.selectClass", classId);
//		return con_class;
//	}

}
