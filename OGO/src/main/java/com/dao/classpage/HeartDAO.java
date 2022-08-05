package com.dao.classpage;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

public class HeartDAO {

	public int heartSearch(SqlSession session, HashMap<String, Object> map) {
		int num=session.selectOne("HeartMapper.heartSearch", map);
		return num;
	}

	public int heartdelete(SqlSession session, HashMap<String, Object> map) {
		int num =session.delete("HeartMapper.heartdelete", map);
		return num;
	}

	public int heartCount(SqlSession session, int classNum) {
		int count=session.selectOne("HeartMapper.heartCount", classNum);
		return count;
	}

	public int heartInsert(SqlSession session, HashMap<String, Object> map) {
		int num =session.delete("HeartMapper.heartInsert", map);
		return num;
	}

}
