package com.dao.classpage;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.classpage.ClassOrderDTO;

public class ClassOrderDAO {

	public int classOrder(SqlSession session, ClassOrderDTO oDTO) {
		int num=session.insert("ClassOrderMapper.classOrder", oDTO);
		return num;
	}

	public int findOrder(SqlSession session, ClassOrderDTO prevDTO) {
		int num= session.selectOne("ClassOrderMapper.findOrder", prevDTO);
		return num;
	}

	public int findSched(SqlSession session, HashMap<String, Object> map) {
		int num= session.selectOne("ClassOrderMapper.findSched", map);
		return num;
	}

	public ClassOrderDTO findSched2(SqlSession session, HashMap<String, Object> map) {
		ClassOrderDTO orderDTO= session.selectOne("ClassOrderMapper.findSched2", map);
		return orderDTO;
	}

	public HashMap findRecord(SqlSession session, HashMap<String, Object> map) {
		List<HashMap> list=session.selectList("findRecord", map);
		HashMap resultMap= list.get(0);
		System.out.println(resultMap);
		return resultMap;
	}

}
