package com.dao.classpage;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.classpage.ClassDTO;

public class ClassDAO {

	public ClassDTO selectClass(SqlSession session, int classNum) {
		ClassDTO dto =session.selectOne("ClassMapper.selectClass", classNum);
		return dto;
	}

	public String selectNickName(SqlSession session, String tuterId) {
		String name =session.selectOne("ClassMapper.selectNickName", tuterId);
		return name;
	}

	public int classOpen(SqlSession session, ClassDTO cDTO) {
		int num =session.insert("ClassMapper.classOpen", cDTO);
		return num;
	}

	public int searchClassNum(SqlSession session, HashMap<String, String> map) {
		int classNum= session.selectOne("ClassMapper.searchClassNum", map);
		return classNum;
	}

//	public String selectClass(SqlSession session, String classId) {
//		String con_class = session.selectOne("ClassMapper.selectClass", classId);
//		return con_class;
//	}

}
