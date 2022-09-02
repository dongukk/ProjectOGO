package com.service.ClassList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.ClassList.MySqlSessionFactory;
import com.dao.ClassList.ClassListDao;
import com.dto.ClassList.ClassListDto;

public class ClassListService {

	static ClassListDao dao = new ClassListDao();
	public static List<ClassListDto>view(){
		SqlSession session = MySqlSessionFactory.getSession();	
	      List<ClassListDto> list =null;
	      try {
	         list = dao.view(session);
	      } finally {
	         session.close();
	      }
	      return list;
	   }
	
}