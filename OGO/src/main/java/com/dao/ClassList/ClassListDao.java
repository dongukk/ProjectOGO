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

	
}
