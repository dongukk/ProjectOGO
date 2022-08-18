package com.service.classpage;

import org.apache.ibatis.session.SqlSession;

import com.config.classpage.MySqlSessionFactory;
import com.dao.classpage.ClassDAO;
import com.dao.classpage.ClassImgDAO;
import com.dto.classpage.ClassImgDTO;

public class ClassImgService {
	ClassImgDAO dao;

	public int uploadImg(ClassImgDTO iDTO) {
		SqlSession session= MySqlSessionFactory.getSession();
		int num=0;
		try {
			dao= new ClassImgDAO();
			num= dao.uploadImg(session, iDTO);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}
	
	

}
