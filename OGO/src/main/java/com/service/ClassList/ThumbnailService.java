package com.service.ClassList;

import org.apache.ibatis.session.SqlSession;

import com.config.classpage.MySqlSessionFactory;
import com.dao.ClassList.ClassListCategoryDao;
import com.dao.ClassList.ThumbnailDAO;
import com.dto.ClassList.ThumbnailDTO;

public class ThumbnailService {
	ThumbnailDAO dao;

	public int uploadImg(ThumbnailDTO iDTO) {
		SqlSession session= MySqlSessionFactory.getSession();
		int num=0;
		try {
			dao= new ThumbnailDAO();
			num= dao.uploadImg(session, iDTO);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}
	
	

}
