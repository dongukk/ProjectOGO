package com.service.classpage;

import java.util.HashMap;

import com.dao.classpage.ClassInsertDAO;

public class ClassInsertService {
	ClassInsertDAO insertDAO;
	
	public ClassInsertService() {
		insertDAO= new ClassInsertDAO();
	}

	public int insert(HashMap resultMap) {
		int insertResult= insertDAO.insert(resultMap);
		return insertResult;
	}

}
