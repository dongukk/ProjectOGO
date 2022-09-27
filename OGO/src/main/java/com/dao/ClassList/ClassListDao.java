package com.dao.ClassList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.ClassList.ClassListDto;

public class ClassListDao {

	public List<ClassListDto> view(SqlSession session) {
		List<ClassListDto> list = session.selectList("ClassListMapper.view");
		return list;
	}

	public static ClassListDao getInstance() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ClassListDto> selectAllProducts(String description) {
		// TODO Auto-generated method stub
		return null;
	}


	public List<ClassListDto> listsortdesc(SqlSession session, String listsort) {
		List<ClassListDto> list = session.selectList("ClassListMapper.listsortdesc");
		System.out.println("dao"+listsort);
		return list;
	}

	public List<ClassListDto> listsortasc(SqlSession session, String listsort) {
		List<ClassListDto> list = session.selectList("ClassListMapper.listsortasc");
		System.out.println("dao"+listsort);
		return list;
	}

	public List<ClassListDto> listsortdate(SqlSession session, String listsort) {
		List<ClassListDto> list = session.selectList("ClassListMapper.listsortdate");
		System.out.println("dao"+listsort);
		return list;
	}


	
}
