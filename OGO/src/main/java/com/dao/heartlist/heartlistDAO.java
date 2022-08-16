package com.dao.heartlist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.classpage.ClassDTO;
import com.dto.heartlist.heartlistDTO;

public class heartlistDAO {

	
	public List<heartlistDTO> heartList(SqlSession session, String userid) {
		List<heartlistDTO> list=session.selectList("heartlistMapper.heartList", userid);
		return list;
	}

	
	
	
	
	
	public int heartlistdel(SqlSession session, int num) {
		int n=session.delete("heartlistMapper.heartlistdel", num);
		return n;
	}






	public int heartlistdelall(SqlSession session, List<String> list) {
		int n = session.delete("heartlistMapper.heartlistdelall", list);
		return n;
	}
	
	
	
	
	
	
	
	
	
	
}
