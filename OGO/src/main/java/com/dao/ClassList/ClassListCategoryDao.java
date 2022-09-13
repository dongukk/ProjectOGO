package com.dao.ClassList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.controller.ClassListServlet.ClassListCategoryServlet;
import com.dto.ClassList.ClassListDto;

public class ClassListCategoryDao {

	
	
	public List<ClassListCategoryServlet> classB(SqlSession session, String subcategory) {
		List<ClassListCategoryServlet> list = session.selectList("ClassListCategoryMapper.classB",subcategory);
		return list;
	}

	
}
