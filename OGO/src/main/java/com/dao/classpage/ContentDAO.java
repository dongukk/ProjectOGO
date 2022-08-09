package com.dao.classpage;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

public class ContentDAO {

	public HashMap selectContent(SqlSession session, int classNum) {
		HashMap con_class = session.selectOne("ContentMapper.selectContent", classNum);
		return con_class;
	}

	public int saveContent(SqlSession session, HashMap<String, Object> contentMap) {
		int num=session.insert("ContentMapper.saveContent", contentMap);
		return num;
	}
}
