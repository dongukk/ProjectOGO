package com.service.ClassList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.ClassList.MySqlSessionFactory;
import com.controller.ClassListServlet.ClassListCategoryServlet;
import com.dao.ClassList.ClassListCategoryDao;
import com.dao.ClassList.ClassListDao;
import com.dto.ClassList.ClassListDto;

public class ClassListCategoryService {

	static ClassListCategoryDao dao = new ClassListCategoryDao();

	
	public List<ClassListCategoryServlet> classB(String subcategory) {
		SqlSession session = MySqlSessionFactory.getSession();
		List<ClassListCategoryServlet> list = null;
		try {
			list = dao.classB(session,subcategory);
		} finally {
			session.close();
		}
		return list;
	}
	
}